# Die zwei Punkte-Ziele werden entfernt.
scoreboard objectives remove PZZufG.p2Pos
scoreboard objectives remove PZZufG.p2Wert

# Der NBT-Speicher wird geleert.
data remove storage zufallsgenerator:vp2daten "EigZufG.p2Felder"

# Das Etikett zur Auswahl des Stockes wird entfernt.
tag @a[tag=EtiZufG.p2Auswahl] remove EtiZufG.p2Auswahl

# Der Stock wird aus dem Inventar entfernt.
clear @a minecraft:stick{EigZufG.p2Alle:true}

# Falls der Stock auf den Boden geworfen wurde, erhält er ein Etikett und alle Objekte mit diesem werden gelöscht.
tag @e[type=minecraft:item,nbt={Item:{tag:{EigZufG.p2Alle:true} } }] add EtiZufG.p2Alle
kill @e[tag=EtiZufG.p2Alle]
