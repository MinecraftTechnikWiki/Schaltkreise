# Wenn der Spieler auf wahr geklickt hat, wird der Name des Markierers auf wahr gesetzt und die Takt-Funktion wird dreimal in einem Abstand von einen Tick als Zeitplan-Funktion aufgerufen.
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=1}] run data merge entity @e[type=minecraft:marker,tag=EtiTaktG.6Bool,sort=nearest,limit=1] {CustomName:'{"bold":true,"color":"green","text":"wahr"}'}
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=1}] run schedule function taktgeber:v6takt 20t replace
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=1}] run schedule function taktgeber:v6takt 21t append
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=1}] run schedule function taktgeber:v6takt 22t append

# Wenn der Spieler auf falsch geklickt hat, bekommt der Markierer diesen Namen und die Takt-Variable wird auf null gesetzt. Ebenfalls werden alle Zeitplan-Funktionen gestoppt.
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=2}] run data merge entity @e[type=minecraft:marker,tag=EtiTaktG.6Bool,sort=nearest,limit=1] {CustomName:'{"bold":true,"color":"red","text":"falsch"}'}
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=2}] run scoreboard players set VarTaktG.6Takt PZTaktG.6Wert 0
execute if entity @p[distance=..15,scores={PZTaktG.6Wert=2}] run schedule clear taktgeber:v6takt

# Wenn der Markierer existiert und Spieler im Umkreis von 15 Blöcken eine Schaltfläche angeklickt haben, wird ihnen im Chat das Menü angezeigt.
execute if entity @e[type=minecraft:marker,tag=EtiTaktG.6Bool,sort=nearest,limit=1] as @a[distance=..25] unless entity @s[scores={PZTaktG.6Wert=0}] run tellraw @s ["Taktgeber.6:\n",{"text":"bool = ","bold":true},{"text":"wahr","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Wert wahr"} },"clickEvent":{"action":"run_command","value":"/trigger PZTaktG.6Wert set 1"} },"\n",{"text":"bool = ","bold":true},{"text":"falsch","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Wert falsch"} },"clickEvent":{"action":"run_command","value":"/trigger PZTaktG.6Wert set 2"} },"\n",{"text":"bool == ","bold":true},{"entity":"@e[type=minecraft:marker,tag=EtiTaktG.6Bool,sort=nearest,limit=1]","nbt":"CustomName","interpret":true},"\n",{"text":"solange(bool) takt(20,3)","color":"gray","bold":true} ]

# Den Spielern wird die Berechtigung erneut gegeben und der Wert wird auf null gesetzt.
execute as @a[distance=..15] unless entity @s[scores={PZTaktG.6Wert=0}] run scoreboard players enable @s PZTaktG.6Wert
execute as @a[distance=..15] unless entity @s[scores={PZTaktG.6Wert=0}] run scoreboard players set @s PZTaktG.6Wert 0
