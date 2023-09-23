Config = {}

Config.NotifyPosition = 'top' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left'
Config.NotifyDuration = 5000 -- 1000 = 1 second
Config.TextUIPosition = 'right-center' --'right-center' or 'left-center' or 'top-center'

Config.PedPosition = {x = 239.85, y = -2017.60, z = 18.32, rot = 141.73} -- position where the ped is
Config.PedModel = "csb_g" -- choose one of these https://docs.fivem.net/docs/game-references/ped-models/
Config.SpawnDistance = 25 -- in which distance should the ped spwan?

Config.UseProgbar = true -- needs to be activated for the animations / if it is on false there will be no animation at all

Config.WashTax = 0.5 -- means -50% so the player gets half the amount of the blackmoney

Config.WebhookURL = 'YOUR WEBHOOK' -- enter your webhook here
Config.WebhookColor = '16735488'

Config.interactionKey = 38 -- if you change this you need to change the ["textui"] message aswell!

Config.Text = { -- Comment out what you don't need

    -- DE TRANSLATION
    -- ["textui"] = "[E] - Rede mit dem G",
    -- ["floatingtext"] = "~o~G~s~: Hast du dreckige Wäsche Für mich?",
    -- ["money_wash"] = "Geldwäsche",
    -- ["amount"] = "Wie viel willst du waschen?",
    -- ["negotiate"] = "Verhandeln..",
    -- ["discuss"] = "Diskutieren..",
    -- ["wash_success"] = "Du hast dein Schwarzgeld gewaschen",
    -- ["wash_failure"] = "Du hast nicht genug Schwargeld",

    -- EN TRANSLATION
    ["textui"] = "[E] - Talk to the G",
    ["floatingtext"] = "~o~G~s~: You got dirty money for me?",
    ["money_wash"] = "Moneywash",
    ["amount"] = "How much money do you want to launder??",
    ["negotiate"] = "Negotiate..",
    ["discuss"] = "Discuss..",
    ["wash_success"] = "You laundered your black money",
    ["wash_failure"] = "You don't have enough black money",
}
