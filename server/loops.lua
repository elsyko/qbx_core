local config = require 'config.server'

local function removeHungerAndThirst(src, player)
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
    local job = player.PlayerData.job
    if player and QBX.Shared.Jobs[job.name] and job.grade.level and QBX.Shared.Jobs[job.name].grades[tostring(job.grade.level)] then
        local payment = GetJob(job.name).grades[job.grade.level].payment or job.payment
        if exports["inv-businesses"]:IsPlayerOwnedBusiness(job.name) then
            if job.onduty then
                player.Functions.AddMoney('bank', 1200, "Paycheck") -- Paycheck for working at a player owned business. We do not use the society account for this.
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
            end
        elseif exports["t1ger_mechanicsystem"]:IsMechanicShop(job.name) then
            if job.onduty then
                player.Functions.AddMoney('bank', payment, "Paycheck") -- Paycheck for working at a player owned business. We do not use the society account for this.
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
            end
        else
            if job and payment > 0 and (QBX.Shared.Jobs[job.name].offDutyPay or job.onduty) then
                local account = exports.fd_banking:GetAccount(job.name)
                if account ~= 0 then -- Checks if player is employed by a society
                    if account < payment then -- Checks if company has enough money to pay society
                        print(string.format("NOT PAYING %s %s their paycheck of %s from %s because society is too poor", player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, payment, job.name))
                        TriggerClientEvent('QBCore:Notify', player.PlayerData.source, Lang:t('error.company_too_poor'), 'error')
                    else
                        print(string.format("Paying %s %s their paycheck of %s from %s society account", player.PlayerData.charinfo.firstname, player.PlayerData.charinfo.lastname, payment, job.name))
                        player.Functions.AddMoney('bank', payment, "Paycheck")
                        exports.fd_banking:RemoveMoney(job.name, payment)
                    end
                else
                    player.Functions.AddMoney('bank', payment, "Paycheck")
                end
            else
                player.Functions.AddMoney('bank', 100, "Paycheck")
                print(string.format("Error in pay #2 | Job Name %s | Payment Amount > 0 %s | Offduty Pay %s | Onduty %s | Either Or %s ",
                    job.name, payment > 0,
                    QBX.Shared.Jobs[job.name].offDutyPay,
                    job.onduty,
                    (QBX.Shared.Jobs[job.name].offDutyPay or job.onduty)
                ))
            end
        end
    else
        print(string.format("Error in pay #1 | Job Name %s | Grade Level %s | Has Grade %s", job.name, job.grade.level, QBShared.Jobs[job.name].grades[tostring(job.grade.level)] ~= nil))
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
