local QBCore = exports['qb-core']:GetCoreObject()
local Races = {}
local InRace = false
local RaceId = 0
local RaceCount = 5

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        Wait(7)
        if Races ~= nil then
            -- No race yet
            local pos = GetEntityCoords(PlayerPedId(), true)
            if RaceId == 0 then
                for k in pairs(Races) do
                    if Races[k] ~= nil then
                        if #(pos - vector3(Races[k].startx, Races[k].starty, Races[k].startz)) < 15.0 and not Races[k].started then
                            DrawText3Ds(Races[k].startx, Races[k].starty, Races[k].startz, '[~g~H~w~] Tham gia cuộc đua (~g~' .. Config.Currency .. Races[k].amount .. ',-~w~)')
                            if IsControlJustReleased(0, 74) then
                                TriggerServerEvent('qb-streetraces:JoinRace', k)
                            end
                        end
                    end
                end
            end
            -- Not started in race yet
            if RaceId ~= 0 and not InRace then
                if Races[RaceId] and #(pos - vector3(Races[RaceId].startx, Races[RaceId].starty, Races[RaceId].startz)) < 15.0 and not Races[RaceId].started then
                    DrawText3Ds(Races[RaceId].startx, Races[RaceId].starty, Races[RaceId].startz, 'Cuộc đua sẽ sớm bắt đầu')
                end
            end
            -- In race and started
            if RaceId ~= 0 and InRace then
                if #(pos - vector3(Races[RaceId].endx, Races[RaceId].endy, pos.z)) < 250.0 and Races[RaceId].started then
                    DrawText3Ds(Races[RaceId].endx, Races[RaceId].endy, pos.z + 0.98, 'FINISH')
                    if #(pos - vector3(Races[RaceId].endx, Races[RaceId].endy, pos.z)) < 15.0 then
                        TriggerServerEvent('qb-streetraces:RaceWon', RaceId)
                        InRace = false
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('qb-streetraces:StartRace', function(race)
    if RaceId ~= 0 and RaceId == race then
        SetNewWaypoint(Races[RaceId].endx, Races[RaceId].endy)
        InRace = true
        SendNUIMessage({
            action = 'SHOW_UI'
        });
        RaceCountDown()
    end
end)

RegisterNetEvent('qb-streetraces:RaceDone', function(race, winner)
    if RaceId ~= 0 and RaceId == race then
        RaceId = 0
        InRace = false
        QBCore.Functions.Notify('Cuộc đua đã kết thúc! Người chiến thắng là ' .. winner .. '!')
    end
end)

RegisterNetEvent('qb-streetraces:StopRace', function()
    RaceId = 0
    InRace = false
    SendNUIMessage({
        action = 'HIDE_UI'
    });
end)



RegisterNetEvent('qb-streetraces:CreateRace', function(amount)
    local pos = GetEntityCoords(PlayerPedId(), true)
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local c = GetBlipInfoIdCoord(WaypointHandle)
        if #(pos - c) > Config.MinimumRaceDistance then
            local race = {
                creator = nil,
                started = false,
                startx = pos.x,
                starty = pos.y,
                startz = pos.z,
                endx = c.x,
                endy = c.y,
                endz = c.z,
                amount = amount,
                pot = amount,
                joined = {}
            }
            TriggerServerEvent('qb-streetraces:NewRace', race)
        else
            QBCore.Functions.Notify('Vị trí kết thúc quá gần', 'error')
        end
    else
        QBCore.Functions.Notify('Bạn cần phải bỏ một điểm đánh dấu', 'error')
    end
end)

RegisterNetEvent('qb-streetraces:SetRace', function(RaceTable)
    Races = RaceTable
end)

RegisterNetEvent('qb-streetraces:SetRaceId', function(race)
    RaceId = race
    SetNewWaypoint(Races[RaceId].endx, Races[RaceId].endy)
    SendNUIMessage({
        action = 'SHOW_UI'
    });
end)

RegisterNetEvent('qb-streetraces:UpdateRaceInfo', function(racers, prizepool)
    SendNUIMessage({
        action = 'UPDATE_RACE_INFO',
        racers = racers,
        currency = Config.Currency,
        prizepool = prizepool,
    })
end)

function FreezeCar()
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), true), true)
end

function UnfreezeCar()
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), true), false)
end

function RaceCountDown()
    SendNUIMessage({
        action = 'SHOW_UI'
    });
    FreezeCar()
    Wait(3000)
    while RaceCount ~= 0 do
        FreezeCar()
        PlaySound(-1, 'slow', 'SHORT_PLAYER_SWITCH_SOUND_SET', 0, 0, 1)
        SendNUIMessage({
            action = 'COUNTDOWN',
            payload = RaceCount
        });
        Wait(1500)
        RaceCount = RaceCount - 1
    end
    SendNUIMessage({
        action = 'COUNTDOWN',
        payload = 'GO'
    });
    RaceCount = 5
    UnfreezeCar()
    Wait(3000)
    SendNUIMessage({
        action = 'HIDE_UI'
    });
    Wait(800)
    Wait(3000)
end
