# Die Takt-Variable wird um eins erhöht und anschließend wird den Spielern im Umkreis von 15 Blöcken um den Markierer eine Titel-Nachricht ausgegeben.
scoreboard players add VarTaktG.6Tick PZTaktG.6Wert 1
execute at @n[type=minecraft:marker,tag=EtiTaktG.6Bool,name="wahr"] run title @a[distance=..15] actionbar ["",{score:{name:"VarTaktG.6Tick",objective:"PZTaktG.6Wert"},color:"dark_purple",bold:true},{text:" Takte",color:"gray",bold:true}]

# Nur wenn der Markierer den Namen wahr besitzt, wird die Funktion in 20 Ticks erneut aufgerufen.
execute if entity @n[type=minecraft:marker,tag=EtiTaktG.6Bool,name="wahr"] run schedule function taktgeber:v6takt 20t append
