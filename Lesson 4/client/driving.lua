RegisterNetEvent('ap_uber_eats:client:StartDriving', function(data)
    if not Config or not data then
        print("[ERROR]: Incorrect config provided.")
    else
        print("Config and Data")
        local vehicleModel = "boxville"
        local pedModel = "a_m_m_business_01"
        
        local spawnCoords = vector3(-706.862, -223.595, 37.039)
        
        local targetCoords = data.targetCoords

        if Config.Debug then
            print("Starting convoy command...")
        end

        -- Model Loading
        RequestModel(vehicleModel)
        RequestModel(pedModel)

        local waitingThreshold = 50
        local attempts = 0

        while not HasModelLoaded(vehicleModel) or not HasModelLoaded(pedModel) do
            if attempts < waitingThreshold then
                Citizen.Wait(10)
            end
        end

        if Config.Debug then
            print("Models loaded successfully.")
        end

        -- Vehicle Creation
        local vehicle = CreateVehicle(vehicleModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 90.0, true, false)
        if not DoesEntityExist(vehicle) then
            print("Vehicle creation failed!")
            return
        end

        if Config.Debug then
            print("Vehicle created at spawn coordinates:", spawnCoords.x, spawnCoords.y, spawnCoords.z)
        end

        SetVehicleOnGroundProperly(vehicle)
        SetVehicleEngineOn(vehicle, true, true, false)
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleNeedsToBeHotwired(vehicle, false)

        -- Create a minimal driver ped (required for driving)
        local driver = CreatePed(4, pedModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, 90.0, true, false)

        if not DoesEntityExist(driver) then
            print("Driver ped creation failed!")
            DeleteEntity(vehicle)
            return
        end

        SetPedIntoVehicle(driver, vehicle, -1)

        if Config.Debug then
            print("Driver ped placed in vehicle.")
        end

        -- Driving parameters
        local speed = 40.0
        local drivingStyle = 1074528293 
        local stopRange = 0.0


        local success, roadCoords = GetClosestVehicleNode(targetCoords.x, targetCoords.y, targetCoords.z, 1, 3.0, 0)
        if not success then
            print("Failed to acquire a road node near target coordinates!")
            return
        end

        if Config.Debug then
            print("Navigation target acquired. Road node at:", roadCoords.x, roadCoords.y, roadCoords.z)
        end

        TaskVehicleDriveToCoordLongrange(driver, vehicle, roadCoords.x, roadCoords.y, roadCoords.z, speed, drivingStyle,
            stopRange)



        if Config.Debug then
            print("Longrange driving task issued. Vehicle should now follow the roads toward the target.")
        end

        if Config.Debug then
            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(2000)
                    local currentPos = GetEntityCoords(vehicle)
                    local dist = #(currentPos - vector3(roadCoords.x, roadCoords.y, roadCoords.z))
                    print(string.format("Vehicle position: %.2f, %.2f, %.2f | Distance to target: %.2f", currentPos.x,
                        currentPos.y, currentPos.z, dist))
                    if dist < stopRange then
                        print("Vehicle has reached near the target coordinates.")
                        DeleteEntity(vehicle)
                        DeleteEntity(driver)
                        TriggerServerEvent("ap_uber_eats:server:DeliverOrder", data)
                        break
                    end
                end
            end)
        end
    end
end)

