lib.locale()

Citizen.CreateThread(function()

    for k, v in pairs(Config.Location) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(10)
        end
        npc = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z - 1.0, v.rot, false, false)
        FreezeEntityPosition(npc, true)
        SetEntityHeading(npc, v.rot)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)

        RequestAnimDict(v.anim)
        while not HasAnimDictLoaded(v.anim) do
            Wait(10)
        end
        TaskPlayAnim(npc, v.anim, v.dict, 1.0, -1.0, -1, 1, 1, true, true, true)

        exports.ox_target:addSphereZone({
            coords = vec3(v.x, v.y, v.z),
            radius = 1.0,
            debug = false,
            drawSprite = false,
            options = {
                {
                    label = locale("target_player"),
                    icon = 'fa-regular fa-hand',
                    iconColor = Config.IconColor,
                    onSelect = function()
                        local input = lib.inputDialog(locale("target_player"), {
                            {type = 'input', label = locale("amount"), placeholder = '1000'}
                        })

                        if input == nil then
                            lib.notify({
                                title = locale("notify_title"),
                                description = locale("no_input"),
                                position = Config.NotifyPosition,
                                duration = Config.NotifyDuration,
                                type = 'error'
                            })
                        else
                            local item = ESX.SearchInventory('black_money', tonumber(input[1]))
                            if item >= tonumber(input[1]) then
                                SetEntityCoords(PlayerPedId(), v.playerx, v.playery, v.playerz)
                                SetEntityHeading(PlayerPedId(), v.playerrot)
                                RequestAnimDict("anim@heists@ornate_bank@grab_cash")
                                while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") do
                                    Wait(3)
                                end
                                TaskPlayAnim(npc, "anim@heists@ornate_bank@grab_cash", "grab", 1.0, -1.0, -1, 1, 1, true, true, true)
                                lib.progressCircle({
                                    duration = 10000,
                                    label = locale("give_cash"),
                                    position = 'bottom',
                                    canCancel = false,
                                    anim = {
                                        dict = 'anim@heists@box_carry@',
                                        clip = 'idle',
                                    },
                                    prop = {
                                        model = 'prop_cash_case_01',
                                        bone = 28422,
                                        pos = vec3(-0.0050, -0.1870, -0.1400),
                                        rot = vec3(0.0, 0.0, 0.0),
                                    },
                                    disable = {
                                        move = true,
                                        combat = true,
                                    },
                                })
                                StopAnimTask(npc, "anim@heists@ornate_bank@grab_cash", "grab", 1.0)
                                Wait(500)
                                RequestAnimDict("misscarsteal4@actor")
                                while not HasAnimDictLoaded("misscarsteal4@actor") do
                                    Wait(3)
                                end
                                TaskPlayAnim(npc, "misscarsteal4@actor", "actor_berating_loop", 1.0, -1.0, -1, 1, 1, true, true, true)
                                lib.progressCircle({
                                    duration = 7000,
                                    label = locale("discuss"),
                                    position = 'bottom',
                                    canCancel = false, 
                                    anim = {
                                        dict = 'anim@amb@nightclub@peds@',
                                        clip = 'rcmme_amanda1_stand_loop_cop',
                                    },
                                    disable = {
                                        move = true,
                                        combat = true,
                                    },               
                                })                
                                StopAnimTask(npc, "misscarsteal4@actor", "actor_berating_loop", 1.0)            
                                RequestAnimDict(v.anim)
                                while not HasAnimDictLoaded(v.anim) do
                                    Wait(10)
                                end
                                TaskPlayAnim(npc, v.anim, v.dict, 1.0, -1.0, -1, 1, 1, true, true, true)
                                local amount = tonumber(input[1])
                                TriggerServerEvent('DFNZ_MONEY_WASH:wash_money', amount)
                            else
                                lib.notify({
                                    title = locale("notify_title"),
                                    description = locale("no_black"),
                                    duration = Config.NotifyDuration,
                                    position = Config.NotifyPosition,
                                    type = 'error'
                                })
                            end                            
                        end
                    end
                }
            }
        })
    end
end)
