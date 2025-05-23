local QBCore = exports['qb-core']:GetCoreObject()

-- Callback: Lấy danh sách skin của người chơi
QBCore.Functions.CreateCallback("linh_skin:getownedskin", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        return cb({})
    end

    local identifier = Player.PlayerData.citizenid
    MySQL.query('SELECT * FROM linh_skin WHERE identifier = ?', {identifier}, function(result)
        cb(result or {})
    end)
end)

-- Lệnh admin: Thêm skin cho người chơi
QBCore.Commands.Add("addskin", "Thêm skin cho người chơi (admin)", {
    {name="id", help="ID người chơi"},
    {name="skinname", help="Tên skin"}
}, true, function(source, args)
    local targetId = tonumber(args[1])
    local skinName = args[2]

    if not targetId or not skinName then
        return TriggerClientEvent('QBCore:Notify', source, "Cú pháp: /addskin [id] [tên skin]", "error")
    end

    local TargetPlayer = QBCore.Functions.GetPlayer(targetId)
    if not TargetPlayer then
        return TriggerClientEvent('QBCore:Notify', source, "Không tìm thấy người chơi!", "error")
    end

    AddSkin(targetId, skinName)
    TriggerClientEvent('QBCore:Notify', source, "Đã thêm skin cho người chơi ID: " .. targetId, "success")
    TriggerClientEvent('QBCore:Notify', targetId, "Bạn đã nhận được skin: " .. skinName, "success")
    TriggerClientEvent("linh_skin:update", targetId)
end, "admin")

-- Hàm: Thêm skin vào cơ sở dữ liệu
function AddSkin(id, name)
    local Player = QBCore.Functions.GetPlayer(id)
    if not Player then return end

    local identifier = Player.PlayerData.citizenid

    MySQL.insert("INSERT INTO linh_skin (identifier, name) VALUES (?, ?)", {
        identifier,
        name
    })
end
