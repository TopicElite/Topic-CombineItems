ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

for k, v in pairs(Config.CombineItems) do
    ESX.RegisterUsableItem(v.usableItem, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        local haveAllItems = true
        local needItemsText = ""
        local first = true

        for k2, v2 in pairs(v.needItems) do
            local item = xPlayer.getInventoryItem(tostring(k2))
            if item.count >= v2 then
            else
                haveAllItems = false
                if first then
                    first = false
                    needItemsText = item.count .. "x " .. item.label
                else
                    needItemsText = needItemsText .. ", " .. item.count .. "x " .. item.label
                end
            end
        end

        if haveAllItems then
            xPlayer.triggerEvent("7combineItems:playanimation", v)
        else
            TriggerClientEvent('esx:showNotification', source, 'You need ' .. needItemsText .. '!')
        end
    end)
end

RegisterNetEvent('7combineItems:removeItems') 
AddEventHandler('7combineItems:removeItems', function(itemConfig)
    local xPlayer = ESX.GetPlayerFromId(source)
    for k, v in pairs(itemConfig.needItems) do
        xPlayer.removeInventoryItem(k, v)
    end
    xPlayer.addInventoryItem(itemConfig.resultItem, itemConfig.resultItemCount) 
end)

--[[
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
end]]--