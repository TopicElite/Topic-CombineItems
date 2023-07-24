Config = {}

Config.CombineItems = {
    {
        resultItem = 'joint',
        resultItemCount = 1,
        progressbarTitle = "Turn joint",
        progressbarDuration = 10000,-- in ms
        animationClass = 'mp_arresting',
        animation = 'a_uncuff',
        usableItem = 'marijuana', -- The item must be listed in NeedItems as well.
        needItems = {
            ['marijuana'] = {
                count = 1,
                remove = true, -- remove the Item after combinding.
            },
            ['papers'] = {
                count = 1,
                remove = true, -- remove the Item after combinding.
            },
        }
    }
}