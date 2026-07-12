# Story time start
tellraw @a {"text":"Story Time - Day 2","bold":true,"color":"dark_red"}

# Death
tellraw @a [ \
    {"text":"> Oh my god, they killed","color":"aqua"}, \
    {"text":" [","color":"gold"},{"score":{"objective":"suso.thio.id","name":"@s"},"color":"gold"},{"text":"] ","color":"gold"}, \
    {"selector":"@s","color":"gold"}, \
    {"text":"! You bastards!"}, \
]

# Huntress
execute if entity @s[tag=suso.thio.Huntress] run function suso.thio:actor/huntress_kill

# Story time end
tellraw @a [{"text":"The day will end at","italic":true,"color":"gray"},{"text":" en 10 horas.","color":"white"}]

# Set game values
function suso.thio:actor/death_logic
