# Rocket Boots

A Minecraft Java datapack that adds two craftable pairs of rocket boots. While wearing a pair, hold jump to thrust upward.

## Requirements

- Minecraft Java Edition 26.3

## Installation

1. Put the `rocketboots` folder in your world's `datapacks` folder.
2. Load the world and run `/reload`.
3. Check that it loaded with `/datapack list`.

## Boots

| Pair | Thrust capacity | Recharge | Armor / toughness | Thrust effect |
| --- | ---: | --- | ---: | --- |
| Rocket Boots | 40 ticks | 1 fuel per 10 idle ticks | 2 / 0 | Orange flames |
| Advanced Rocket Boots | 80 ticks | 2x the standard recharge rate | 3 / 2.5 | Blue flames |

Rocket Boots match iron boots' armor. Advanced Rocket Boots have diamond-level armor and toughness between diamond and netherite boots.

Thrust activates while the wearer is pressing the jump button. Fuel is tracked per player for each tier and recharges whenever the player is not thrusting, even if the boots are not currently worn. The action bar shows remaining fuel while it is below full and changes color as fuel runs low.

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

Unlock the recipe by picking up a diamond, blaze powder, or netherite ingot.

```text
N N
D D
F F
```

- `N`: Netherite ingot
- `D`: Diamond
- `F`: Blaze powder

## Give Functions

Run these commands as a player:

```mcfunction
/function rocket_boots:give
/function rocket_boots:give_advanced
```

## Configuration Functions

- `/function rocket_boots:refill` restores both boot tiers for the executing player. Run as a player.
- `/function rocket_boots:refill_all` restores both boot tiers for all online players.
- `/function rocket_boots:config/fuel_on` enables fuel consumption.
- `/function rocket_boots:config/fuel_off` disables fuel consumption, allowing unlimited thrust while preserving stored fuel.

Fuel consumption is enabled by default. Its setting persists across `/reload`.

These functions control whether thrust consumes fuel. When depletion is disabled, fuel is preserved and thrust remains available even when the HUD would otherwise be empty.
