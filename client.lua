ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

RegisterNetEvent('7combineItems:playanimation') 
AddEventHandler('7combineItems:playanimation', function(title, duration, animationClass, animation)
	function loadAnimDict(dict)
		while (not HasAnimDictLoaded(dict)) do
			RequestAnimDict(dict)
			Citizen.Wait(5)
		end
	end
	loadAnimDict( animationClass )
	TaskPlayAnim( PlayerPedId(), animationClass, animation, 3.0, -8, -1, 63, 0, 0, 0, 0 )
	exports['rprogress']:Start(title, duration)
	ClearPedTasksImmediately(PlayerPedId())
end)