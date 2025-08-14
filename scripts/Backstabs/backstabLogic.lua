local storage = require("openmw.storage")
local types = require("openmw.types")
local self = require("openmw.self")
local I = require('openmw.interfaces')
require("scripts.Backstabs.backstabData")

local sectionToggles = storage.globalSection("SettingsBackstabs_toggles")
local sectionValues = storage.globalSection("SettingsBackstabs_values")
local sectionWeaponTypes = storage.globalSection("SettingsBackstabs_weaponTypes")
local sectionDebug = storage.globalSection("SettingsBackstabs_debug")

function GetBackstabMultiplier(attack)
    -- check if youre seen
    local diff = 0
    if not sectionDebug:get("alwaysBackstab") then
        local attackerYaw = attack.attacker.rotation:getYaw()
        local victimYaw = self.rotation:getYaw()
        diff = math.abs(victimYaw - attackerYaw)
        local npcFov = math.pi * math.abs(sectionValues:get("npcFov") - 360) / 360
        if diff > npcFov then return 1 end
    end

    -- init damage mult calculation
    local mode = Modes[sectionValues:get("mode")]
    local damageMult = mode(attack.attacker)

    -- [[special cases]]
    -- if actor is an npc in combat
    if (I.AI ~= nil
        and I.AI.getActivePackage() ~= nil
        and I.AI.getActivePackage().type == "Combat")
        -- or a player has a weapon or spell ready
        or (I.AI == nil and types.Actor.getStance(self) ~= types.Actor.STANCE.Nothing)
    then
        damageMult = damageMult * sectionValues:get("fightingMult")
    end
    -- special weapon used
    if sectionToggles:get("enableSpecialWeaponInstakill") and attack.weapon then
        for _, instakillWeapon in ipairs(InstakillWeapons) do
            if attack.weapon.recordId == instakillWeapon then
                damageMult = math.huge
                break
            end
        end
    end

    -- you shouldn't be able to hit for less damage
    damageMult = math.max(damageMult, 1)

    if sectionDebug:get("printToConsole") then
        print(
            "Backstabs multiplier debug message!" ..
            "\nAttacker:            " .. attack.attacker.recordId ..
            "\nVictim:              " .. self.recordId ..
            "\nIs victim in combat: " .. tostring(I.AI ~= nil and I.AI.getActivePackage() ~= nil and I.AI.getActivePackage().type == "Combat") ..
            "\nWeapon used:         " .. (attack.weapon ~= nil and attack.weapon.recordId or "nil") ..
            "\nView angle diff:     " .. tostring(diff / math.pi * 360) .. " degrees" ..
            "\nDamage modifier:     x" .. tostring(damageMult))
    end

    return damageMult
end

function DoBackstab(attack)
    if not sectionToggles:get("modEnabled") then return end
    -- basic attack check
    if not attack.successful
        or attack.sourceType == "magic"
        or attack.sourceType == "unspecified"
        then return end
    -- weapon type check
    if attack.weapon == nil then
        if     I.AI ~= nil and not sectionWeaponTypes:get("h2hEnabled") then return
        elseif I.AI == nil and not sectionToggles:get("creatureBackstabsEnabled") then return end
    else
        local weaponRecord = types.Weapon.record(attack.weapon.recordId)
        if not WeaponTypes[weaponRecord.type]() then return end
    end

    local damageMult = GetBackstabMultiplier(attack)
    if damageMult == 1 then return end

    -- I don't want to mix them together
    if attack.damage.health then
        local initDamage = attack.damage.health
        attack.damage.health = attack.damage.health * damageMult

        if sectionDebug:get("printToConsole") then
            print(
                "Backstabs damage debug message!" ..
                "\nDamage is dealt to:  health" ..
                "\nInitial damage:      " .. tostring(initDamage) ..
                "\nDamage modifier:     x" .. tostring(damageMult) ..
                "\nFinal damage:        " .. tostring(attack.damage.health))
        end
    elseif attack.damage.fatigue then
        local initDamage = attack.damage.fatigue
        attack.damage.fatigue = attack.damage.fatigue * damageMult

        if sectionDebug:get("printToConsole") then
            print(
                "Backstabs debug message!" ..
                "\nDamage is dealt to:  fatigue" ..
                "\nInitial damage:      " .. tostring(initDamage) ..
                "\nDamage modifier:     x" .. tostring(damageMult) ..
                "\nFinal damage:        " .. tostring(attack.damage.fatigue))
        end
    else
        -- just in case
        return
    end

    attack.attacker:sendEvent("onBackstab", damageMult)
end
