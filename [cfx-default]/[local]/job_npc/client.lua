local npcCoords = vector3(451.62, -978.85, 30.69) -- Vị trí NPC cảnh sát
local npcHeading = 171.22
local npcModel = "s_m_y_cop_01"
local currentJob = nil

local QBCore = exports['qb-core']:GetCoreObject()

-- Tạo NPC cảnh sát
Citizen.CreateThread(function()
    RequestModel(GetHashKey(npcModel))
    while not HasModelLoaded(GetHashKey(npcModel)) do
        Wait(500)
    end

    local npc = CreatePed(4, GetHashKey(npcModel), npcCoords.x, npcCoords.y, npcCoords.z - 1, npcHeading, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)

-- Hàm hiển thị text 3D
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

-- Hiển thị thông báo góc màn hình
function ShowNotification(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(false, false)
end

-- Lấy job hiện tại mỗi 10s để cập nhật currentJob (đảm bảo chính xác)
Citizen.CreateThread(function()
    while true do
        local player = PlayerPedId()
        local playerId = PlayerId()
        local ped = PlayerPedId()
        local playerData = QBCore.Functions.GetPlayerData()
        currentJob = playerData.job.name
        Citizen.Wait(10000)
    end
end)

-- Xử lý nhận việc cảnh sát bằng phím E
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - npcCoords)

        if distance < 2.0 then
            DrawText3D(npcCoords.x, npcCoords.y, npcCoords.z + 1.0, "[E] Nhận việc làm cảnh sát")

            if IsControlJustReleased(0, 38) then -- phím E
                if currentJob == nil or currentJob == "unemployed" then
                    TriggerServerEvent("myjob:setPolice")
                else
                    ShowNotification("Bạn đã có công việc rồi, không thể nhận thêm!")
                end
            end
        end
    end
end)

-- Xử lý admin trả về status
local showCoords = false
local coordsText = ""
local coordsTimer = 0
local isAdmin = false

RegisterNetEvent('returnAdminStatus')
AddEventHandler('returnAdminStatus', function(status)
    isAdmin = status
end)

RegisterCommand("toaDo", function()
    TriggerServerEvent('checkAdmin')
    Citizen.Wait(100)
    if isAdmin then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        coordsText = string.format("Tọa độ: x = %.2f, y = %.2f, z = %.2f, heading = %.2f", coords.x, coords.y, coords.z, heading)
        showCoords = true
        coordsTimer = GetGameTimer() + 60000
    else
        ShowNotification("Bạn không có quyền dùng lệnh này.")
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if showCoords then
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.5, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(coordsText)
            DrawText(0.015, 0.02)

            if GetGameTimer() > coordsTimer then
                showCoords = false
                coordsText = ""
            end
        end
    end
end)
