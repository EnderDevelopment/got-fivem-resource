RegisterCommand('fireBreath', function(source, args, rawCommand)
    local playerId = source
    TriggerClientEvent('fireBreath', playerId)
end, false)

RegisterNetEvent('fireBreath')
AddEventHandler('fireBreath', function()
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)

    RequestNamedPtfxAsset('core')
    while not HasNamedPtfxAssetLoaded('core') do
        Wait(500)
    end

    UseParticleFxAssetNextCall('core')
    StartParticleFxNonLoopedAtCoord('ent_sht_flame', playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false)

    TriggerClientEvent('chat:addMessage', source, {
        color = {255, 0, 0},
        multiline = true,
        args = {'System', 'Fire breath activated!'}
    })
end)