# Wenn die Zufalls-Position erreicht wurde, wird der Wert an dieser Position aus der Felderreihe ausgelesen.
execute if score @s PZZufG.p2Pos = VarZufG.p2AktuellePosition PZZufG.p2Pos store result score VarZufG.p2Wert PZZufG.p2Pos run data get storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[0]

# Das erste Feld wird an die letzte Position der Felderreihe verschoben.
data modify storage zufallsgenerator:vp2daten "EigZufG.p2Felder" append from storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[0]
data remove storage zufallsgenerator:vp2daten "EigZufG.p2Felder"[0]

# Die aktuelle Position wird um eins erhöht und wenn sie damit noch nicht die komplette Felderreihe durchlaufen hat, wird die Felder-Funktion selbst nochmal aufgerufen.
scoreboard players add VarZufG.p2AktuellePosition PZZufG.p2Pos 1
execute if score VarZufG.p2AktuellePosition PZZufG.p2Pos < VarZufG.p2Laenge PZZufG.p2Wert run function zufallsgenerator:vp2felder
