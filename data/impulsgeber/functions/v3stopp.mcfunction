# Die Punkte-Ziele werden gelöscht und damit auch alle Variablen und andere darauf basierende Werte.
scoreboard objectives remove PZImpG.3Ausl
scoreboard objectives remove PZImpG.3Wert

# Der Stock wird aus dem Inventar entfernt.
clear @a minecraft:stick{EigImpG.3Alle:true}

# Das Auswahl-Etikett wird entfernt, falls es noch beim Ausschalten vorhanden war.
tag @a[tag=EtiImpG.3Auswahl] remove EtiImpG.3Auswahl

# Falls der Stock auf den Boden geworfen wurde, wird er ebenfalls entfernt.
kill @e[type=minecraft:item,nbt={Item:{tag:{EigImpG.3Alle:true} } }]
