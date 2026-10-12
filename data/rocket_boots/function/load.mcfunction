scoreboard objectives add rocket_active dummy
scoreboard objectives add rocket_pitch dummy
scoreboard objectives add rocket_thrust dummy
scoreboard objectives add rocket_regen_clock dummy
scoreboard objectives add rocket_thrust_advanced dummy
scoreboard objectives add rocket_regen_advanced dummy
scoreboard objectives add rocket_fuel_display dummy
scoreboard objectives add rocket_fuel_ui dummy
scoreboard objectives add rocket_fuel_mode dummy
scoreboard objectives add rocket_jump_held dummy
scoreboard objectives add rocket_boost_armed dummy
scoreboard objectives add rocket_gravity_active dummy
scoreboard players set #max rocket_fuel_display 40
execute unless score #fuel_enabled rocket_fuel_mode matches 0..1 run scoreboard players set #fuel_enabled rocket_fuel_mode 1