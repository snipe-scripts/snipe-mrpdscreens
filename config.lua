Config = {}

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

Config.QBtarget = true -- if this is true, it will use qb-target exports

Config.BTTarget = false -- if this is truem it will use bt-target exports

Config.Target = "qb-target" -- the target folder name (can be anything) ("bt-target" if using bt-target)

Config.Locale = {
    ["change_url"] = "Change URL!", 
    ["icon_for_target"] = "fas fa-circle", --this is the font awesome icon
    ["invalid"] = "Invalid URL",
    ["wrong_image"] = "Image not present in the right discord channel",
    ["remove_image"] = "Remove current Image!" -- this is the target text
}

--job check for target

-- Config.Job = { ["police"] = 0,  ["ambulance"] = 2 } -- uncomment this line if specific job checks for qb-target(comment if you dont want job check)

-- Config.Job = {"all"} -- comment this line if you are using qb-target and not bt-target (if using bt-target, this line needs to be uncommented!)

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "MRPD Screen" --Title that displays on okoknotify

Config.RestrictMode = false --set to to true if you want to restrict people from using any images and use only the images from Allowed Discord Channels, if false users can use any link for images

--[[
    Just add as many channels you want if you set RestrictMode to true
]]--
Config.AllowedChannels = { --Allowed Discord channels for PNG upload
    "https://cdn.discordapp.com/attachments/909905066671108136",  -- the number after "attachments/" is the channel id, to get that, just right click on the channel and copy id (for now this is the teasers channel on my discord)
    -- "https://cdn.discordapp.com/attachments/909905066671108136",  

}