local config = require 'config.server'

local function removeHungerAndThirst(src, player)
    if player.PlayerData.metadata.hunger >= 100 then
        player.PlayerData.metadata.hunger = 100
    end
    if player.PlayerData.metadata.thirst >= 100 then
        player.PlayerData.metadata.thirst = 100
    end
    local newHunger = player.PlayerData.metadata.hunger - config.player.hungerRate
    local newThirst = player.PlayerData.metadata.thirst - config.player.thirstRate
    if newHunger <= 0 then
        newHunger = 0
    end
    if newThirst <= 0 then
        newThirst = 0
    end
    player.Functions.SetMetaData('thirst', newThirst)
    player.Functions.SetMetaData('hunger', newHunger)
    TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
    player.Functions.Save()
end

CreateThread(function()
    local interval = 60000 * config.updateInterval
    while true do
        Wait(interval)
        for src, player in pairs(QBX.Players) do
            removeHungerAndThirst(src, player)
        end
    end
end)

local function pay(player)
    if player and QBX.Shared.Jobs[player.PlayerData.job.name] and player.PlayerData.job.grade.level and QBX.Shared.Jobs[player.PlayerData.job.name].grades[tostring(player.PlayerData.job.grade.level)] then
        local payment = QBX.Shared.Jobs[player.PlayerData.job.name].grades[tostring(player.PlayerData.job.grade.level)].payment
        if not payment then payment = player.PlayerData.job.payment end
        if exports["inv-businesses"]:IsPlayerOwnedBusiness(player.PlayerData.job.name) then
            if player.PlayerData.job.onduty then
                player.Functions.AddMoney('bank', 1200, "Paycheck") -- Paycheck for working at a player owned business. We do not use the society account for this.
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
            end
        elseif exports["t1ger_mechanicsystem"]:IsMechanicShop(player.PlayerData.job.name) then
            if player.PlayerData.job.onduty then
                player.Functions.AddMoney('bank', payment, "Paycheck") -- Paycheck for working at a player owned business. We do not use the society account for this.
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
            end
        else
            if player.PlayerData.job and payment > 0 and (QBX.Shared.Jobs[player.PlayerData.job.name].offDutyPay or player.PlayerData.job.onduty) then
                local account = exports.fd_banking:GetAccount(player.PlayerData.job.name)
                if account ~= 0 then -- Checks if player is employed by a society
                    if account < payment then -- Checks if company has enough money to pay society
                        print(string.format("NOT PAYING %s %s their paycheck of %s from %s because society is too poor", player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, payment, player.PlayerData.job.name))
                        TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Lang:t('error.company_too_poor'), 'error')
                    else
                        print(string.format("Paying %s %s their paycheck of %s from %s society account", player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, payment, player.PlayerData.job.name))
                        player.Functions.AddMoney('bank', payment, "Paycheck")
                        exports.fd_banking:RemoveMoney(player.PlayerData.job.name, payment)
                    end
                else
                    player.Functions.AddMoney('bank', payment, "Paycheck")
                end
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
                print(string.format("Error in pay #2 | Job Name %s | Payment Amount > 0 %s | Offduty Pay %s | Onduty %s | Either Or %s ",
                    player.PlayerData.job.name, payment > 0,
                    QBX.Shared.Jobs[player.PlayerData.job.name].offDutyPay,
                    player.PlayerData.job.onduty,
                    (QBX.Shared.Jobs[player.PlayerData.job.name].offDutyPay or player.PlayerData.job.onduty)
                ))
            end
        end
    else
        print(string.format("Error in pay #1 | Job Name %s | Grade Level %s | Has Grade %s", player.PlayerData.job.name, player.PlayerData.job.grade.level, QBShared.Jobs[player.PlayerData.job.name].grades[tostring(player.PlayerData.job.grade.level)] ~= nil))
    end
end

CreateThread(function()
    local interval = 60000 * config.money.paycheckTimeout
    while true do
        Wait(interval)
        for _, player in pairs(QBX.Players) do
            pay(player)
        end
    end
end)
