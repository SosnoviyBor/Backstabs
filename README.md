# Backstabs (OpenMW)

Adds simple backstabbing.

If the NPC doesn't see you, they don't expect you to act. That's the idea.

## Features

You deal more damage when they don't expect you to strike! That means:
- You're out of their FOV
- If they're fighting, damage multiplier is lowered
- Sneaking status doesn't do anything (in vanilla it's a broken feature + OpenMW doesn't expose it to the Lua API yet), but...
- You deal more damage, based on your Sneak skill

And every value is configurable to your likings.

## Requirements
- OpenMW July 2025 dev build or newer (API version 87 or newer)

## Installation
Installs like any other OpenMW mod. Not sure about pre-0.49 OpenMW support, but you should use newest builds anyway.

## Compatibility
Yes.