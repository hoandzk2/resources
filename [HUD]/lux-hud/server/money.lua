local Framework = exports["qb-core"]:GetCoreObject()


Framework.Commands.Add("cash", "Kiểm tra tiền mặt", {}, false, function(source, args)
	TriggerClientEvent('hud:client:ShowMoney', source, "cash")
end)