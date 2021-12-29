# Das Punkte-Ziel wird gelöscht.
scoreboard objectives remove PZTaktG.6Wert

# Der Markierer wird entfernt.
kill @e[type=minecraft:marker,tag=EtiTaktG.6Alle]

# Falls eine Funktion laut Zeitplan noch laufen würde, wird dies gestoppt.
schedule clear taktgeber:v6takt
