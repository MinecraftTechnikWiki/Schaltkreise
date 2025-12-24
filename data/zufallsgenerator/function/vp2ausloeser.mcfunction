# Hat man auf die Schaltfläche für das Verlängern der Felderreihe geklickt oder für eine Zufallsposition, so wird ein Zufallswert generiert wird.
execute at @s[scores={PZZufG.p2Wert=1..2}] store result score VarZufG.p2Zufallswert PZZufG.p2Wert run random value 0..2147483646 zufallsgenerator:vp2zufall

# Wenn man auf die Länge geklickt hat, wird die Felderreihe verlängert oder gekürzt.
execute if entity @s[scores={PZZufG.p2Wert=1}] run data modify storage zufallsgenerator:vp2daten "EigZufG.p2Felder" append value 0
execute if entity @s[scores={PZZufG.p2Wert=-1}] run data remove storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[-1]

# Die Anzahl der Felder wird ausgelesen und in eine Variable gespeichert.
execute store result score VarZufG.p2Laenge PZZufG.p2Wert run data get storage zufallsgenerator:vp2daten "EigZufG.p2Felder"

# Hat man auf die Kopie-Schaltfläche geklickt, wird der Namen des Markierers entsprechend auf den Wahrheitswert gesetzt. Dadurch wird das letzte Feld kopiert und erneut hinzugefügt, wenn man auf Verlängern geklickt hat. Wenn man auf verkürzen geklickt hat, wird ebenfalls der Markierer auf falsch gesetzt.
execute if entity @s[scores={PZZufG.p2Wert=3}] if score VarZufG.p2Laenge PZZufG.p2Wert matches 1.. run data merge entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool] {CustomName:{text:"wahr",color:"green",bold:true} }
execute if entity @s[scores={PZZufG.p2Wert=-3..-1}] run data merge entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool] {CustomName:{text:"falsch",color:"red",bold:true} }

# Wenn die Felderreihe verlängert, wird der Zufallswert in einen Bereich von null bis neun zurecht gestutzt und anschließend wird das Vielfache von Zehn abhängig der aktuellen Größe der Felderreihe aufsummiert. Dies erfolgt jedoch nur, wenn der Markierer den Wert auf falsch gesetzt hat, ansonsten wird der Vorgang abgebrochen, da dann der Wert vom letzten Feld verwendet wird.
execute if entity @s[scores={PZZufG.p2Wert=1}] if entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool,name="falsch"] run scoreboard players operation VarZufG.p2Zufallswert PZZufG.p2Wert %= KonstZufG.p2ZEHN PZZufG.p2Wert
execute if entity @s[scores={PZZufG.p2Wert=1}] if entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool,name="falsch"] run scoreboard players operation VarZufG.p2Min PZZufG.p2Wert = KonstZufG.p2ZEHN PZZufG.p2Wert
execute if entity @s[scores={PZZufG.p2Wert=1}] if entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool,name="falsch"] run scoreboard players operation VarZufG.p2Min PZZufG.p2Wert *= VarZufG.p2Laenge PZZufG.p2Wert
execute if entity @s[scores={PZZufG.p2Wert=1}] if entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool,name="falsch"] store result storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[-1] int 1 run scoreboard players operation VarZufG.p2Zufallswert PZZufG.p2Wert += VarZufG.p2Min PZZufG.p2Wert

# Wenn der Wahrheitswert der Kopie-Schaltfläche auf wahr gesetzt ist, wird der Wert des vorletzen Feldes ausgelesen und in das letzte Feld gespeichert.
execute if entity @s[scores={PZZufG.p2Wert=1}] if entity @n[type=minecraft:marker,tag=EtiZufG.p2Bool,name="wahr"] store result storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[-1] int 1 run data get storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[-2]

# Wenn man eine Zufallsposition erhalten möchte, wird der Zufallswert modulo der Felderlänge gerechnet und anschlie0end in den Positions-Wert des Spielers gespeichert.
execute if score VarZufG.p2Laenge PZZufG.p2Wert matches 1.. store result score @s[scores={PZZufG.p2Wert=2}] PZZufG.p2Pos run scoreboard players operation VarZufG.p2Zufallswert PZZufG.p2Wert %= VarZufG.p2Laenge PZZufG.p2Wert

# Wenn man die Länge der Felderreihe verkleinern möchte, wird geprüft ob die aktuelle Position nicht auf dem gelöschten Feld lag, falls doch, wird die Position auf das erste Feld gesetzt.
execute if score @s[scores={PZZufG.p2Wert=-1}] PZZufG.p2Pos >= VarZufG.p2Laenge PZZufG.p2Wert run scoreboard players set @s PZZufG.p2Pos 0

# Für den Aufruf der Felder-Funktion wird die Variable für die aktuelle Position auf null gesetzt.
scoreboard players set VarZufG.p2AktuellePosition PZZufG.p2Pos 0
function zufallsgenerator:vp2felder

# Der Spieler mit dem Stock erhält eine Chat-Nachricht, mit allen Optionen für die Felderreihe mit Zufallswerten.
tellraw @s ["Zufallsgenerator.erweitert.2:\n",{text:"Felder == [",bold:true},{storage:"zufallsgenerator:vp2daten",nbt:'"EigZufG.p2Felder"[]',color:"dark_purple",bold:true},{text:"]",bold:true},"\n",{text:"Felder.laenge (",bold:true},{text:"=laenge + 1",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für Länge + 1"} },click_event:{action:"run_command",command:"/trigger PZZufG.p2Wert set 1"} },{text:",",bold:true},{text:"=laenge - 1",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für Länge - 1"} },click_event:{action:"run_command",command:"/trigger PZZufG.p2Wert set -1"} },{text:") == ",bold:true},{score:{name:"VarZufG.p2Laenge",objective:"PZZufG.p2Wert"},color:"gold",bold:true},"\n",{text:"Felder.kopie (",bold:true},{text:"=wahr",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für wahr"} },click_event:{action:"run_command",command:"/trigger PZZufG.p2Wert set 3"} },{text:",",bold:true},{text:"=falsch",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für falsch"} },click_event:{action:"run_command",command:"/trigger PZZufG.p2Wert set -3"} },{text:") == ",bold:true},{entity:"@n[type=minecraft:marker,tag=EtiZufG.p2Bool]",nbt:"CustomName",interpret:true},"\n",{text:"Felder.position = ",bold:true},{text:"zufallswert(0,laenge-1)",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für eine zufällige Position"} },click_event:{action:"run_command",command:"/trigger PZZufG.p2Wert set 2"} },"\n",{text:"Felder.position == ",bold:true},{score:{name:"@s",objective:"PZZufG.p2Pos"},color:"green",bold:true},"\n",{text:"Felder[",bold:true},{score:{name:"@s",objective:"PZZufG.p2Pos"},color:"green",bold:true},{text:"] == ",bold:true},{score:{name:"VarZufG.p2Wert",objective:"PZZufG.p2Pos"},color:"dark_purple",bold:true}]

# Der Spieler erhält die Berechtigung den Auslöser erneut auszuführen und sein Wert wird auf null gesetzt.
scoreboard players enable @s PZZufG.p2Wert
scoreboard players set @s PZZufG.p2Wert 0
