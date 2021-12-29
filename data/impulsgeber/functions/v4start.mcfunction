# Es werden zwei Punkte-Ziel erstellt, die Werte speichern und für Auslöser-Nachrichten verwendet werden.
scoreboard objectives add PZImpG.4Wert dummy ["Impulsgeber.4: ",{"text":"Wert","bold":true}]
scoreboard objectives add PZImpG.4Ausl trigger ["Impulsgeber.4: ",{"text":"Klick","bold":true}]

# Eine Variable für den Zeitabstand wird angelegt.
scoreboard players set VarImpG.4Abstand PZImpG.4Wert 1

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick{EigImpG.4Alle:true,EigImpG.4Stock:true,Enchantments:[{id:-1}],display:{Name:'{"text":"Impulsgeber","color":"dark_purple","bold":true}',Lore:['"Wähle den Stock aus"','"um einen Impuls"','"auszulösen."'] } }
