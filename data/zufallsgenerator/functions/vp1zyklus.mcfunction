# Wenn Spieler den Stock ausgewählkt haben, erhalten sie ein Etikett.
tag @a[nbt={SelectedItem:{tag:{EigZufG.p1Felder:true} } }] add EtiZufG.p1Ausgewaehlt

# Wenn Spieler den Stock gerade erst ausgewählt haben, wird ihnen der Auslöser-Wert und die Position gesetzt.
scoreboard players set @a[tag=EtiZufG.p1Ausgewaehlt,tag=!EtiZufG.p1Auswahl] PZZufG.p1Wert -99
scoreboard players add @a[tag=EtiZufG.p1Ausgewaehlt,tag=!EtiZufG.p1Auswahl] PZZufG.p1Pos 0

# Wenn Spieler den Stock ausgewählt haben und irgend einen Auslöser angeklickt haben, wird die Auslöser-Funktion gestartet.
execute as @a[tag=EtiZufG.p1Ausgewaehlt] unless entity @s[scores={PZZufG.p1Wert=0}] run function zufallsgenerator:vp1ausloeser

# Es wird ein Etikett gegeben oder genommen, je nach dem ob man gerade Stock ausgewählt hat, oder nicht.
tag @a[tag=EtiZufG.p1Ausgewaehlt,tag=!EtiZufG.p1Auswahl] add EtiZufG.p1Auswahl
tag @a[tag=!EtiZufG.p1Ausgewaehlt,tag=EtiZufG.p1Auswahl] remove EtiZufG.p1Auswahl

# Das Etikett wird wieder entfernt.
tag @a[tag=EtiZufG.p1Ausgewaehlt] remove EtiZufG.p1Ausgewaehlt
