local pos = {x = 239.85, y = -2017.60, z = 18.32, rot = 141.73}
local isNearPed = false
local isAtPed = false
local isPedLoaded = false
local pedModel = GetHashKey("csb_g")
local npc

Citizen.CreateThread(function()

    while true do
    
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local distance = Vdist(playerCoords, pos.x, pos.y, pos.z)
        isNearPed = false
        isAtPed = false

        if distance < 25 then
            isNearPed = true
            if not isPedLoaded then
                RequestModel(pedModel)
                while not HasModelLoaded(pedModel) do
                    Wait(10)
                end

                npc = CreatePed(4, pedModel, pos.x, pos.y, pos.z - 1.0, pos.rot, false, false)
                FreezeEntityPosition(npc, true)
                SetEntityHeading(npc, pos.rot)
                SetEntityInvincible(npc, true)
                SetBlockingOfNonTemporaryEvents(npc, true)

                isPedLoaded = true
            end
        end

        if isPedLoaded and not isNearPed then
            DeleteEntity(npc)
            SetModelAsNoLongerNeeded(pedModel)
            isPedLoaded = false        
        end

        if distance < 2.0 then
            isAtPed = true
        end
        Citizen.Wait(500)
    end

end)

Citizen.CreateThread(function()

    while true do
        if isAtPed then
            ESX.ShowFloatingHelpNotification(Config.Text["floatingtext"], vector3(pos.x, pos.y, pos.z + 0.85))

            lib.showTextUI(Config.Text["textui"], {
                position = Config.TextUIPosition,
                icon = 'user',
                iconColor = '#FF6000'
            })

            if IsControlJustReleased(0, Config.interactionKey) then
                moneyInput()
                lib.hideTextUI()
            end
        end

        if not isAtPed then
            lib.hideTextUI()
        end
        Citizen.Wait(1)
    end
end)

function moneyInput()

    local input = lib.inputDialog(Config.Text["money_wash"], {
        {type = 'input', label = Config.Text["amount"], placeholder = '1000', icon = 'user', required = true}
    })

       
    local amount = tonumber(input[1])

    if not input then return end
    
    if Config.UseProgbar == true then
        if lib.progressCircle({
            duration = 10000,
            label = Config.Text["negotiate"],
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
            }
        }) then
            TaskPlayAnim(npc, "misscarsteal4@actor", "actor_berating_loop", 8.0, -8.0, -1, 60, 0)
            lib.progressCircle({
                duration = 7000,
                label = Config.Text["discuss"],
                position = 'bottom',
                canCancel = false, 
                anim = {
                    dict = 'anim@amb@nightclub@peds@',
                    clip = 'rcmme_amanda1_stand_loop_cop',
                },               
            })   
            TriggerServerEvent('DFNZ_MONEY_WASH:wash_money', amount)
        end
    else
        TriggerServerEvent('DFNZ_MONEY_WASH:wash_money', amount)
    end
        
end