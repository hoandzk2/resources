local QBCore = exports['qb-core']:GetCoreObject()

-- Callback để lấy danh sách skin đã sở hữu
QBCore.Functions.CreateCallback("linh_skin:getownedskin", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local identifier = Player.PlayerData.citizenid
    MySQL.Async.fetchAll('SELECT * FROM linh_skin WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        cb(result)
    end)
end)

-- Lệnh dành cho admin thêm skin cho người chơi
QBCore.Commands.Add("addskin", "Thêm skin cho người chơi (admin)", {{name="id", help="ID người chơi"}, {name="skinname", help="Tên skin"}}, true, function(source, args)
    local targetId = tonumber(args[1])
    local skinName = args[2]
    
    if GetPlayerName(targetId) then
        AddSkin(targetId, skinName)
    else
        TriggerClientEvent('QBCore:Notify', source, "ID người chơi không hợp lệ.", "error")
    end
end, "admin") -- Hoặc "god" nếu bạn chỉ muốn cho người có quyền cao nhất

-- Hàm thêm skin vào DB
function AddSkin(id, name)
    local Player = QBCore.Functions.GetPlayer(id)
    local identifier = Player.PlayerData.citizenid

    MySQL.Async.execute("INSERT INTO linh_skin (identifier, name) VALUES (@identifier, @name)", {
        ['@identifier'] = identifier,
        ['@name'] = name
    }, function(rowsChanged)
        TriggerClientEvent('QBCore:Notify', id, "Bạn đã nhận được một skin!", "success")
        TriggerClientEvent("linh_skin:update", id)
    end)
end
