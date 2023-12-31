lib.locale()

RegisterServerEvent('DFNZ_MONEY_WASH:wash_money')
AddEventHandler('DFNZ_MONEY_WASH:wash_money', function(amount)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= amount then
        xPlayer.removeAccountMoney('black_money', amount)
        if Config.UseWashTax then
            xPlayer.addAccountMoney('money', math.floor(amount * Config.WashTax))
            TriggerClientEvent('ox_lib:notify', source, {
                title = locale("notify_title"), 
                description = locale("wash_success"), 
                type = 'success',
                position = Config.NotifyPosition,
                duration = Config.NotifyDuration
            })
            sendToDiscord(color, 'Money Wash','**NAME:** '..xPlayer.name..'\n **ID:** '..xPlayer.source..'\n **IDENTIFIER:** '..xPlayer.getIdentifier()..'\n **AMOUNT:** '..amount * Config.WashTax, footer)
        else
            xPlayer.addAccountMoney('money', amount)
            sendToDiscord(color, 'Money Wash','**NAME:** '..xPlayer.name..'\n **ID:** '..xPlayer.source..'\n **IDENTIFIER:** '..xPlayer.getIdentifier()..'\n **AMOUNT:** '..amount, footer)
        end
    else
        TriggerClientEvent('ox_lib:notify', source, {
            title = locale("notify_title"), 
            description = locale("wash_fail"), 
            type = 'error',
            position = Config.NotifyPosition,
            duration = Config.NotifyDuration
        })
    end
end)

function sendToDiscord(color, name, message, footer)
    local embed = {
          {
              ["color"] = Config.WebhookColor,
              ["title"] = "**__"..name.."__**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Moneywash Script by DFNZ",
                  ["icon_url"] = "https://cdn.discordapp.com/attachments/1141806392496369794/1152893648321646592/DFINEZ_LOGO_NEW.png"
              },
          }
      }
  
    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({username = "DFNZ", embeds = embed}), { ['Content-Type'] = 'application/json' })
end
