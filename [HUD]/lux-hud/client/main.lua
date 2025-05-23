Framework = exports["lux-core"]:GetCoreObject()

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

isLoggedIn = false
stress = 0
PlayerJob = {}
local inEvent = false
RegisterNetEvent('lux-event:joinEvent')
AddEventHandler('lux-event:joinEvent', function(type, mainCoord, radius, team, teleCoord, health, armor, weapon, ammo, instance)
	inEvent = true
end)

RegisterNetEvent('lux-event:leaveEvent')
AddEventHandler('lux-event:leaveEvent', function()
    Wait(3000)
	inEvent = false
end)
RegisterNetEvent("Framework:Client:OnPlayerUnload")
AddEventHandler("Framework:Client:OnPlayerUnload", function()
    isLoggedIn = false
    QBHud.Show = false
    SendNUIMessage({
        action = "hudtick",
        show = true,
    })
end)

RegisterNetEvent("Framework:Client:OnPlayerLoaded")
AddEventHandler("Framework:Client:OnPlayerLoaded", function()
    isLoggedIn = true
    QBHud.Show = true
    local minimap = RequestScaleformMovie("minimap")
    while not HasScaleformMovieLoaded(minimap) do
      Wait(0)
    end
  
    local startMinimapX, startMinimapY = -0.025, -0.025
    
    SetMinimapComponentPosition('minimap', 'L', 'B', startMinimapX+0.025, startMinimapY-0.02, 0.160, 0.170) -- Blips on the map
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', startMinimapX+0.05, startMinimapY, 0.12, 0.15) -- Waypoint cutout
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', startMinimapX, startMinimapY, 0.28, 0.21) -- Height & width of map DON'T TOUCH
    
    SetBigmapActive(true, false)
    Wait(300)
    SetBigmapActive(false, false)
    while IsBigmapActive() do
      SetBigmapActive(false, false)
      Wait(100)
    end
    PlayerJob = Framework.Functions.GetPlayerData().job
end)

local StressGain = 0
local IsGaining = false

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local CurrentWeapon = GetSelectedPedWeapon(ped)
        if IsPedShooting(PlayerPedId()) and not inEvent and not IsWhitelistedWeaponStress(CurrentWeapon)  then
            local StressChance = math.random(1, 3)
            local odd = math.random(1, 3)
            if StressChance == odd then
                local PlusStress = math.random(2, 4) / 100
                StressGain = StressGain + PlusStress
            end
            if not IsGaining then
                IsGaining = true
            end
        else
            if IsGaining then
                IsGaining = false
            end
        end

        -- if IsPlayerFreeAiming(PlayerId()) and not IsPedShooting(PlayerPedId()) and not inEvent and not IsWhitelistedWeaponStress(CurrentWeapon)  then
            
        --     if CurrentWeapon ~= `WEAPON_UNARMED`then
        --         local StressChance = math.random(1, 20)
        --         local odd = math.random(1, 20)
        --         if StressChance == odd then
        --             local PlusStress = math.random(1, 3) / 100
        --             StressGain = StressGain + PlusStress
        --         end
        --     end
        --     if not IsGaining then
        --         IsGaining = true
        --     end
        -- else
        --     if IsGaining then
        --         IsGaining = false
        --     end
        -- end

        Citizen.Wait(2)
    end
end)

RegisterNetEvent('lux-hud:client:update:stress')
AddEventHandler('lux-hud:client:update:stress', function(newStress)
    stress = newStress or stress
end)

Citizen.CreateThread(function()
    while true do
        if not IsGaining and not inEvent then
            StressGain = math.ceil(StressGain)
            if StressGain > 0 then
                Framework.Functions.Notify('Căng thẳng', "primary", 2000)
                TriggerServerEvent('lux-hud:Server:UpdateStress', StressGain)
                StressGain = 0
            end
        end

        Citizen.Wait(3000)
    end
end)

CreateThread(function() -- Speeding
    while true do
        if isLoggedIn then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local speed = GetEntitySpeed(vehicle) * 3.6
                local stressSpeed = seatbeltOn and 240 or 120
                if speed >= stressSpeed and GetVehicleClass(vehicle) ~= 14 and 
                (GetVehicleClass(vehicle) == 8 and not IsPedWearingHelmet(ped)) then
                    TriggerServerEvent('lux-hud:server:gain:stress', math.random(1, 3))
                end
            end
        end
        Wait(10000)
    end
end)


function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(QBStress.Intensity["shake"]) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 23000
    for k, v in pairs(QBStress.EffectInterval) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local Wait = GetEffectInterval(stress)
        if stress >= 85 then
            local ShakeIntensity = GetShakeIntensity(stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = (FallRepeat * 1750)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 3000, 500)

            if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                local player = PlayerPedId()
                SetPedToRagdollWithFall(player, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end

            Citizen.Wait(500)
            for i = 1, FallRepeat, 1 do
                Citizen.Wait(750)
                DoScreenFadeOut(200)
                Citizen.Wait(1000)
                DoScreenFadeIn(200)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 200, 750, 200)
            end
        elseif stress >= QBStress.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Citizen.Wait(Wait)
    end
end)

local isPause = false
local uiHidden = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsBigmapActive() or IsPauseMenuActive() and not isPause or IsRadarHidden() then
            if not uiHidden then
                SendNUIMessage({
                    action = "hideUI"
                })
                uiHidden = true
            end
        elseif uiHidden or IsPauseMenuActive() and isPause then
            SendNUIMessage({
                action = "displayUI"
            })
            uiHidden = false
        end
    end
end)

showRoundMap = function()
    
    local isPause = false
    local uiHidden = false
    
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if IsBigmapActive() or IsPauseMenuActive() and not isPause or IsRadarHidden() then
                if not uiHidden then
                    SendNUIMessage({
                        action = "hideUI"
                    })
                    uiHidden = true
                end
            elseif uiHidden or IsPauseMenuActive() and isPause then
                SendNUIMessage({
                    action = "displayUI"
                })
                uiHidden = false
            end
        end
    end)
end

function IsWhitelistedWeaponStress(weapon)
    local WhitelistedWeaponStress = {
        `weapon_petrolcan`,
        `weapon_hazardcan`,
        `weapon_fireextinguisher`
    }
    if weapon then
        for _, v in pairs(WhitelistedWeaponStress) do
            if weapon == v then
                return true
            end
        end
    end
    return false
end