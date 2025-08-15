# Backstabs (OpenMW)

Adds simple backstabbing.

If the NPC doesn't see you, they don't expect you to act. That's the idea.

## Features

You deal more damage when your target doesn't expect the strike! The conditions are:

- You must be outside the victim's FOV.
- You must be crouching.
- The higher your Sneak level, the more damage you deal.
- If the victim is in combat, the damage multiplier is reduced.
- **Sneaking status itself does nothing.**

The same rules apply to you as the player - so watch your back!

```
FM -> Flat Multiplier
AS -> Attacker Sneak
SM -> Sneak Multiplier
```

There are multiple damage formula presets to choose from:

- **Linear** → `FM + AS * SM`
- **Threshold** → `FM + (AS // step) * SM` (`//` = integer division)
- **Instakill** → `math.huge`

If the actor is in combat, the formula is further multiplied by an additional value. This applies to:

- NPCs currently in combat
- The player, if a weapon or spell is ready

You can also make backstabs with Mehrunes' Razor lethal - _with a few exceptions (ikyk)_.

There are toggles for all weapon types. Keep in mind they apply to both you and NPCs.

Every value is fully configurable.

## Requirements

OpenMW July 2025 dev build or newer (API version 87+).

## Installation

Install like any other OpenMW mod.

## Compatibility

Yes.
