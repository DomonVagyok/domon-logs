RegisterNetEvent('domon-logs:log', function(nev, cim, szin, uzenet)
    local webhook = Domon.Webhookok[nev]
    local date = os.date('*t')
    local embed = {
        {
            ['title'] = cim,
            ['color'] = Domon.Szinek[szin] or Domon.Szinek['alap'],
            ['footer'] = {
                ['text'] = "Dátum és idő:  "..date.year..'.'..date.month..'.'..date.day.. ' - ' ..date.hour..':'..date.min.."\nDomon Scripts"
            },
            ['description'] = uzenet,
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = Domon.Discordnev, avatar_url = Domon.Discordavatar, embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerConnecting', function()
    local jatekos = 'Játékos: **'..GetPlayerName(source)..'**'
    local ids = ExtractIdentifiers(source)
    local steam = '\nSteam ID: **'..ids.steam..'**'
    local license = '\nRockstar License: **'..ids.license..'**'
    local ip = '\nIP cím: **'..ids.ip..'**'
    local discord = "\nDiscord ID: <@"..ids.discord:gsub("discord:", "")..">"
    TriggerEvent('domon-logs:log', 'csatlakozas', 'Csatlakozás Log', 'alap', ''..jatekos..' '..steam..' '..license..' '..discord..' '..ip..'')
end)

AddEventHandler('playerDropped', function()
    local jatekos = 'Játékos: **'..GetPlayerName(source)..'**'
    local ids = ExtractIdentifiers(source)
    local steam = '\nSteam ID: **'..ids.steam..'**'
    local license = '\nRockstar License: **'..ids.license..'**'
    local ip = '\nIP cím: **'..ids.ip..'**'
    local discord = "\nDiscord ID: <@"..ids.discord:gsub("discord:", "")..">"
    TriggerEvent('domon-logs:log', 'lecsatlakozas', 'Lecsatlakozás Log', 'alap', ''..jatekos..' '..steam..' '..license..' '..discord..' '..ip..'')
end)

function ExtractIdentifiers(source)
    local identifiers = {
        steam = "",
        ip = "",
        discord  = "", 
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end