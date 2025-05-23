local currentResourceName = GetCurrentResourceName()
local targeting = exports[currentResourceName]

AddEventHandler(currentResourceName..':debug', function(data)
    print('Entity: '..data.entity, 'Model: '..GetEntityModel(data.entity), 'Type: '..GetEntityType(data.entity))
    if data.remove then
        targeting:RemoveTargetEntity(data.entity, 'Hello World')
    else
        targeting:AddTargetEntity(data.entity, {
            options = {
                {
                    type = "client",
                    event = currentResourceName..':debug',
                    icon = "fas fa-box-circle-check",
                    label = "Xin chào thế giới",
                    remove = true
                },
            },
            distance = 3.0
        })
    end
end)

targeting:AddGlobalPed({
    options = {
        {
            type = "client",
            event = currentResourceName..':debug',
            icon = "fas fa-male",
            label = "(Debug) Ped",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalVehicle({
    options = {
        {
            type = "client",
            event = currentResourceName..':debug',
            icon = "fas fa-car",
            label = "(Debug) Vehicle",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalObject({
    options = {
        {
            type = "client",
            event = currentResourceName..':debug',
            icon = "fas fa-cube",
            label = "(Debug) Object",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalPlayer({
    options = {
        {
            type = "client",
            event = currentResourceName..':debug',
            icon = "fas fa-cube",
            label = "(Debug) Player",
        },
    },
    distance = Config.MaxDistance
})