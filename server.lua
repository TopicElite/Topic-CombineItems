ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('paperweed', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    combineTwoItems(source, xPlayer, 'paperweed', 'marijuana', 1, 'joint', 1, "Joint drehen", 10000, "mp_arresting", "a_uncuff")
end)

function combineTwoItems(source, xPlayer, useItem, needItem, needItemCount, resultItem, resultItemCount, progressbarTitle, progressbarDuration, animationClass, animation)
    local itemCount = xPlayer.getInventoryItem(tostring(needItem)).count
    if itemCount >= needItemCount then
        TriggerClientEvent('7combineItems:playanimation', source, progressbarTitle, progressbarDuration, animationClass, animation)
        Citizen.Wait(progressbarDuration)
        xPlayer.removeInventoryItem(useItem, 1)
        xPlayer.removeInventoryItem(needItem, needItemCount)
        xPlayer.addInventoryItem(resultItem, resultItemCount) 
    else
        TriggerClientEvent('esx:showNotification', source, 'Du brauchst '.. needItemCount.. 'x ~r~'.. needItem .. '~s~ !')
    end
end

function combineThreeItems(source, xPlayer, useItem, needItemOne, needItemOneCount, needItemTwo, needItemTwoCount, resultItem, resultItemCount, progressbarTitle, progressbarDuration, animationClass, animation)
    local itemCountOne = xPlayer.getInventoryItem(tostring(needItemOne)).count
    local itemCountTwo = xPlayer.getInventoryItem(tostring(needItemTwo)).count
    if itemCountOne >= needItemOneCount and itemCountTwo >= needItemTwoCount then
        TriggerClientEvent('7combineItems:playanimation', source, progressbarTitle, progressbarDuration, animationClass, animation)
        Citizen.Wait(progressbarDuration)
        xPlayer.removeInventoryItem(needItemOne, needItemOneCount)
        xPlayer.removeInventoryItem(needItemTwo, needItemTwoCount)
        xPlayer.removeInventoryItem(needItem, 1)   
        xPlayer.addInventoryItem(resultItem, resultItemCount) 
    else
        if itemCountOne >= 1 then
            TriggerClientEvent('esx:showNotification', source, 'Du brauchst '.. needItemOneCount .. 'x ~r~'.. needItemOne .. '~s~ !')
        elseif itemCountTwo >= 1 then
            TriggerClientEvent('esx:showNotification', source, 'Du brauchst '.. needItemTwoCount .. 'x ~r~'.. needItemTwo .. '~s~ !')
        end
    end
end