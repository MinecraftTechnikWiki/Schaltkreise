# Die beiden Punkte-Ziele und damit auch alle Variablen, werden gelöscht.
scoreboard objectives remove PZImpG.4Ausl
scoreboard objectives remove PZImpG.4Wert

# In sämtlichen Inventaren der Spieler wird nach dem Stock gesucht und dieser wird gelöscht.
clear @a minecraft:stick[minecraft:custom_data~{EigImpG.4Alle:true}]

# Das Etikett für die Auswahl des Stockes wird entfernt, falls er beim Ausschalten ausgewählt wurde.
tag @a[tag=EtiImpG.4Auswahl] remove EtiImpG.4Auswahl

# Falls man den Stock gedroppt hat, wird er ebenfalls gelöscht.
execute as @e[type=minecraft:item] if items entity @s contents *[minecraft:custom_data~{EigImpG.4Alle:true}] run kill @s
