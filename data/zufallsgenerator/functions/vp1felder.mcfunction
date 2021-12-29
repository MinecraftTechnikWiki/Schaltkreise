# Wenn die Zufalls-Position erreicht wurde, wird der Wert an dieser Position aus der Felderreihe ausgelesen.
execute if score @s PZZufG.p1Pos = VarZufG.p1AktuellePosition PZZufG.p1Pos store result score VarZufG.p1Wert PZZufG.p1Pos run data get storage zufallsgenerator:vp1daten "EigZufG.p1Felder"[0]

# Das erste Feld wird an die letzte Position der Felderreihe verschoben.
data modify storage zufallsgenerator:vp1daten "EigZufG.p1Felder" append from storage zufallsgenerator:vp1daten "EigZufG.p1Felder"[0]
data remove storage zufallsgenerator:vp1daten "EigZufG.p1Felder"[0]

# Die aktuelle Position wird um eins erhöht und wenn sie damit noch nicht die komplette Felderreihe durchlaufen hat, wird die Felder-Funktion selbst nochmal aufgerufen.
scoreboard players add VarZufG.p1AktuellePosition PZZufG.p1Pos 1
execute if score VarZufG.p1AktuellePosition PZZufG.p1Pos < VarZufG.p1Laenge PZZufG.p1Wert run function zufallsgenerator:vp1felder
