# Wenn man den Stock auswählt, erhält man ein Etikett.
tag @a[nbt={SelectedItem:{tag:{EigImpG.4Stock:true} } }] add EtiImpG.4Ausgewaehlt

# Wenn man den Stock ausgewählt hat, und einen Tick zuvor den Wert auf null gesetzt bekommen hat, wird geprüft ob der Wert noch kleiner oder gleich dem Abstandswert ist. Nur dann wird sein Wert um eins erhöht.
execute as @a[tag=EtiImpG.4Ausgewaehlt,scores={PZImpG.4Wert=0..}] if score @s PZImpG.4Wert <= VarImpG.4Abstand PZImpG.4Wert run scoreboard players add @s PZImpG.4Wert 1
scoreboard players set @a[tag=EtiImpG.4Ausgewaehlt,tag=!EtiImpG.4Auswahl] PZImpG.4Wert 0

# Ebenfalls, wird auch hier der Wert geändert, wenn man den Stock gerade vor einen Tick abgewählt hat. Der Wert wird dabei solange um eins verringert, solange dieser noch größer gleich dem Abstandswert ist.
execute as @a[tag=!EtiImpG.4Ausgewaehlt,scores={PZImpG.4Wert=..0}] if score @s PZImpG.4Wert >= VarImpG.4Abstand PZImpG.4Wert run scoreboard players remove @s PZImpG.4Wert 1
scoreboard players set @a[tag=!EtiImpG.4Ausgewaehlt,tag=EtiImpG.4Auswahl] PZImpG.4Wert 0

# Wenn man den Stock ausgewählt oder nicht mehr ausgewählt hat, wird geprüft ob der Wert noch innerhalb des Abstands liegt und nur dann bekommt der Spieler das Abstands-Etikett.
execute as @a[tag=EtiImpG.4Ausgewaehlt,scores={PZImpG.4Wert=0..}] if score @s PZImpG.4Wert <= VarImpG.4Abstand PZImpG.4Wert run tag @s add EtiImpG.4Abstand
execute as @a[tag=!EtiImpG.4Ausgewaehlt,tag=!EtiImpG.4Abstand,scores={PZImpG.4Wert=..0}] if score @s PZImpG.4Wert >= VarImpG.4Abstand PZImpG.4Wert run tag @s add EtiImpG.4Abstand

# Besitzt der Spieler das Abstands-Etikett, wird die Titel-Nachricht über der Schnellleiste angezeigt. Die Nachricht beinhaltet die Zeit in Ticks, bis der Impuls erfolgt und den Abstandswert, wie weit die Ticks zählen müssen.
execute as @a[tag=EtiImpG.4Abstand] run title @s actionbar ["",{"score":{"name":"@s","objective":"PZImpG.4Wert"},"color":"yellow","bold":true},{"text":" Ticks, ","color":"gray","bold":true},{"score":{"name":"VarImpG.4Abstand","objective":"PZImpG.4Wert"},"color":"gold","bold":true},{"text":" Abstand","color":"gray","bold":true}]

# Hat der Wert des Spielers den Abstandswert erreicht, erhält der Spieler einen Impuls in Form einer Chat-Nachricht. In der wird auch der Abstandswert angezeigt.
execute as @a[tag=EtiImpG.4Abstand] if score @s PZImpG.4Wert = VarImpG.4Abstand PZImpG.4Wert run tellraw @s ["Impulgeber.4:\n",{"text":"Impuls(","color":"gray","bold":true},{"score":{"name":"VarImpG.4Abstand","objective":"PZImpG.4Wert"},"color":"dark_purple","bold":true},{"text":")","color":"gray","bold":true}]

# Anschließend wird das Etikett wieder entfernt, falls es vorhanden war.
tag @a[tag=EtiImpG.4Abstand] remove EtiImpG.4Abstand

# Den Spielern wird im selben Tick in dem sie den Stock ausgewählt haben auch ein Auswahl-Etikett gegeben, um zu merken ob der Stock im gleichen tick ausgewählt wurde oder abgewählt wurde, dabei wird das Auswahl-Etikett wieder entfernt.
tag @a[tag=EtiImpG.4Ausgewaehlt,tag=!EtiImpG.4Auswahl] add EtiImpG.4Auswahl
tag @a[tag=!EtiImpG.4Ausgewaehlt,tag=EtiImpG.4Auswahl] remove EtiImpG.4Auswahl

# Das Etikett wird wieder entfernt, sodass es beim nächsten Tick wieder vergeben werden kann, falls der Stock ausgewählt wurde.
tag @a[tag=EtiImpG.4Ausgewaehlt] remove EtiImpG.4Ausgewaehlt

# Wenn der Spieler auf eine Schaltfläche geklickt hat, wird der Abstandswert entweder hoch oder heruntergezählt.
execute if entity @p[distance=..15,scores={PZImpG.4Ausl=1}] run scoreboard players add VarImpG.4Abstand PZImpG.4Wert 1
execute if entity @p[distance=..15,scores={PZImpG.4Ausl=-1}] run scoreboard players remove VarImpG.4Abstand PZImpG.4Wert 1

# Damit beim Einschalten nur dann die Chat-Nachricht erscheint wird geprüft ob die Abstands-Variable schon angelegt wurde. Nur dann bekommen alle Spieler im Umkreis von 15 Blöcken und auch nur wenn sie etwas angeklickt haben oder noch keinen Wert besitzen die Chat-Nachricht.
execute if score VarImpG.4Abstand PZImpG.4Wert = VarImpG.4Abstand PZImpG.4Wert as @a[distance=..15] unless entity @s[scores={PZImpG.4Ausl=0}] run tellraw @s ["Impulsgeber.4:\n",{"text":"abstand = ","bold":true},{"text":"abstand + 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Abstand + 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZImpG.4Ausl set 1"} },"\n",{"text":"abstand = ","bold":true},{"text":"abstand - 1","color":"gray","bold":true,"underlined":true,"hoverEvent":{"action":"show_text","contents":{"text":"Tippe für Abstand - 1"} },"clickEvent":{"action":"run_command","value":"/trigger PZImpG.4Ausl set -1"} },"\n",{"text":"abstand == ","bold":true},{"score":{"name":"VarImpG.4Abstand","objective":"PZImpG.4Wert"},"color":"dark_purple","bold":true}]

# Wenn Spieler etwas angeklickt haben oder noch keinen Wert besitzen, wird ihnen die Berechtigung fürs Anklicken de rschaltflächen gegeben und sie bekommen den Wert null zugewiesen.
execute as @a[distance=..15] unless entity @s[scores={PZImpG.4Ausl=0}] run scoreboard players enable @s PZImpG.4Ausl
execute as @a[distance=..15] unless entity @s[scores={PZImpG.4Ausl=0}] run scoreboard players set @s PZImpG.4Ausl 0
