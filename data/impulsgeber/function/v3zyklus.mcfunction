# Es wird ein Etikett vergeben, wenn Spieler den Stock in der Schnellleiste ausgewählt haben.
execute as @a if items entity @s weapon.* *[minecraft:custom_data~{EigImpG.3Stock:true}] run tag @s add EtiImpG.3Ausgewaehlt

# Wenn Spieler das Etikett besitzen und mindestens den Wert eins besitzen und maximal den Abstandswert haben, dann wird ihnen der Wert um eins erhöht. Falls Spieler gerade den Stock ausgewählt haben, wird ihr Wert auf eins gesetzt.
execute as @a[tag=EtiImpG.3Ausgewaehlt,scores={PZImpG.3Wert=1..}] if score @s PZImpG.3Wert <= VarImpG.3Abstand PZImpG.3Wert run scoreboard players add @s PZImpG.3Wert 1
scoreboard players set @a[tag=EtiImpG.3Ausgewaehlt,tag=!EtiImpG.3Auswahl] PZImpG.3Wert 1

# Den Spielern wird durch die Titel-Nachricht über der Schnellleiste der Zeitabstand angezeigt, bis der Impuls in Form einer Chat-Nachricht erscheint.
execute as @a[tag=EtiImpG.3Ausgewaehlt,scores={PZImpG.3Wert=1..}] if score @s PZImpG.3Wert <= VarImpG.3Abstand PZImpG.3Wert run title @s actionbar ["",{score:{name:"@s",objective:"PZImpG.3Wert"},color:"yellow",bold:true},{text:" Ticks, ",color:"gray",bold:true},{score:{name:"VarImpG.3Abstand",objective:"PZImpG.3Wert"},color:"gold",bold:true},{text:" Abstand",color:"gray",bold:true}]
execute as @a[tag=EtiImpG.3Ausgewaehlt] if score @s PZImpG.3Wert = VarImpG.3Abstand PZImpG.3Wert run tellraw @s ["Impulgeber.3:\n",{text:"Impuls(",color:"gray",bold:true},{score:{name:"VarImpG.3Abstand",objective:"PZImpG.3Wert"},color:"dark_purple",bold:true},{text:")",color:"gray",bold:true}]

# Das Auswahl-Etikett wird in dem Tick vergeben, in dem der Stock ausgewählt wird. ebenfalls wird das Etikett wieder entfernt, wenn in dem Tick der stock nicht mehr ausgewählt wurde.
tag @a[tag=EtiImpG.3Ausgewaehlt,tag=!EtiImpG.3Auswahl] add EtiImpG.3Auswahl
tag @a[tag=!EtiImpG.3Ausgewaehlt,tag=EtiImpG.3Auswahl] remove EtiImpG.3Auswahl

# Damit das Etikett nur vorhanden ist, wenn der Stock ausgewählt wird, wird es nach dem gesamten Vorgang wieder entfernt.
tag @a[tag=EtiImpG.3Ausgewaehlt] remove EtiImpG.3Ausgewaehlt

# Wenn der Spieler in der Chat-Nachricht auf die Schaltfläche geklickt hat, wird die Abstands-Variable um eins erhöht.
execute if entity @p[distance=..15,scores={PZImpG.3Ausl=1}] run scoreboard players add VarImpG.3Abstand PZImpG.3Wert 1

# Wenn die Abstands-Variable existiert und die Spieler eine Schaltfläche angeklickt haben, wird ihnen im Chat erneut die Option mit Schaltflächen angezeigt.
execute if score VarImpG.3Abstand PZImpG.3Wert = VarImpG.3Abstand PZImpG.3Wert as @a[distance=..15] unless entity @s[scores={PZImpG.3Ausl=0}] run tellraw @s ["Impulsgeber.3:\n",{text:"abstand = ",bold:true},{text:"abstand + 1",color:"gray",bold:true,underlined:true,hover_event:{action:"show_text",value:{text:"Tippe für Abstand + 1"} },click_event:{action:"run_command",command:"/trigger PZImpG.3Ausl set 1"} },"\n",{text:"abstand == ",bold:true},{score:{name:"VarImpG.3Abstand",objective:"PZImpG.3Wert"},color:"dark_purple",bold:true}]

# Damit Spieler immer wieder auf die Schaltflächen klicken können, erhalten sie nach dem klicken sofort wieder die Berechtigung und deren Wert wird wieder auf null zurück gesetzt.
execute as @a[distance=..15] unless entity @s[scores={PZImpG.3Ausl=0}] run scoreboard players enable @s PZImpG.3Ausl
execute as @a[distance=..15] unless entity @s[scores={PZImpG.3Ausl=0}] run scoreboard players set @s PZImpG.3Ausl 0
