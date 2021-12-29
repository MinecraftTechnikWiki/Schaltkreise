# Wenn der Spieler auf die Min-Schaltfläche geklickt hat, wird sie je nach was von ihr angeklickt wurde um eins erhöht oder verringert. Dabei kann sie nur maximal den gleichen Wert annehmen wie die Max-Variable, aber nicht höher.
execute if entity @p[distance=..15,scores={PZZufG.4Wert=1}] if score VarZufG.4Min PZZufG.4Wert < VarZufG.4Max PZZufG.4Wert run scoreboard players add VarZufG.4Min PZZufG.4Wert 1
execute if entity @p[distance=..15,scores={PZZufG.4Wert=-1}] if score VarZufG.4Min PZZufG.4Wert matches 1.. run scoreboard players remove VarZufG.4Min PZZufG.4Wert 1

# Hat man auf die Max-Variable geklickt, wird sie je nach dem wo man angeklickt hat um eins erhöht oder verringert. Dabei gilt auch hier, sie kann nur minimal so klein sein wie die Min-Variable aber nicht kleiner.
execute if entity @p[distance=..15,scores={PZZufG.4Wert=2}] run scoreboard players add VarZufG.4Max PZZufG.4Wert 1
execute if entity @p[distance=..15,scores={PZZufG.4Wert=-2}] if score VarZufG.4Max PZZufG.4Wert > VarZufG.4Min PZZufG.4Wert run scoreboard players remove VarZufG.4Max PZZufG.4Wert 1

# Der Bereich in dem die Zufallszahl liegen kann wird errechnet, in dem man von dem maximalen Wert den minimalen abzieht.
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] run scoreboard players operation VarZufG.4Bereich PZZufG.4Wert = VarZufG.4Max PZZufG.4Wert
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] run scoreboard players operation VarZufG.4Bereich PZZufG.4Wert -= VarZufG.4Min PZZufG.4Wert

# Für die Zufallszahl wird eine Partikelwolke erzeugt, von der man die erste Zahl von vieren aus der UUID kopiert und in eine Variable speichert.
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Tags:["EtiZufG.4Alle"]}
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] store result score VarZufG.4Zufallswert PZZufG.4Wert run data get entity @e[type=minecraft:area_effect_cloud,tag=EtiZufG.4Alle,sort=nearest,limit=1] UUID[0] 1

# Damit die Zufallszahl in dem eingestellten Wertebereich liegt, wird zuerst die Zufallszahl modulo der Bereichs-Variable gerechnet und anschließend wird die Min-Variable datrauf addiert. Falls die Min- und Max-Variable gleich sind, wird der Zufallswert auf den Wert der Min-Variable gesetzt.
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] run scoreboard players operation VarZufG.4Zufallswert PZZufG.4Wert %= VarZufG.4Bereich PZZufG.4Wert
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] run scoreboard players operation VarZufG.4Zufallswert PZZufG.4Wert += VarZufG.4Min PZZufG.4Wert
execute if entity @p[distance=..15,scores={PZZufG.4Wert=3}] if score VarZufG.4Min PZZufG.4Wert = VarZufG.4Max PZZufG.4Wert run scoreboard players operation VarZufG.4Zufallswert PZZufG.4Wert = VarZufG.4Min PZZufG.4Wert

# Alle Spieler im Umkreis von 15 Blöcken erhalten eine Chat-Nachricht, falls noch nie eine Schaltfläche angeklickt haben oder genau in diesem Moment eine angeklickt haben. In dieser kann man die Min- und Max-Variable erhöhen und verringern und damit eine Zufallszahl erzeugen lassen.
execute if score VarZufG.4Bereich PZZufG.4Wert matches 0.. as @a[distance=..15] unless entity @s[scores={PZZufG.4Wert=0}] run tellraw @s ["Zufallsgenerator.4:\n",{"text":"min (","bold":true},{"text":"=min + 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Minimum + 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.4Wert set 1"} },{"text":",","bold":true},{"text":"=min - 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Minimum - 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.4Wert set -1"} },{"text":") == ","bold":true},{"score":{"name":"VarZufG.4Min","objective":"PZZufG.4Wert"},"color":"dark_purple","bold":true},"\n",{"text":"max (","bold":true},{"text":"=max + 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Maximum + 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.4Wert set 2"} },{"text":",","bold":true},{"text":"=max - 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Maximum - 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.4Wert set -2"} },{"text":") == ","bold":true},{"score":{"name":"VarZufG.4Max","objective":"PZZufG.4Wert"},"color":"dark_purple","bold":true},"\n",{"text":"var = ","bold":true},{"text":"zufallswert(min,max-1)","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für einen Zufallswert"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.4Wert set 3"} },"\n",{"text":"var == ","bold":true},{"score":{"name":"VarZufG.4Zufallswert","objective":"PZZufG.4Wert"},"color":"dark_purple","bold":true} ]

# Hat man die Schaltflächen angeklickt oder hat noch nie eine angeklickt erhält man die Berechtigung erneut die Schaltflächen anzuklicken und man bekommt den Wert null zugewiesen.
execute as @a[distance=..15] unless entity @s[scores={PZZufG.4Wert=0}] run scoreboard players enable @s PZZufG.4Wert
execute as @a[distance=..15] unless entity @s[scores={PZZufG.4Wert=0}] run scoreboard players set @s PZZufG.4Wert 0
