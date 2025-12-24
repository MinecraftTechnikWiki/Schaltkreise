# Die zwei Punkte-Ziele werden entfernt.
scoreboard objectives remove PZZufG.p1Pos
scoreboard objectives remove PZZufG.p1Wert

# Der Datenspeicher wird geleert.
data remove storage zufallsgenerator:vp1daten "EigZufG.p1Felder"

# Das Etikett zur Auswahl des Stockes wird entfernt.
tag @a[tag=EtiZufG.p1Auswahl] remove EtiZufG.p1Auswahl

# Der Stock wird aus dem Inventar entfernt.
clear @a minecraft:stick[minecraft:custom_data~{EigZufG.p1Alle:true}]

# Falls der Stock auf den Boden geworfen wurde, wird ebenfalls entfernt.
execute as @e[type=minecraft:item] if items entity @s contents *[minecraft:custom_data~{EigZufG.p1Alle:true}] run kill @s
