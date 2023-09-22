Config = {}

Config.NotifyPosition = 'top' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left'
Config.NotifyDuration = 5000 -- 1000 = 1 second
Config.TextUIPosition = 'right-center' --'right-center' or 'left-center' or 'top-center'

Config.UseProgbar = true -- let the player put out an money briefcase

Config.WashTax = 0.5 -- means -50% so the player gets half the amount of the blackmoney

Config.WebhookURL = 'YOUR WEBHOOK' -- enter your webhook here
Config.WebhookColor = '16735488'

Config.interactionKey = 38 -- if you change this you need to change the ["textui"] message aswell!

Config.Text = {

    ["textui"] = "[E] - Rede mit dem G",
    ["floatingtext"] = "~o~G~s~: Hast du dreckige Wäsche Für mich?",
    ["money_wash"] = "Geldwäsche",
    ["amount"] = "Wie viel willst du waschen?",
    ["negotiate"] = "Verhandeln..",
    ["discuss"] = "Diskutieren..",
    ["wash_success"] = "Du hast dein Schwarzgeld gewaschen",
    ["wash_failure"] = "Du hast nicht genug Schwargeld",

}