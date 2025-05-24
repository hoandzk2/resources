local QBCore = exports['qb-core']:GetCoreObject()

-- Event kiểm tra quyền admin
RegisterNetEvent('checkAdmin')
AddEventHandler('checkAdmin', function()
    local _source = source
    local isAdmin = IsPlayerAceAllowed(_source, "command.toado")
    TriggerClientEvent('returnAdminStatus', _source, isAdmin)
end)

-- Event set job cảnh sát cho player
RegisterNetEvent("myjob:setPolice", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.SetJob("police", 0) -- grade 0 = recruit
        TriggerClientEvent('QBCore:Notify', src, "Bạn đã nhận việc cảnh sát!", "success")
    end
end)
