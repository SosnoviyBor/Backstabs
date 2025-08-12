local storage = require("openmw.storage")
local types = require("openmw.types")
require("scripts.Backstabs.utils")

local sectionValues = storage.globalSection("SettingsBackstabs_values")
local getActorSneak = types.NPC.stats.skills.sneak

InstakillWeapons = {
    "mehrunes'_razor_unique"
}

Modes = {
    ["Mixed"] = function(attacker)
        local fm = sectionValues:get("flatMult")
        local as = TryGetActorSneak(attacker)
        local sm = sectionValues:get("sneakMult")
        return fm + as * sm
    end,
    ["Gradual"] = function(attacker)
        local as = TryGetActorSneak(attacker)
        local step = sectionValues:get("gradualStep")
        local sm = sectionValues:get("sneakMult")
        return IntDiv(as, step) * sm
    end,
    ["Skill-based"] = function(attacker)
        local as = TryGetActorSneak(attacker)
        local sm = sectionValues:get("sneakMult")
        return as * sm
    end,
    ["Flat"] = function(attacker)
        local fm = sectionValues:get("flatMult")
        return fm
    end,
    ["Instakill"] = function(attacker)
        return math.huge
    end
}