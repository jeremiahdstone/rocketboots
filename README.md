# Rocket Boots

A Minecraft Java datapack that adds two craftable pairs of rocket boots. While wearing a pair, jump while airborne to thrust upward.

## Requirements

- Minecraft Java Edition 26.3

## Installation

1. Put the `rocketboots` folder in your world's `datapacks` folder.
2. Load the world and run `/reload`.
3. Check that it loaded with `/datapack list`.

## Boots

| Pair | Thrust capacity | Recharge | Thrust effect |
| --- | ---: | --- | --- |
| Rocket Boots | 40 ticks | 1 fuel per 10 idle ticks | Orange flames |
| Advanced Rocket Boots | 80 ticks | 2x the standard recharge rate | Blue flames |

Thrust activates while the wearer is airborne and holding the jump input. Fuel is tracked per player for each tier and recharges whenever the player is not thrusting, even if the boots are not currently worn. The action bar shows remaining fuel while it is below full and changes color as fuel runs low.

## Recipes

### Rocket Boots

Unlock the recipe by picking up either redstone or blaze powder.

```text
I I
R R
F F
```

- `I`: Iron ingot
- `R`: Redstone
- `F`: Blaze powder

### Advanced Rocket Boots

Unlock the recipe by picking up a diamond.

```text
N N
D D
F F
```

- `N`: Netherite ingot
- `D`: Diamond
- `F`: Blaze powder

## Give functions

Run these commands as a player:

```mcfunction
/function rocket_boots:give
/function rocket_boots:give_advanced
```
