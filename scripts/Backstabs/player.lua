local storage = require("openmw.storage")
local ambient = require("openmw.ambient")
local core = require("openmw.core")
local ui = require("openmw.ui")
local I = require('openmw.interfaces')
require("scripts.Backstabs.backstabLogic")

local l10n = core.l10n("Backstabs")
local sectionOnBackstab = storage.playerSection("SettingsBackstabs_onBackstab")
local sectionToggles = storage.globalSection("SettingsBackstabs_toggles")

I.Combat.addOnHitHandler(function(attack)
    if not sectionToggles:get("playerCanBeBackstabbed") then return end
    DoBackstab(attack)
end)

local function onLoad()
    -- always check your API version
    if core.API_REVISION < 87 then ui.showMessage(l10n("messageOutdatedLuaAPI"), { showInDualogue = true }) end
end

local function onBackstab(damageMult)
    if sectionOnBackstab:get("playSFX") then ambient.playSound("critical damage") end
    if sectionOnBackstab:get("showMessage") then
        ui.showMessage(
            l10n("messageSuccessfulBackstab1") ..
            tostring(damageMult) ..
            l10n("messageSuccessfulBackstab2"))
    end
end

return {
    engineHandlers = {
        onLoad = onLoad
    },
    eventHandlers = {
        onBackstab = onBackstab
    }
}
