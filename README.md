# Backstabs (OpenMW)

Adds simple backstabbing.

If the NPC doesn't see you, they don't expect you to act. That's the idea.

## Features

### Backstabs

You deal more damage when your target doesn't expect the strike! The conditions are:

- You must be outside the victim's FOV (or have 100% chameleon or be invisible).
- The higher your Sneak level, the more damage you deal.
- If the victim is in combat, the damage multiplier is reduced.
- **Sneaking status itself does nothing.**

The same rules apply to you as the player - so watch your back!

### Different Flavors

There are multiple damage formula presets to choose from:

- **Linear** -> `FlatMultiplier + AttackerSneak * SneakMultiplier`
- **Threshold** -> `FlatMultiplier + (AttackerSneak // step) * SneakMultiplier` (`//` = integer division)
- **Instakill** -> `math.huge`

### Mid-combat Backstabs

If the actor is in combat, the formula is further multiplied by an additional value. This applies to:

- NPCs currently in combat
- The player, if a weapon or spell is ready

### Lethal Backstabs

You can also make backstabs with special weapons lethal - _with a few exceptions (ikyk)_.

Special weapons include:

- Mehrunes' Razor

### Crouching Check

Some people have this as muscle memory already - myself included.

Just be aware that by "crouching" I mean "holding down Ctrl" (or whatever key you’ve assigned). The Sneaking status itself does nothing - it’s not yet available in the Lua API and is also *really* unreliable without a complete overhaul.

Also toggleable.

### Weapon Toggles

Choose which weapons will backstab and which won't. Keep in mind that this will apply to both you and NPCs.

### Make Backstabs That Suit You!

Everything in the mod is configurable - and I mean it.  
Want consistent stealth hits only for daggers? Easy.  
Want more dynamic positioning in battles? We’ve got you covered.  
Want more uses for the underutilized Sneak skill? We’ve got those too.  
Default values are just a formality.

## Requirements

OpenMW July 2025 dev build or newer (API version 87+).

## Installation

Install like any other OpenMW mod.

## Compatibility

Yes.

## Other Mods to Enhance Your Backstabbing Experience

- [Dynamic Reticle and Subtle Enemy Health Bar](https://www.nexusmods.com/morrowind/mods/56584) and [Dynamic Camera Effects and Target Lock](https://www.nexusmods.com/morrowind/mods/55327) by **MaxYari** – A complete overhaul of the camera and reticle. It’s a great mod everyone which everyone should use, but I especially want to highlight the dynamic vignette and reticle effects when the player is sneaking—great vibes.
- [Smooth First-Person Sneak](https://www.nexusmods.com/morrowind/mods/55241) by **Wolfweim** – Adds a smooth up-and-down camera transition when sneaking.
- [Sneak Step Drain](https://www.nexusmods.com/morrowind/mods/52382) by **Solthas** – Adds fatigue drain while sneaking, influenced by your armor and weapon weight.