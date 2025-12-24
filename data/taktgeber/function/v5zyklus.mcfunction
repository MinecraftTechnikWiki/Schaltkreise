# Wenn der Spieler auf wahr geklickt hat und somit den Wert eins besitzt, wird der Markierer mit den Namen wahr ausgestattet und die Zeitplan-Funktion wird aufgerufen für in 20 Ticks.
execute if entity @p[distance=..15,scores={PZTaktG.5Wert=1}] run data merge entity @n[type=minecraft:marker,tag=EtiTaktG.5Bool] {CustomName:{bold:true,color:"green",text:"wahr"} }
execute if entity @p[distance=..15,scores={PZTaktG.5Wert=1}] run schedule function taktgeber:v5takt 20t replace

# Wenn der Spieler auf falsch geklickt hat und somit den Wert zwei besitzt, wird der Name des Markierers auf falsch gesetzt und die Takt-Variable auf null. Ebenfalls wird eine Zeitplan-Funktion die noch läuft beendet.
execute if entity @p[distance=..15,scores={PZTaktG.5Wert=2}] run data merge entity @n[type=minecraft:marker,tag=EtiTaktG.5Bool] {CustomName:{bold:true,color:"red",text:"falsch"} }
execute if entity @p[distance=..15,scores={PZTaktG.5Wert=2}] run scoreboard players set VarTaktG.5Takt PZTaktG.5Wert 0
execute if entity @p[distance=..15,scores={PZTaktG.5Wert=2}] run schedule clear taktgeber:v5takt

# Wenn der Markierer existiert und Spieler im Umkreis von 15 Blöcken eine Schaltfläche angeklickt haben, wird ihnen im Chat das Menü angezeigt.
execute if entity @n[type=minecraft:marker,tag=EtiTaktG.5Bool] as @a[distance=..15] unless entity @s[scores={PZTaktG.5Wert=0}] run tellraw @s ["Taktgeber.5:\n",{text:"bool = ",bold:true},{text:"wahr",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für Wert wahr"} },click_event:{action:"run_command",command:"/trigger PZTaktG.5Wert set 1"} },"\n",{text:"bool = ",bold:true},{text:"falsch",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für Wert falsch"} },click_event:{action:"run_command",command:"/trigger PZTaktG.5Wert set 2"} },"\n",{text:"bool == ",bold:true},{entity:"@n[type=minecraft:marker,tag=EtiTaktG.5Bool]",nbt:"CustomName",interpret:true},"\n",{text:"solange(bool) takt(20)",color:"gray",bold:true} ]

# Den Spielern wird die Berechtigung erneut gegeben und der Wert wird auf null gesetzt.
execute as @a[distance=..15] unless entity @s[scores={PZTaktG.5Wert=0}] run scoreboard players enable @s PZTaktG.5Wert
execute as @a[distance=..15] unless entity @s[scores={PZTaktG.5Wert=0}] run scoreboard players set @s PZTaktG.5Wert 0
