# Die zwei Punkte-Ziele werden entfernt.
scoreboard objectives remove PZZufG.p2Pos
scoreboard objectives remove PZZufG.p2Wert

# Der Datenspeicher wird geleert.
data remove storage zufallsgenerator:vp2daten "EigZufG.p2Felder"

# Das Etikett zur Auswahl des Stockes wird entfernt.
tag @a[tag=EtiZufG.p2Auswahl] remove EtiZufG.p2Auswahl

# Der Stock wird aus dem Inventar entfernt.
clear @a minecraft:stick[minecraft:custom_data~{EigZufG.p2Alle:true}]

# Falls der Stock auf den Boden geworfen wurde, erhält er ein Etikett und alle Objekte mit diesem werden gelöscht.
execute as @e[type=minecraft:item] if items entity @s contents *[minecraft:custom_data~{EigZufG.p2Alle:true}] run kill @s
kill @e[tag=EtiZufG.p2Alle]
