# Es werden zwei Punkte-Ziel erstellt, die Werte speichern und für Auslöser-Nachrichten verwendet werden.
scoreboard objectives add PZImpG.4Wert dummy ["Impulsgeber.4: ",{"text":"Wert","bold":true}]
scoreboard objectives add PZImpG.4Ausl trigger ["Impulsgeber.4: ",{"text":"Klick","bold":true}]

# Eine Variable für den Zeitabstand wird angelegt.
scoreboard players set VarImpG.4Abstand PZImpG.4Wert 1

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick[minecraft:lore=['"Wähle den Stock aus"','"um einen Impuls"','"auszulösen."'],minecraft:custom_name='{"text":"Impulsgeber","color":"dark_purple","bold":true}',minecraft:custom_data={EigImpG.4Alle:true,EigImpG.4Stock:true},minecraft:enchantment_glint_override=true]
