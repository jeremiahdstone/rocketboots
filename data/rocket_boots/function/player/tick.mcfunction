# Stop propulsion if this player was thrusting on the previous tick
execute if score @s rocket_active matches 1 run effect clear @s minecraft:levitation

# Initialize this player's fuel counters
execute unless score @s rocket_thrust matches 0..40 run scoreboard players set @s rocket_thrust 0
execute unless score @s rocket_regen_clock matches 0..19 run scoreboard players set @s rocket_regen_clock 0
execute unless score @s rocket_thrust_advanced matches 0..80 run scoreboard players set @s rocket_thrust_advanced 0
execute unless score @s rocket_regen_advanced matches 0..19 run scoreboard players set @s rocket_regen_advanced 0

# Reset this player's activation state
scoreboard players set @s rocket_active 0

# Activate Tier II boots while jumping, up to 80 thrust ticks
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if predicate rocket_boots:is_jumping if score @s rocket_thrust_advanced matches ..79 run function rocket_boots:player/thrust

# Activate standard boots while jumping, up to 40 thrust ticks
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if predicate rocket_boots:is_jumping if score @s rocket_thrust matches ..39 run function rocket_boots:player/thrust

# Standard fuel regenerates at 1 unit per 10 idle ticks
execute if score @s rocket_active matches 0 if score @s rocket_thrust matches 1..40 run scoreboard players add @s rocket_regen_clock 1
execute if score @s rocket_active matches 0 if score @s rocket_thrust matches 1..40 if score @s rocket_regen_clock matches 10.. run function rocket_boots:player/recharge

# Tier II fuel regenerates at 2 times the standard rate
execute if score @s rocket_active matches 0 if score @s rocket_thrust_advanced matches 1..80 run scoreboard players add @s rocket_regen_advanced 4
execute if score @s rocket_active matches 0 if score @s rocket_thrust_advanced matches 1..80 if score @s rocket_regen_advanced matches 20.. run function rocket_boots:player/recharge_advanced

# Reset recharge progress after thrusting and when that tier is full
execute if score @s rocket_active matches 1 run scoreboard players set @s rocket_regen_clock 0
execute if score @s rocket_active matches 1 run scoreboard players set @s rocket_regen_advanced 0
execute if score @s rocket_thrust matches 0 run scoreboard players set @s rocket_regen_clock 0
execute if score @s rocket_thrust_advanced matches 0 run scoreboard players set @s rocket_regen_advanced 0

# Display Tier II fuel
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players set @s rocket_fuel_display 80
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players operation @s rocket_fuel_display -= @s rocket_thrust_advanced
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 80 run title @s actionbar ""
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 61..79 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"green"},{"text":" / 80","color":"green"}]
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 21..60 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"yellow"},{"text":" / 80","color":"yellow"}]
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches ..20 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"red"},{"text":" / 80","color":"red"}]

# Display standard fuel
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players set @s rocket_fuel_display 40
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] run scoreboard players operation @s rocket_fuel_display -= @s rocket_thrust
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 40 run title @s actionbar ""
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 21..39 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"green"},{"text":" / 40","color":"green"}]
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches 11..20 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"yellow"},{"text":" / 40","color":"yellow"}]
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] unless items entity @s armor.feet minecraft:leather_boots[minecraft:item_name={text:"Advanced Rocket Boots",color:"aqua",italic:false}] if score @s rocket_fuel_display matches ..10 run title @s actionbar [{"score":{"name":"@s","objective":"rocket_fuel_display"},"color":"red"},{"text":" / 40","color":"red"}]

# Clear the action bar when neither tier is worn
execute if items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] run scoreboard players set @s rocket_fuel_ui 1
execute unless items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] if score @s rocket_fuel_ui matches 1 run title @s actionbar ""
execute unless items entity @s armor.feet minecraft:leather_boots[minecraft:custom_data~{rocket_boots:true}] if score @s rocket_fuel_ui matches 1 run scoreboard players set @s rocket_fuel_ui 0
