local jobs = {
    ['knight'] = {
        label = 'Knight',
        salary = 1000
    },
    ['archer'] = {
        label = 'Archer',
        salary = 800
    },
    ['mage'] = {
        label = 'Mage',
        salary = 1200
    }
}

RegisterCommand('setJob', function(source, args, rawCommand)
    local playerId = source
    local jobName = args[1]

    if jobs[jobName] then
        local job = jobs[jobName]
        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Job set to ' .. job.label}
        })
    else
        TriggerClientEvent('chat:addMessage', playerId, {
            color = {255, 0, 0},
            multiline = true,
            args = {'System', 'Invalid job name!'}
        })
    end
end, false)