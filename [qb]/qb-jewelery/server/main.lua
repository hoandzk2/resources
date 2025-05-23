local QBCore = exports['qb-core']:GetCoreObject()
local timeOut = false

local cachedPoliceAmount = {}
local flags = {}

-- Callback

QBCore.Functions.CreateCallback('qb-jewellery:server:getCops', function(source, cb)
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if (v.PlayerData.job.name == 'police' or v.PlayerData.job.type == 'leo') and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cachedPoliceAmount[source] = amount
    cb(amount)
end)

QBCore.Functions.CreateCallback('qb-jewellery:server:getVitrineState', function(_, cb)
    cb(Config.Locations)
end)

-- Functions

local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            QBCore.Functions.GetIdentifier(id, 'license'),
            QBCore.Functions.GetIdentifier(id, 'discord'),
            QBCore.Functions.GetIdentifier(id, 'ip'),
            reason,
            2147483647,
            'qb-jewelery'
        })
    TriggerEvent('qb-log:server:CreateLog', 'jewelery', 'Người chơi bị cấm', 'red',
        string.format('%s đã bị cấm bởi %s vì %s', GetPlayerName(id), 'qb-jewelery', reason), true)
    DropPlayer(id, 'Bạn đã bị máy chủ cấm vĩnh viễn: khai thác')
end

local function getRewardBasedOnProbability(table)
    local random, probability = math.random(), 0

    for k, v in pairs(table) do
        probability = probability + v.probability
        if random <= probability then
            return k
        end
    end

    return math.random(#table)
end

-- Events

RegisterNetEvent('qb-jewellery:server:setVitrineState', function(stateType, state, k)
    if stateType == 'isBusy' and type(state) == 'boolean' and Config.Locations[k] then
        Config.Locations[k][stateType] = state
        TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, stateType, state, k)
    end
end)

RegisterNetEvent('qb-jewellery:server:vitrineReward', function(vitrineIndex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cheating = false
    if Config.Locations[vitrineIndex] == nil or Config.Locations[vitrineIndex].isOpened ~= false then
        exploitBan(src, 'Cố gắng kích hoạt một sự kiện có thể khai thác \"qb-jewellery:server:vitrineReward\"')
        return
    end
    if cachedPoliceAmount[source] == nil then
        DropPlayer(src, 'Exploiting')
        return
    end
    local plrPed = GetPlayerPed(src)
    local plrCoords = GetEntityCoords(plrPed)
    local vitrineCoords = Config.Locations[vitrineIndex].coords
    if cachedPoliceAmount[source] >= Config.RequiredCops then
        if plrPed then
            local dist = #(plrCoords - vitrineCoords)
            if dist <= 25.0 then
                Config.Locations[vitrineIndex]['isOpened'] = true
                Config.Locations[vitrineIndex]['isBusy'] = false
                TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, 'isOpened', true, vitrineIndex)
                TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, 'isBusy', false, vitrineIndex)
                local item = getRewardBasedOnProbability(Config.VitrineRewards)
                local amount = math.random(Config.VitrineRewards[item]['amount']['min'], Config.VitrineRewards[item]['amount']['max'])
                if exports['qb-inventory']:AddItem(src, Config.VitrineRewards[item]['item'], amount, false, false, 'qb-jewellery:server:vitrineReward') then
                    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]['item']], 'add')
                else
                    TriggerClientEvent('QBCore:Notify', src, Lang:t('error.to_much'), 'error')
                end
            else
                cheating = true
            end
        end
    else
        cheating = true
    end
    if cheating then
        local license = Player.PlayerData.license
        if flags[license] then
            flags[license] = flags[license] + 1
        else
            flags[license] = 1
        end
        if flags[license] >= 3 then
            exploitBan('Bị gắn cờ nhiều lần khai thác \"qb-jewellery:server:vitrineReward\" event')
        else
            DropPlayer(src, 'Exploiting')
        end
    end
end)

RegisterNetEvent('qb-jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('qb-scoreboard:server:SetActivityBusy', 'jewellery', true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, _ in pairs(Config.Locations) do
                Config.Locations[k]['isOpened'] = false
                TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('qb-jewellery:client:setAlertState', -1, false)
                TriggerEvent('qb-scoreboard:server:SetActivityBusy', 'jewellery', false)
            end
            timeOut = false
        end)
    end
end)
