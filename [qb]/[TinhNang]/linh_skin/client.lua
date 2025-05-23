local skinlist = {}
ESX	= nil
local delay = 0
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(10000)
	ESX.TriggerServerCallback("linh_skin:getownedskin", function(skin)
		skinlist = skin
	end)
end)

RegisterNetEvent("linh_skin:update")
AddEventHandler("linh_skin:update", function()
	ESX.TriggerServerCallback("linh_skin:getownedskin", function(skin)
		skinlist = skin
	end)
end)

RegisterCommand("linh_skin",function()
	ESX.UI.Menu.CloseAll()
	local playerped = PlayerPedId()
	local elements = {
		{label = 'Skin mặc định', name = 'citizen_wear'}
	}
	if skinlist ~= {} then
		local dumped = ESX.DumpTable(skinlist)
		print(dumped)
		print(skinlist.name)
		for k,v in ipairs(skinlist) do
			table.insert(elements, {
				name = v.name,
				label = v.name
			})
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vip_skin',{
			title = 'Vip Skin',
			align = 'top-left',
			elements = elements
		}, function (data,menu)
		    if delay ~= 0 then
		    	return ESX.ShowNotification('Đang bị delay còn ~r~'..delay)
		    end
			if data.current.name == 'citizen_wear' then
				delay = 100
				local curHea = GetEntityHealth(PlayerPedId())
				print(curHea)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
				Citizen.Wait(1000)
				SetEntityHealth(PlayerPedId(), curHea)
				Citizen.Wait(10000)
			else
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vip_skin_confirm',
			{
				title = 'bạn muốn đổi thành skin này',
				align = 'top-left',
				elements = {
					{ label = 'Không', value = 'no'},
					{ label = 'Có', value = 'yes'}
				}
			}, function (data2, menu2)
					if data2.current.value == 'yes' then
						delay = 100
						local curHea = GetEntityHealth(PlayerPedId())
						characterModel = data.current.name
						RequestModel(characterModel)
						while not HasModelLoaded(characterModel) do
							RequestModel(characterModel)
							Citizen.Wait(0)
						end
						if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
							SetPlayerModel(PlayerId(), characterModel)
							SetPedDefaultComponentVariation(playerPed)
							TriggerEvent('esx:restoreLoadout')
							SetEntityHealth(PlayerPedId(), curHea)
						end
						SetModelAsNoLongerNeeded(characterModel)
					else
						menu2.close()
					end
			end, function (data2, menu2)
				menu2.close()
			end)
		end
		end, function (data,menu)
			menu.close()
		end, function (data, menu)
		end)
	else 
		ESX.ShowNotification('Bạn ~r~ Không ~w~ có skin')
	end
end)
				
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if delay > 0 then
			delay = delay - 1
		end
	end
end)