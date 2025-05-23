local QBCore = exports['qb-core']:GetCoreObject()
local skinlist = {}
local delay = 0

-- Lấy danh sách skin sau 10 giây khi QBCore đã sẵn sàng
CreateThread(function()
    Wait(10000)
    QBCore.Functions.TriggerCallback("linh_skin:getownedskin", function(skin)
        skinlist = skin
    end)
end)

-- Khi có cập nhật skin từ server
RegisterNetEvent("linh_skin:update", function()
    QBCore.Functions.TriggerCallback("linh_skin:getownedskin", function(skin)
        skinlist = skin
    end)
end)

-- Lệnh mở menu skin
RegisterCommand("linh_skin", function()
    local playerPed = PlayerPedId()
    local elements = {
        {label = "Skin mặc định", name = "citizen_wear"}
    }

    if next(skinlist) ~= nil then
        for _, v in ipairs(skinlist) do
            table.insert(elements, {
                label = v.name,
                name = v.name
            })
        end

        exports['qb-menu']:openMenu({
            {
                header = "VIP Skin",
                isMenuHeader = true
            },
            table.unpack(
                QBCore.Shared.TableToMenuItems(elements, function(item)
                    return {
                        header = item.label,
                        txt = "Chọn skin này",
                        params = {
                            event = "linh_skin:selectSkin",
                            args = { name = item.name }
                        }
                    }
                end)
            )
        })
    else
        TriggerEvent("QBCore:Notify", "Bạn không có skin nào!", "error")
    end
end)

-- Khi chọn skin
RegisterNetEvent("linh_skin:selectSkin", function(data)
    local name = data.name
    if delay ~= 0 then
        return TriggerEvent("QBCore:Notify", "Đang bị delay còn ~r~" .. delay, "error")
    end

    local playerPed = PlayerPedId()
    local curHea = GetEntityHealth(playerPed)

    if name == "citizen_wear" then
        delay = 100
        TriggerServerEvent("qb-clothing:loadPlayerSkin")
        Wait(1000)
        SetEntityHealth(playerPed, curHea)
        Wait(10000)
    else
        exports['qb-menu']:openMenu({
            {
                header = "Bạn muốn đổi thành skin này?",
                isMenuHeader = true
            },
            {
                header = "Có",
                params = {
                    event = "linh_skin:applySkin",
                    args = { model = name, curHea = curHea }
                }
            },
            {
                header = "Không",
                params = {
                    event = ""
                }
            }
        })
    end
end)

-- Áp dụng model mới
RegisterNetEvent("linh_skin:applySkin", function(data)
    delay = 100
    local playerPed = PlayerPedId()
    local model = data.model
    local curHea = data.curHea

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    if IsModelInCdimage(model) and IsModelValid(model) then
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        TriggerEvent('QBCore:Client:OnPlayerLoaded') -- Khôi phục vũ khí
        SetEntityHealth(PlayerPedId(), curHea)
        SetModelAsNoLongerNeeded(model)
    else
        TriggerEvent("QBCore:Notify", "Model không hợp lệ", "error")
    end
end)

-- Delay reset
CreateThread(function()
    while true do
        Wait(1000)
        if delay > 0 then
            delay = delay - 1
        end
    end
end)
