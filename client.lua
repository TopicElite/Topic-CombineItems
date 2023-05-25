ESX = nil
local isCombineding = false

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterNetEvent('7combineItems:playanimation') 
AddEventHandler('7combineItems:playanimation', function(itemConfig) 
	if not isCombineding then
		isCombineding = true
		loadAnimDict( itemConfig.animationClass )
		TaskPlayAnim( PlayerPedId(), itemConfig.animationClass, itemConfig.animation, 3.0, -8, -1, 63, 0, 0, 0, 0 )
		exports['rprogress']:Start(itemConfig.progressbarTitle, itemConfig.progressbarDuration)
		ClearPedTasksImmediately(PlayerPedId())
		isCombineding = false
		TriggerServerEvent("7combineItems:removeItems", itemConfig)
	end
end)