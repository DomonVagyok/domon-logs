# Domon Logs

Ezzel a scripttel bármit logoltathatsz nagyon egyszerűen!

# Használata

Webhook hozzáadása: a config.lua-ban az utolsó webhook után van egy kikommentelt vessző ami elől vedd ki a -- jeleket. Ez után a következő sor elejéről vedd ki szintén a -- jeleket és helyettesítsd be a webhookot és a nevet úgy ahogy fent látható!

Szerver oldalon: TriggerClientEvent('domon-logs:log', 'Webhook neve a config.lua-ból', 'Cím', 'Szín neve a config.lua-ból', 'Üzenet')
Kliens oldalon: TriggerEvent('domon-logs:log', 'Webhook neve a config.lua-ból', 'Cím', 'Szín neve a config.lua-ból', 'Üzenet')
