local storage = require("openmw.storage")
local types = require("openmw.types")
local self = require("openmw.self")
local util = require("openmw.util")
local I = require('openmw.interfaces')

local sectionGeneral = storage.globalSection("SettingsBackstabs_general")
local getActorSneak = types.NPC.stats.skills.sneak

local modes = {
    ["Mixed"] = function(player)
        local fm = sectionGeneral:get("flatMult")
        local ps = getActorSneak(player).modified
        local sm = sectionGeneral:get("sneakMult")
        return fm + ps * sm
    end,
    ["Skill-based"] = function(player)
        local ps = getActorSneak(player).modified
        local sm = sectionGeneral:get("sneakMult")
        return ps * sm
    end,
    ["Flat"] = function(player)
        local fm = sectionGeneral:get("flatMult")
        return fm
    end,
    ["Instakill"] = function(player)
        return math.huge
    end
}

I.Combat.addOnHitHandler(function(attack)
    if not sectionGeneral:get("modEnabled") then return end
    if not attack.successful or not attack.weapon then return end

    local playerYaw = attack.attacker.rotation:getYaw()
    local enemyYaw = self.rotation:getYaw()
    local diff = util.normalizeAngle(math.abs(enemyYaw - playerYaw))
    if diff > math.pi * sectionGeneral:get("npcFov") / 360 then return end

    local mode = modes[sectionGeneral:get("mode")]
    local damageMult = mode(attack.attacker)
    if I.AI.getActivePackage().type == "Combat" then
        damageMult = damageMult * sectionGeneral:get("fightingMult")
    end

    local baseHpDamage = attack.damage.health
    attack.damage.health = baseHpDamage * damageMult
    attack.attacker:sendEvent("onBackstab", damageMult)

    if sectionGeneral:get("debugMode") then
        print(
            "Backstabs debug message!\n" ..
            "Victim:            " .. self.recordId .. "\n" ..
            "View angle diff:   " .. tostring(diff / math.pi * 360) .. " degrees\n" ..
            "Base damage:       " .. tostring(baseHpDamage) .. "\n" ..
            "Damage modifier:   x" .. tostring(damageMult) .. "\n" ..
            "Final damage:      " .. tostring(attack.damage.health))
    end
end)

return {}
