# Hasn't selected target
execute unless score @s suso.thio.huntress_target matches 1.. run return fail

# Can't target self
execute if score @s suso.thio.huntress_target = @s suso.thio.id run return fail

# Pick target
scoreboard players operation $curr suso.thio.huntress_target = @s suso.thio.huntress_target
execute as @a[tag=suso.thio.Participant] if score @s suso.thio.id = $curr suso.thio.huntress_target run tag @s add suso.thio.huntress_target

# Can't target player that doesn't exist
execute unless entity @a[tag=suso.thio.huntress_target] run return fail

# Kill
damage @p[tag=suso.thio.huntress_target] 2711.01 minecraft:arrow by @s

# Story time
tellraw @a [ \
    {"text":"> Huntress","color":"aqua"}, \
    {"text":" [","color":"gold"},{"score":{"objective":"suso.thio.id","name":"@s"},"color":"gold"},{"text":"] ","color":"gold"}, \
    {"selector":"@s","color":"gold"}, \
    {"text":" killed"}, \
    {"text":" [","color":"gold"},{"score":{"objective":"suso.thio.id","name":"@p[tag=suso.thio.huntress_target]"},"color":"gold"},{"text":"] ","color":"gold"}, \
    {"selector":"@p[tag=suso.thio.huntress_target]","color":"gold"}, \
    {"text":"."}, \
]

tellraw @a [ \
    {"text":"> Name:","color":"aqua"}, \
    {"text":" [","color":"gold"},{"score":{"objective":"suso.thio.id","name":"@p[tag=suso.thio.huntress_target]"},"color":"gold"},{"text":"] ","color":"gold"}, \
    {"selector":"@p[tag=suso.thio.huntress_target]","color":"gold"}, \
    {"text":"; [Sun, July 12th 2026 09:59:53]"}, \
]
tellraw @a [ \
    {"text":"  Cause of Death: Died on the street due to a heart attack.","color":"aqua"}, \
]

# Target is no more
execute as @a[tag=suso.thio.huntress_target] run function suso.thio:actor/death_logic
tag @a remove suso.thio.huntress_target
