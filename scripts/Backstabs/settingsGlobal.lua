local I = require('openmw.interfaces')

I.Settings.registerGroup {
    key = 'SettingsBackstabs_toggles',
    page = 'Backstabs',
    l10n = 'Backstabs',
    name = 'toggles_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'modEnabled',
            name = 'modEnabled_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'enableMeleeWeapons',
            name = 'enableMeleeWeapons_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'enableRangedWeapons',
            name = 'enableRangedWeapons_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'enableH2h',
            name = 'enableH2h_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'playerCanBeBackstabbed',
            name = 'playerCanBeBackstabbed_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'enableSpecialWeaponInstakill',
            name = 'enableSpecialWeaponInstakill_name',
            description = 'enableSpecialWeaponInstakill_description',
            renderer = 'checkbox',
            default = false,
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

I.Settings.registerGroup {
    key = 'SettingsBackstabs_values',
    page = 'Backstabs',
    l10n = 'Backstabs',
    name = 'values_group_name',
    description = "values_group_description",
    permanentStorage = true,
    settings = {
        {
            key = 'mode',
            name = 'mode_name',
            description = 'mode_description',
            renderer = 'select',
            argument = {
                l10n = "Backstabs",
                items = {
                    "Mixed",
                    "Gradual",
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
            default = 1.5,
        },
        {
            key = 'sneakMult',
            name = 'sneakMult_name',
            renderer = 'number',
            integer = false,
            default = 0.05,
        },
        {
            key = 'gradualStep',
            name = 'gradualStep_name',
            renderer = 'number',
            integer = true,
            default = 25,
            min = 1
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
    }
}