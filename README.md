# 7combineItems

Good day, I have finished something small here.
If your inventory script does not support this function, this is the perfect script!

**[DOWNLOAD:](https://github.com/TopicElite/7combineItems):** [https://github.com/TopicElite/7combineItems](https://github.com/TopicElite/7combineItems)

You have in this script the possibility to combine two items to one or three to one. I named the variables and functions after the needed information, as well as what they do.

[Animation List:](https://alexguirre.github.io/animations-list/) [https://alexguirre.github.io/animations-list/](https://alexguirre.github.io/animations-list/)

To note is in the "**client.lua**" in line **19**. Here you have to replace your progressbar, if you don't have this [progressbar](https://github.com/Mobius1/rprogress) ([https://github.com/Mobius1/rprogress](https://github.com/Mobius1/rprogress)).

**Explanation of how the script works:**
If you look into the server.lua you will find in line 4 to 7 this code:
```lua
ESX.RegisterUsableItem('paperweed', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    combineTwoItems(source, xPlayer, 'paperweed', 'marijuana', 1, 'joint', 1, "Joint drehen", 10000, "mp_arresting", "a_uncuff")
end)
```

This makes the "paperweed" usable, when used it turns 1x "marijuana" and 1x "paperweed" into a "joint".

The player can use this item everywhere, i.e. he can use the "paperweed" everywhere on the map, if he has the other items in his inventory. As soon as he uses the item, the progressbar is triggered, and he does an emote, which looks similar to Joint turn.

So if you want to make more item combinable, I can write you the following template:

```lua
ESX.RegisterUsableItem('useITEM', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    combineTwoItems(source, xPlayer, 'useITEM', 'needItem', numberOfTheyNeed, 'resultItem', numberOfTheyGet, "TEXT", durationOfCombine, "EmoteCategory", "EmoteName")
end)
```

**Please do not republish this script or sell it on other platforms.**

If you have any questions, feel free to contact me.
Discord: TopicElite#0070
