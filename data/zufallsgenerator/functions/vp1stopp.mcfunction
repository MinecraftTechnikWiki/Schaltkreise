# Die zwei Punkte-Ziele werden entfernt.
scoreboard objectives remove PZZufG.p1Pos
scoreboard objectives remove PZZufG.p1Wert

# Der NBT-Speicher wird geleert.
data remove storage zufallsgenerator:vp1daten "EigZufG.p1Felder"

# Das Etikett zur Auswahl des Stockes wird entfernt.
tag @a[tag=EtiZufG.p1Auswahl] remove EtiZufG.p1Auswahl

# Der Stock wird aus dem Inventar entfernt.
clear @a minecraft:stick{EigZufG.p1Alle:true}

# Falls der Stock auf den Boden geworfen wurde, wird ebenfalls entfernt.
kill @e[type=minecraft:item,nbt={Item:{tag:{EigZufG.p1Alle:true} } }]
