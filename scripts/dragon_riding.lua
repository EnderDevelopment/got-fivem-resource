local dragonModels = {
    'a_c_chop'
}

local dragons = {}

AddEventHandler('playerSpawned', function()
    local playerId = source
    dragons[playerId] = nil
end)

RegisterCommand('spawnDragon', function(source, args, rawCommand)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)

    if not dragons[playerId] then
        local dragonModel = dragonModels[1]
        RequestModel(dragonModel)
        while not HasModelLoaded(dragonModel) do
            Wait(500)
        end

        local dragon = CreatePed(28, dragonModel, playerCoords.x, playerCoords.y, playerCoords.z, 0.0, true, true)
        SetPedIntoVehicle(playerPed, dragon, -1)
        dragons[playerId] = dragon

        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Dragon spawned!'}
        })
    else
        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You already have a dragon!'}
        })
    end
end, false)

RegisterCommand('dismountDragon', function(source, args, rawCommand)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)

    if dragons[playerId] then
        TaskLeaveVehicle(playerPed, dragons[playerId], 0)
        DeleteEntity(dragons[playerId])
        dragons[playerId] = nil

        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Dragon dismounted!'}
        })
    else
        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'You do not have a dragon!'}
        })
    end
end, false)