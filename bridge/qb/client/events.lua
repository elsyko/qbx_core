local config = require 'config.client'

-- Trigger Command
--- @deprecated
RegisterNetEvent('QBCore:Command:CallCommand', function(command)
    ExecuteCommand(command)
end)

-- RegisterNetEvent('QBCore:Client:VehicleInfo', function(info)
--     local timeout = 0
--     while not NetworkDoesEntityExistWithNetworkId(info.netId) and timeout < 1000 do 
--         timeout = timeout + 1
--         Wait(1) 
--     end
--     local vehicle = NetworkGetEntityFromNetworkId(info.netId)
--     if not DoesEntityExist(vehicle) then return end
--     local plate = GetPlate(vehicle)
--     local hasKeys = config.hasKeys(plate)
--     local data = {
--         vehicle = vehicle,
--         seat = info.seat,
--         name = info.modelName,
--         plate = plate,
--         driver = GetPedInVehicleSeat(vehicle, -1),
--         inseat = GetPedInVehicleSeat(vehicle, info.seat),
--         haskeys = hasKeys
--     }
--     TriggerEvent('QBCore:Client:'..info.event..'Vehicle', data)
-- end)