local QBCore = exports['qb-core']:GetCoreObject()
local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000
local choosingSpawn = false
local Houses = {}
local cam = nil
local cam2 = nil

-- Hiện thông báo ngoài màn hình
local function ShowNotification(text)
    QBCore.Functions.Notify(text, "success", 5000)
end

-- Set UI hiển thị hoặc ẩn
local function SetDisplay(bool)
    local translations = {}
    for k in pairs(Lang.fallback and Lang.fallback.phrases or Lang.phrases) do
        if k:sub(0, #'ui.') then
            translations[k:sub(#'ui.' + 1)] = Lang:t(k)
        end
    end
    choosingSpawn = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = 'showUi',
        status = bool,
        translations = translations
    })
end

-- Tạo camera và chuyển mượt
local function SetCam(campos)
    cam2 = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', campos.x, campos.y, campos.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then DestroyCam(cam, true) end
    Wait(cam1Time)

    cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', campos.x, campos.y, campos.z + camZPlus2, -85.00, 0.00, 0.00, 100.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(PlayerPedId(), campos.x, campos.y, campos.z)
end

-- Tắt camera và fade màn hình khi spawn player
local function PreSpawnPlayer()
    DoScreenFadeOut(500)
    Wait(1000)
    SetDisplay(false)
end

local function PostSpawnPlayer()
    DoScreenFadeIn(500)
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(false, true, 500, true, true)
    if DoesCamExist(cam) then
        SetCamActive(cam, false)
        DestroyCam(cam, true)
    end
    if DoesCamExist(cam2) then
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
    end
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
end

-- Event mở UI spawn
RegisterNetEvent('qb-spawn:client:openUI', function(value)
    SetEntityVisible(PlayerPedId(), false)
    DoScreenFadeOut(250)
    Wait(1000)
    DoScreenFadeIn(250)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    end)
    Wait(500)
    SetDisplay(value)
end)

-- Nhận config nhà
RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Houses = houseConfig
end)

-- Setup vị trí spawn UI
RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new, apps)
    if not new then
        QBCore.Functions.TriggerCallback('qb-spawn:server:getOwnedHouses', function(houses)
            local myHouses = {}
            if houses ~= nil then
                for i = 1, (#houses), 1 do
                    myHouses[#myHouses + 1] = {
                        house = houses[i].house,
                        label = Houses[houses[i].house].address or Houses[houses[i].house].adress or "Unknown",
                    }
                end
            end

            Wait(500)
            SendNUIMessage({
                action = 'setupLocations',
                locations = QB.Spawns,
                houses = myHouses,
                isNew = new
            })
        end, cData.citizenid)
    else
        SendNUIMessage({
            action = 'setupAppartements',
            locations = apps,
            isNew = new
        })
    end
end)

-- Khi chọn vị trí spawn từ UI
RegisterNUICallback('spawnplayer', function(data, cb)
    local location = tostring(data.spawnloc)
    local type = tostring(data.typeLoc)
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local insideMeta = PlayerData.metadata['inside']

    PreSpawnPlayer()
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false)

    if type == 'current' then
        QBCore.Functions.GetPlayerData(function(pd)
            SetEntityCoords(ped, pd.position.x, pd.position.y, pd.position.z)
            SetEntityHeading(ped, pd.position.a or 0)
            FreezeEntityPosition(ped, false)
            SetEntityVisible(ped, true)
        end)

        if insideMeta.house ~= nil then
            ShowNotification("Bạn có căn hộ rồi (" .. tostring(insideMeta.house) .. ")")
            TriggerEvent('qb-houses:client:LastLocationHouse', insideMeta.house)
        elseif insideMeta.apartment and (insideMeta.apartment.apartmentType ~= nil or insideMeta.apartment.apartmentId ~= nil) then
            local apartmentType = insideMeta.apartment.apartmentType
            local apartmentId = insideMeta.apartment.apartmentId
            ShowNotification("Bạn có căn hộ rồi (" .. tostring(apartmentType) .. ")")
            TriggerEvent('qb-apartments:client:LastLocationHouse', apartmentType, apartmentId)
        end

        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        PostSpawnPlayer()

    elseif type == 'house' then
        SetEntityCoords(ped, Houses[location].coords.enter.x, Houses[location].coords.enter.y, Houses[location].coords.enter.z)
        SetEntityHeading(ped, Houses[location].coords.enter.h or 0)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        PostSpawnPlayer()

    elseif type == 'normal' then
        local pos = QB.Spawns[location].coords
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, pos.w or 0)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        PostSpawnPlayer()

    elseif type == 'appartment' then
        local coords = Apartments.Locations[location].coords.enter
        SetEntityCoords(ped, coords.x, coords.y, coords.z)
        SetEntityHeading(ped, coords.h or 0)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        PostSpawnPlayer()
    else
        -- Nếu type không hợp lệ, spawn ở vị trí mặc định
        local pos = QB.Spawns["default"] and QB.Spawns["default"].coords or vector3(0,0,0)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, pos.w or 0)
        PostSpawnPlayer()
    end

    cb('ok')
end)

-- Đóng UI khi exit
RegisterNUICallback('exit', function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'showUi',
        status = false
    })
    choosingSpawn = false
    cb('ok')
end)

-- Giữ trạng thái UI spawn để disable control
CreateThread(function()
    while true do
        Wait(0)
        if choosingSpawn then
            DisableAllControlActions(0)
        else
            Wait(1000)
        end
    end
end)
