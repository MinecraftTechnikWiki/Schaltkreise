# Die Takt-Variable wird um eins erhöht und anschließend wird den Spielern im Umkreis von 15 Blöcken um den Markierer eine Titel-Nachricht ausgegeben.
scoreboard players add VarTaktG.5Takt PZTaktG.5Wert 1
execute at @e[type=minecraft:marker,tag=EtiTaktG.5Bool,name="wahr",sort=nearest,limit=1] run title @a[distance=..15] actionbar ["",{"score":{"name":"VarTaktG.5Takt","objective":"PZTaktG.5Wert"},"color":"dark_purple","bold":true},{"text":" Takte","color":"gray","bold":true}]

# Nur wenn der Markierer den Namen wahr besitzt, wird die Funktion in 20 Ticks erneut aufgerufen.
execute if entity @e[type=minecraft:marker,tag=EtiTaktG.5Bool,name="wahr",sort=nearest,limit=1] run schedule function taktgeber:v5takt 20t replace
