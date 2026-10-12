# Mark this player as actively thrusting
scoreboard players set @s rocket_active 1
execute if score #fuel_enabled rocket_fuel_mode matches 1 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players add @s rocket_thrust_advanced 1
execute if score #fuel_enabled rocket_fuel_mode matches 1 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players add @s rocket_thrust 1

# Apply upward propulsion
execute unless predicate rocket_boots:is_underwater if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run effect give @s minecraft:levitation 1 12 true
execute unless predicate rocket_boots:is_underwater unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run effect give @s minecraft:levitation 1 10 true
execute if predicate rocket_boots:is_underwater if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run attribute @s minecraft:gravity modifier add rocket_boots:underwater_thrust -0.6 add_value
execute if predicate rocket_boots:is_underwater unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run attribute @s minecraft:gravity modifier add rocket_boots:underwater_thrust -0.5 add_value
execute if predicate rocket_boots:is_underwater run scoreboard players set @s rocket_gravity_active 1

# Use soul-fire flames for Tier II boots
execute at @s unless predicate rocket_boots:is_underwater if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run particle minecraft:soul_fire_flame ~ ~0.1 ~ 0.2 0.05 0.2 0.02 8 normal
execute at @s unless predicate rocket_boots:is_underwater unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run particle minecraft:flame ~ ~0.1 ~ 0.2 0.05 0.2 0.02 8 normal

# Smoke particles at this player's feet
execute at @s unless predicate rocket_boots:is_underwater run particle minecraft:smoke ~ ~0.1 ~ 0.15 0.05 0.15 0.01 3 normal
execute at @s if predicate rocket_boots:is_underwater run particle minecraft:bubble ~ ~0.1 ~ 0.2 0.05 0.2 0.02 6 normal

execute store result score @s rocket_pitch run random value 3..7
execute at @s if predicate rocket_boots:is_underwater if score @s rocket_pitch matches 3 run playsound minecraft:block.bubble_column.upwards_ambient master @a ~ ~ ~ 0.3 1
execute if score @s rocket_pitch matches 3 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.3
execute if score @s rocket_pitch matches 4 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.4
execute if score @s rocket_pitch matches 5 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.5
execute if score @s rocket_pitch matches 6 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.6
execute if score @s rocket_pitch matches 7 unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.7
execute if score @s rocket_pitch matches 3 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.6
execute if score @s rocket_pitch matches 4 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.7
execute if score @s rocket_pitch matches 5 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.8
execute if score @s rocket_pitch matches 6 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 0.9
execute if score @s rocket_pitch matches 7 if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] at @s run playsound minecraft:entity.wind_charge.wind_burst master @a ~ ~ ~ 0.25 1
