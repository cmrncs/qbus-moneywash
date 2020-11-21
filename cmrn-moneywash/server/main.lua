QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent("QB-moneywash:server:checkInv")
AddEventHandler("QB-moneywash:server:checkInv", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

        if Player.Functions.GetItemByName('markedbills') ~= nil then
            local amt = Player.Functions.GetItemByName('markedbills').amount
            TriggerClientEvent('QB-moneywash:client:startTimer', src, amt)
            TriggerClientEvent('QBCore:Notify', src, 'You put the bills in the washer.', 'success')
            Player.Functions.RemoveItem('markedbills', amt)
 
        else
            TriggerClientEvent('QBCore:Notify', src, 'You have no marked bills.', 'error') 
        end

end)

RegisterNetEvent("QB-moneywash:server:giveMoney")
AddEventHandler("QB-moneywash:server:giveMoney", function(amt)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    payment = amt 
    Player.Functions.AddMoney('cash', payment)  
end)
