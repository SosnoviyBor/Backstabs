local storage = require("openmw.storage")
local ambient = require("openmw.ambient")
local core = require("openmw.core")
local ui = require("openmw.ui")

local l10n = core.l10n("Backstabs")
local sectionOnInstakill = storage.playerSection("SettingsBackstabs_onBackstab")

local function onLoad()
    -- always check your API version
    if core.API_REVISION < 87 then ui.showMessage(l10n("messageOutdatedLuaAPI"), { showInDualogue = true }) end
end

local function onBackstab(damageMult)
    if sectionOnInstakill:get("playSFX") then ambient.playSound("critical damage") end
    if sectionOnInstakill:get("showMessage") then
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
