local QBCore = exports['qb-core']:GetCoreObject()

local Races = {}

RegisterNetEvent('qb-streetraces:NewRace', function(RaceTable)
    local src = source
    local RaceId = math.random(1000, 9999)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if xPlayer.Functions.RemoveMoney('cash', RaceTable.amount, 'streetrace-created') then
        Races[RaceId] = RaceTable
        Races[RaceId].creator = src
        Races[RaceId].joined[#Races[RaceId].joined + 1] = src
        TriggerClientEvent('qb-streetraces:SetRace', -1, Races)
        TriggerClientEvent('qb-streetraces:SetRaceId', src, RaceId)
        TriggerClientEvent('QBCore:Notify', src, 'Bạn đã tham gia cuộc đua cho ' .. Config.Currency .. Races[RaceId].amount .. '.', 'success')
        UpdateRaceInfo(Races[RaceId])
    else
        TriggerClientEvent('QBCore:Notify', src, 'Bạn không có ' .. Config.Currency .. RaceTable.amount .. '.', 'error')
    end
end)

RegisterNetEvent('qb-streetraces:RaceWon', function(RaceId)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer.Functions.AddMoney('cash', Races[RaceId].pot, 'race-won')
    TriggerClientEvent('QBCore:Notify', src, 'Bạn đã thắng cuộc đua và ' .. Config.Currency .. Races[RaceId].pot .. ',- nhận được', 'success')
    TriggerClientEvent('qb-streetraces:SetRace', -1, Races)
    TriggerClientEvent('qb-streetraces:RaceDone', -1, RaceId, GetPlayerName(src))
end)

RegisterNetEvent('qb-streetraces:JoinRace', function(RaceId)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local zPlayer = QBCore.Functions.GetPlayer(Races[RaceId].creator)
    if zPlayer ~= nil then
        if xPlayer.Functions.RemoveMoney('cash', Races[RaceId].amount, 'streetrace-joined') then
            Races[RaceId].pot = Races[RaceId].pot + Races[RaceId].amount
            Races[RaceId].joined[#Races[RaceId].joined + 1] = src
            TriggerClientEvent('qb-streetraces:SetRace', -1, Races)
            TriggerClientEvent('qb-streetraces:SetRaceId', src, RaceId)
            TriggerClientEvent('QBCore:Notify', src, 'Bạn đã tham gia cuộc đua', 'primary')
            TriggerClientEvent('QBCore:Notify', Races[RaceId].creator, GetPlayerName(src) .. ' Tham gia cuộc đuas', 'primary')
            UpdateRaceInfo(Races[RaceId])
        else
            TriggerClientEvent('QBCore:Notify', src, 'Bạn không có đủ tiền mặt', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Người đã thực hiện cuộc đua là ngoại tuyến!', 'error')
        Races[RaceId] = {}
    end
end)

QBCore.Commands.Add(Config.Commands.CreateRace, 'Bắt đầu một cuộc đua đường phố', { { name = 'amount', help = 'Số tiền cổ phần cho cuộc đua.' } }, false, function(source, args)
    local src = source
    local amount = tonumber(args[1])

    if not amount then return TriggerClientEvent('QBCore:Notify', src, 'Cách sử dụng: /' .. Config.Commands.CreateRace .. ' [AMOUNT]', 'error') end
    if amount < Config.MinimumStake then
        return TriggerClientEvent('QBCore:Notify', src, 'Cổ phần tối thiểu là ' .. Config.Currency .. Config.MinimumStake, 'error')
    end
    if amount > Config.MaximumStake then
        return TriggerClientEvent('QBCore:Notify', src, 'Cổ phần tối đa là ' .. Config.Currency .. Config.MaximumStake, 'error')
    end


    if GetJoinedRace(src) == 0 then
        TriggerClientEvent('qb-streetraces:CreateRace', src, amount)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Bạn đã ở trong một cuộc đua', 'error')
    end
end)

QBCore.Commands.Add(Config.Commands.CancelRace, 'Dừng cuộc đua bạn đã tạo ra', {}, false, function(source, _)
    CancelRace(source)
end)

QBCore.Commands.Add(Config.Commands.QuitRace, 'Để lại một cuộc đua', {}, false, function(source, _)
    local src = source
    local RaceId = GetJoinedRace(src)
    if RaceId ~= 0 then
        if GetCreatedRace(src) ~= RaceId then
            local xPlayer = QBCore.Functions.GetPlayer(src)
            xPlayer.Functions.AddMoney('cash', Races[RaceId].amount, 'Cuộc đua bỏ')

            Races[RaceId].pot = Races[RaceId].pot - Races[RaceId].amount
            TriggerClientEvent('qb-streetraces:SetRace', -1, Races)

            TriggerClientEvent('qb-streetraces:StopRace', src)
            RemoveFromRace(src)
            TriggerClientEvent('QBCore:Notify', src, 'Bạn đã bước ra khỏi cuộc đua!', 'error')
            UpdateRaceInfo(Races[RaceId])
        else
            TriggerClientEvent('QBCore:Notify', src, '/' .. Config.Commands.CancelRace .. ' Dừng cuộc đua', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Bạn không ở trong một cuộc đua ', 'error')
    end
end)

QBCore.Commands.Add(Config.Commands.StartRace, 'Bắt đầu cuộc đua', {}, false, function(source)
    local src = source
    local RaceId = GetCreatedRace(src)

    if RaceId ~= 0 then
        Races[RaceId].started = true
        TriggerClientEvent('qb-streetraces:SetRace', -1, Races)
        TriggerClientEvent('qb-streetraces:StartRace', -1, RaceId)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Bạn chưa bắt đầu một cuộc đua', 'error')
    end
end)

function CancelRace(source)
    local RaceId = GetCreatedRace(source)
    local Player = QBCore.Functions.GetPlayer(source)

    if RaceId ~= 0 then
        for key in pairs(Races) do
            if Races[key] ~= nil and Races[key].creator == source then
                if not Races[key].started then
                    for _, iden in pairs(Races[key].joined) do
                        local xdPlayer = QBCore.Functions.GetPlayer(iden)
                        xdPlayer.Functions.AddMoney('cash', Races[key].amount, 'Race')
                        TriggerClientEvent('QBCore:Notify', xdPlayer.PlayerData.source, 'Cuộc đua đã kết thúc, bạn đã trở lại ' .. Config.Currency .. Races[key].amount .. '', 'error')
                        TriggerClientEvent('qb-streetraces:StopRace', xdPlayer.PlayerData.source)
                    end
                else
                    TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Cuộc đua đã bắt đầu', 'error')
                end
                TriggerClientEvent('QBCore:Notify', source, 'Cuộc đua dừng lại!', 'error')
                Races[key] = nil
            end
        end
        TriggerClientEvent('qb-streetraces:SetRace', -1, Races)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Bạn chưa bắt đầu một cuộc đua!', 'error')
    end
end

function UpdateRaceInfo(race)
    for _, src in pairs(race.joined) do
        TriggerClientEvent('qb-streetraces:UpdateRaceInfo', src, #race.joined, race.pot)
    end
end

function RemoveFromRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and not Races[key].started then
            for i, iden in pairs(Races[key].joined) do
                if iden == identifier then
                    table.remove(Races[key].joined, i)
                end
            end
        end
    end
end

function GetJoinedRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and not Races[key].started then
            for _, iden in pairs(Races[key].joined) do
                if iden == identifier then
                    return key
                end
            end
        end
    end
    return 0
end

function GetCreatedRace(identifier)
    for key in pairs(Races) do
        if Races[key] ~= nil and Races[key].creator == identifier and not Races[key].started then
            return key
        end
    end
    return 0
end
