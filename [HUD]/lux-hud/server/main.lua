local ResetStress = false -- stress
local Framework = exports["lux-core"]:GetCoreObject()
RegisterServerEvent("lux-hud:Server:UpdateStress")
AddEventHandler('lux-hud:Server:UpdateStress', function(StressGain)
	local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] + StressGain
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
		TriggerClientEvent("lux-hud:client:update:stress", src, newStress)
	end
end)

RegisterServerEvent('lux-hud:server:gain:stress')
AddEventHandler('lux-hud:server:gain:stress', function(amount)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] + amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
        TriggerClientEvent("lux-hud:client:update:stress", src, newStress)
        TriggerClientEvent('Framework:Notify', src, 'Căng thẳng', 'error', 1500)
	end
end)

RegisterServerEvent('lux-hud:Server:RelieveStress')
AddEventHandler('lux-hud:Server:RelieveStress', function(amount)
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] - amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
        TriggerClientEvent("lux-hud:client:update:stress", src, newStress)
        TriggerClientEvent('Framework:Notify', src, 'Giảm căng thẳng')
	end
end)

RegisterServerEvent('lux-hud:server:remove:stress')
AddEventHandler('lux-hud:server:remove:stress', function(Amount)
    local Player = Framework.Functions.GetPlayer(source)
    local NewStress = nil
    if Player ~= nil then
      NewStress = Player.PlayerData.metadata["stress"] - Amount
      if NewStress <= 0 then NewStress = 0 end
      if NewStress > 105 then NewStress = 100 end
      Player.Functions.SetMetaData("stress", NewStress)
      TriggerClientEvent("lux-hud:client:update:stress", Player.PlayerData.source, NewStress)
    end
end)