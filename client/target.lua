-----------------For support, scripts, and more----------------
--------------- https://discord.gg/VGYkkAYVv2  -------------
---------------------------------------------------------------

if Config.QBtarget then
    exports[Config.Target]:AddBoxZone("mrpdscreen", vector3(439.44, -985.89, 34.97), 2.6, 0.4,{
        name="mrpdscreen",
        heading=0,
        minZ=35.22,
        maxZ=36.62,
        debugPoly=false
        },{
            options = {
                {
                    action = function(entity) 
                        if IsPedAPlayer(entity) then return false end 
                        TriggerEvent('snipe-mrpdscreen:client:OpenUI', "mrpdmeeting")
                    end,
                    icon = Config.Locale["icon_for_target"],
                    label = Config.Locale["change_url"],
                    job = Config.Job,
                },
                {
                    action = function(entity) 
                        if IsPedAPlayer(entity) then return false end 
                        TriggerEvent('snipe-mrpdscreen:client:removeDUI', "mrpdmeeting")
                    end,
                    icon = Config.Locale["icon_for_target"],
                    label = Config.Locale["remove_image"],
                    job = Config.Job,
                },
            },				
            distance = 2.5
        })

    exports[Config.Target]:AddBoxZone("mrpdclassroom", vector3(455.02, -985.87, 34.97), 0.2, 3.0, {
        name="mrpdclassroom",
        heading=270,
        --debugPoly=true,
        minZ=35.12,
        maxZ=37.12
    },{
        options = {
            {
                action = function(entity) 
                    if IsPedAPlayer(entity) then return false end 
                    TriggerEvent('snipe-mrpdscreen:client:OpenUI', "classroom")
                    end,
                icon = Config.Locale["icon_for_target"],
                label = Config.Locale["change_url"],
                job = Config.Job,
            },
            {
                action = function(entity) 
                    if IsPedAPlayer(entity) then return false end 
                    TriggerEvent('snipe-mrpdscreen:client:removeDUI', "classroom")
                end,
                icon = Config.Locale["icon_for_target"],
                label = Config.Locale["remove_image"],
                job = Config.Job,
            },
        },				
        distance = 2.5
    })
elseif Config.BTTarget then
    exports[Config.Target]:AddBoxZone("mrpdscreen", vector3(439.44, -985.89, 34.97), 2.6, 0.4,{
        name="mrpdscreen",
        heading=0,
        minZ=35.22,
        maxZ=36.62,
        debugPoly=false
        },{
            options = {
                {
                    event = "snipe-mrpdscreen:client:OpenUImrpdmeeting",
                    icon = Config.Locale["icon_for_target"],
                    label = Config.Locale["change_url"],
                    
                },
                {
                    event = "snipe-mrpdscreen:client:removeDUImrpdmeeting",
                    icon = Config.Locale["icon_for_target"],
                    label = Config.Locale["remove_image"],
                },
            },	
            job = Config.Job,			
            distance = 2.5
        })

    exports[Config.Target]:AddBoxZone("mrpdclassroom", vector3(455.02, -985.87, 34.97), 0.2, 3.0, {
        name="mrpdclassroom",
        heading=270,
        --debugPoly=true,
        minZ=35.12,
        maxZ=37.12
    },{
        options = {
            {
                event = "snipe-mrpdscreen:client:OpenUIclassroom",
                icon = Config.Locale["icon_for_target"],
                label = Config.Locale["change_url"],
            },
            {
                event = "snipe-mrpdscreen:client:removeDUIclassroom",
                icon = Config.Locale["icon_for_target"],
                label = Config.Locale["remove_image"],
            },
        },		
        job = Config.Job,		
        distance = 2.5
    })
end
