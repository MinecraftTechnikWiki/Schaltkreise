# Wenn Spieler den Stock ausgewählkt haben, erhalten sie ein Etikett.
tag @a[nbt={SelectedItem:{tag:{EigZufG.p2Felder:true} } }] add EtiZufG.p2Ausgewaehlt

# Wenn Spieler den Stock gerade erst ausgewählt haben, wird ihnen der Auslöser-Wert und die Position gesetzt.
scoreboard players set @a[tag=EtiZufG.p2Ausgewaehlt,tag=!EtiZufG.p2Auswahl] PZZufG.p2Wert -99
scoreboard players add @a[tag=EtiZufG.p2Ausgewaehlt,tag=!EtiZufG.p2Auswahl] PZZufG.p2Pos 0

# Wenn Spieler den Stock ausgewählt haben und irgend einen Auslöser angeklickt haben, wird die Auslöser-Funktion gestartet.
execute as @a[tag=EtiZufG.p2Ausgewaehlt] unless entity @s[scores={PZZufG.p2Wert=0}] run function zufallsgenerator:vp2ausloeser

# Es wird ein Etikett gegeben oder genommen, je nach dem ob man gerade Stock ausgewählt hat, oder nicht.
tag @a[tag=EtiZufG.p2Ausgewaehlt,tag=!EtiZufG.p2Auswahl] add EtiZufG.p2Auswahl
tag @a[tag=!EtiZufG.p2Ausgewaehlt,tag=EtiZufG.p2Auswahl] remove EtiZufG.p2Auswahl

# Das Etikett wird wieder entfernt.
tag @a[tag=EtiZufG.p2Ausgewaehlt] remove EtiZufG.p2Ausgewaehlt
