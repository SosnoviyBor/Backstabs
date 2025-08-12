# Backstabs (OpenMW)

Adds simple backstabbing.

If the NPC doesn't see you, they don't expect you to act. That's the idea.

## Features

You deal more damage when they don't expect you to strike! The conditions are:
- You need to be out of victim's FOV
- The higher your sneak level, the more damage you deal
- If victim's in combat, damage multiplier is lowered
- **Sneaking status and crouching don't do anything**

Same rules apply to you, the player, too. So watch your back!

```
FM -> Flat Multiplier
AS -> Attacker Sneak
SM -> Sneak Multiplier
```

There are multiple damage formula presets to choose from:
- Mixed -> FM + AS * SM
- Gradual -> AS // step * SM (// is integer division)
- Skill-based -> AS * SM
- Flat -> FM
- Instakill -> self-explenatory

If the actor is in combat, the formula is multiplied by an additional value. This applies to:
- NPCs who currently hin combat with anyone
- Player who have weapon or spell ready

You can also make backstabs with Mehrunes' Razor lethal. With a few exceptions (ikyk).

And every value is configurable to your liking.

## Requirements
OpenMW July 2025 dev build or newer (API version 87 or newer).

## Installation
Installs like any other OpenMW mod. Not sure about pre-0.49 OpenMW support, but you should use newest builds anyway.

## Compatibility
Yes.