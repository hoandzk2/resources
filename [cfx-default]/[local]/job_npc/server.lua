RegisterNetEvent('checkAdmin')
AddEventHandler('checkAdmin', function()
    local _source = source
    local isAdmin = IsPlayerAceAllowed(_source, "command.toado")
    TriggerClientEvent('returnAdminStatus', _source, isAdmin)
end)
