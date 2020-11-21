dlnCore = nil
TriggerEvent('dlnCore:GetObject', function(obj) dlnCore = obj end)

RegisterNetEvent("dln-moneywash:server:checkInv")
AddEventHandler("dln-moneywash:server:checkInv", function()
    local src = source
    local Player = dlnCore.Functions.GetPlayer(src)

        if Player.Functions.GetItemByName('markedbills') ~= nil then
            local amt = Player.Functions.GetItemByName('markedbills').amount
            TriggerClientEvent('dln-moneywash:client:startTimer', src, amt)
            TriggerClientEvent('dlnCore:Notify', src, 'You put the bills in the washer.', 'success')
            Player.Functions.RemoveItem('markedbills', amt)
 
        else
            TriggerClientEvent('dlnCore:Notify', src, 'You have no marked bills.', 'error') 
        end

end)

RegisterNetEvent("dln-moneywash:server:giveMoney")
AddEventHandler("dln-moneywash:server:giveMoney", function(amt)
    local src = source
    local Player = dlnCore.Functions.GetPlayer(src)
    payment = amt 
    Player.Functions.AddMoney('cash', payment)  
end)
