# Wenn man die Felderreihe verlängert oder eine Zufallsposition haben möchte, wird ein Zufallswert generiert.
execute if entity @s[scores={PZZufG.p1Wert=1..2}] store result score VarZufG.p1Zufallswert PZZufG.p1Wert run random value 0..2147483646 zufallsgenerator:vp1zufall

# Wenn man auf die Länge geklickt hat, wird die Felderreihe verlängert oder gekürzt.
execute if entity @s[scores={PZZufG.p1Wert=1}] run data modify storage zufallsgenerator:vp1daten "EigZufG.p1Felder" append value 0
execute if entity @s[scores={PZZufG.p1Wert=-1}] run data remove storage zufallsgenerator:vp1daten "EigZufG.p1Felder"[-1]

# Die Anzahl der Felder wird ausgelesen und in eine Variable gespeichert.
execute store result score VarZufG.p1Laenge PZZufG.p1Wert run data get storage zufallsgenerator:vp1daten "EigZufG.p1Felder"

# Damit der Zufallswert in der Felderreiche möglichst in Zehnerschritten läuft, wird der Zufallswert in den Wertebereich null bis neun eingegliedert und anschließend das Vielfache von Zehn aufsummiert, abhängig der bereits eingetragenen Felder.
execute if entity @s[scores={PZZufG.p1Wert=1}] run scoreboard players operation VarZufG.p1Zufallswert PZZufG.p1Wert %= KonstZufG.p1ZEHN PZZufG.p1Wert
execute if entity @s[scores={PZZufG.p1Wert=1}] run scoreboard players operation VarZufG.p1Min PZZufG.p1Wert = KonstZufG.p1ZEHN PZZufG.p1Wert
execute if entity @s[scores={PZZufG.p1Wert=1}] run scoreboard players operation VarZufG.p1Min PZZufG.p1Wert *= VarZufG.p1Laenge PZZufG.p1Wert
execute if entity @s[scores={PZZufG.p1Wert=1}] store result storage zufallsgenerator:vp1daten "EigZufG.p1Felder"[-1] int 1 run scoreboard players operation VarZufG.p1Zufallswert PZZufG.p1Wert += VarZufG.p1Min PZZufG.p1Wert

# Für die Zufallsposition wird der Zufallswert modulo der Länge der Felderreihe gerechnet und anschließend in den Punktestand des Spielers gespeichert.
execute if score VarZufG.p1Laenge PZZufG.p1Wert matches 1.. store result score @s[scores={PZZufG.p1Wert=2}] PZZufG.p1Pos run scoreboard players operation VarZufG.p1Zufallswert PZZufG.p1Wert %= VarZufG.p1Laenge PZZufG.p1Wert

# Wenn man die Länge der Felderreihe verkleinern möchte, wird geprüft ob die aktuelle Position nicht auf dem gelöschten Feld lag, falls doch, wird die Position auf das erste Feld gesetzt.
execute if score @s[scores={PZZufG.p1Wert=-1}] PZZufG.p1Pos >= VarZufG.p1Laenge PZZufG.p1Wert run scoreboard players set @s PZZufG.p1Pos 0

# Für den Aufruf der Felder-Funktion wird die Variable für die aktuelle Position auf null gesetzt.
scoreboard players set VarZufG.p1AktuellePosition PZZufG.p1Pos 0
function zufallsgenerator:vp1felder

# Der Spieler mit dem Stock erhält eine Chat-Nachricht, mit allen Optionen für die Felderreihe mit Zufallswerten.
tellraw @s ["Zufallsgenerator.erweitert.1:\n",{"text":"Felder == [","bold":true},{"storage":"zufallsgenerator:vp1daten","nbt":"\"EigZufG.p1Felder\"[]","color":"dark_purple","bold":true},{"text":"]","bold":true},"\n",{"text":"Felder.laenge (","bold":true},{"text":"=laenge + 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Länge + 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.p1Wert set 1"} },{"text":",","bold":true},{"text":"=laenge - 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Länge - 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.p1Wert set -1"} },{"text":") == ","bold":true},{"score":{"name":"VarZufG.p1Laenge","objective":"PZZufG.p1Wert"},"color":"gold","bold":true},"\n",{"text":"Felder.position = ","bold":true},{"text":"zufallswert(0,laenge-1)","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für eine zufällige Position"} },"clickEvent":{"action":"run_command","value":"/trigger PZZufG.p1Wert set 2"} },"\n",{"text":"Felder.position == ","bold":true},{"score":{"name":"@s","objective":"PZZufG.p1Pos"},"color":"green","bold":true},"\n",{"text":"Felder[","bold":true},{"score":{"name":"@s","objective":"PZZufG.p1Pos"},"color":"green","bold":true},{"text":"] == ","bold":true},{"score":{"name":"VarZufG.p1Wert","objective":"PZZufG.p1Pos"},"color":"dark_purple","bold":true}]

# Der Spieler erhält die Berechtigung den Auslöser erneut auszuführen und sein Wert wird auf null gesetzt.
scoreboard players enable @s PZZufG.p1Wert
scoreboard players set @s PZZufG.p1Wert 0
