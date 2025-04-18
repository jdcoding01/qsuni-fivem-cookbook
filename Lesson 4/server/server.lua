local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ap_uber_eats:server:RequestMenu", function()
    local src = source
    local restaurants = Restaurants

    TriggerClientEvent("ap_uber_eats:client:OpenMenu", src, {
        restaurants = restaurants,
        action = "openUI"
    })

end)

RegisterNetEvent("ap_uber_eats:server:PlaceOrder", function(clientData)
    local data = clientData.data
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local paymentMethod = "bank"
    local totalPrice = data.totalPrice or 100
    local targetCoords = clientData.targetCoords

    if paymentMethod == "bank" then
        if player.PlayerData.money["bank"] >= totalPrice then
            player.Functions.RemoveMoney("bank", totalPrice, "Uber Eats order")
            
            TriggerClientEvent('QBCore:Notify', src, "Order placed, money deducted from bank", "success")

            local metadataItems = {}

            for itemName, itemData in pairs(data.items) do
                metadataItems[itemName] = itemData.quantity or 1
            end

            local metadata = {
                items = metadataItems,
                totalPrice = totalPrice,
                targetCoords = targetCoords,
                paymentMethod = paymentMethod
            }
            
            TriggerClientEvent('ap_uber_eats:client:StartDriving', src, metadata)
        else
            TriggerClientEvent('QBCore:Notify', src, "Not enough money in bank", "error")
        end

    end
end)

RegisterNetEvent("ap_uber_eats:server:DeliverOrder", function(data)
    local src = source

    if data and data.items then
        for itemName, itemCount in pairs(data.items) do
            print("Giving x" .. itemCount .. " " .. itemName)
           
            exports['qs-inventory']:AddItem(src, itemName, itemCount)
        
        end
    else
        print("No valid order data received for DeliverOrder event.")
    end
end)