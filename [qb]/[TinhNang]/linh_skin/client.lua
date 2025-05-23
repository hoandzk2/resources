local QBCore = exports['qb-core']:GetCoreObject()
local skinList = {}
local delay = 0

-- Lấy danh sách skin khi game load xong
CreateThread(function()
    Wait(10000) -- Chờ QBCore và nhân vật load xong
    QBCore.Functions.TriggerCallback("linh_skin:getownedskin", function(skins)
        skinList = skins or {}
    end)
end)

-- Khi server gửi cập nhật danh sách skin
RegisterNetEvent("linh_skin:update", function()
    QBCore.Functions.TriggerCallback("linh_skin:getownedskin", function(skins)
        skinList = skins or {}
    end)
end)

-- Lệnh mở menu chọn skin
RegisterCommand("linh_skin", function()
    if #skinList == 0 then
        return QBCore.Functions.Notify("Bạn không có skin nào!", "error")
    end

    local menuItems = {
        {
            header = "Skin mặc định",
            txt = "Quay về skin ban đầu",
            params = {
                event = "linh_skin:selectSkin",
                args = { name = "citizen_wear" }
            }
        }
    }

    for _, skin in ipairs(skinList) do
        table.insert(menuItems, {
            header = skin.name,
            txt = "Chọn skin này",
            params = {
                event = "linh_skin:selectSkin",
                args = { name = skin.name }
            }
        })
    end

    exports['qb-menu']:openMenu(menuItems)
end)


-- Khi chọn một skin
RegisterNetEvent("linh_skin:selectSkin", function(data)
    if not data or not data.name then return end
    if delay > 0 then
        return QBCore.Functions.Notify("Vui lòng chờ " .. delay .. " giây!", "error")
    end

    local playerPed = PlayerPedId()
    local currentHealth = GetEntityHealth(playerPed)

    if data.name == "citizen_wear" then
        delay = 10
        TriggerServerEvent("qb-clothing:loadPlayerSkin")
        Wait(1000)
        SetEntityHealth(playerPed, currentHealth)
    else
        exports['qb-menu']:openMenu({
            { header = "Bạn chắc chắn chọn skin này?", isMenuHeader = true },
            {
                header = "✅ Có",
                params = {
                    event = "linh_skin:applySkin",
                    args = { model = data.name, curHea = currentHealth }
                }
            },
            {
                header = "❌ Không",
                params = {}
            }
        })
    end
end)

-- Áp dụng skin
RegisterNetEvent("linh_skin:applySkin", function(data)
    if not data or not data.model then return end

    delay = 10
    local model = GetHashKey(data.model)
    local playerPed = PlayerPedId()

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    if IsModelInCdimage(model) and IsModelValid(model) then
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
        TriggerEvent('QBCore:Client:OnPlayerLoaded') -- Tải lại các thông tin
        SetEntityHealth(PlayerPedId(), data.curHea)
        QBCore.Functions.Notify("Skin đã được áp dụng!", "success")
    else
        QBCore.Functions.Notify("Model không hợp lệ!", "error")
    end
end)

-- Đếm ngược delay
CreateThread(function()
    while true do
        Wait(1000)
        if delay > 0 then
            delay = delay - 1
        end
    end
end)
