# Das Punkte-Ziel wird erstellt.
scoreboard objectives add PZZufG.4Wert trigger ["Zufallsgenerator.4: ",{"text":"Wert der Variablen","bold":true}]

# Die Min- und Max-Variablen werden gesetzt.
scoreboard players set VarZufG.4Min PZZufG.4Wert 0
scoreboard players set VarZufG.4Max PZZufG.4Wert 10

# Der Spieler erhält den Wert drei, sodass er direkt die Zufallsfunktion auslöst.
scoreboard players set @p[distance=..15] PZZufG.4Wert 3
