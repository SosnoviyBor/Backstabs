local I = require('openmw.interfaces')

I.Settings.registerGroup {
    key = 'SettingsBackstabs_general',
    page = 'Backstabs',
    l10n = 'Backstabs',
    name = 'general_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'modEnabled',
            name = 'modEnabled_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'mode',
            name = 'mode_name',
            description = 'mode_description',
            renderer = 'select',
            argument = {
                l10n = "Backstabs",
                items = {
                    "Mixed",
                    "Skill-only",
                    "Flat-only",
                    "Instakill"
                },
            },
            default = "Mixed"
        },
        {
            key = 'flatMult',
            name = 'flatMult_name',
            renderer = 'number',
            integer = false,
            default = 5,
        },
        {
            key = 'sneakMult',
            name = 'sneakMult_name',
            renderer = 'number',
            integer = false,
            default = 0.1,
        },
        {
            key = 'npcFov',
            name = 'npcFov_name',
            renderer = 'number',
            integer = false,
            default = 220,
            min = 0,
            max = 360
        },
        {
            key = 'fightingMult',
            name = 'fightingMult_name',
            description = 'fightingMult_description',
            renderer = 'number',
            integer = false,
            default = 0.25,
            min = 0.01
        },
        {
            key = 'debugMode',
            name = 'debugMode_name',
            description = 'debugMode_description',
            renderer = 'checkbox',
            default = false,
        },
    }
}