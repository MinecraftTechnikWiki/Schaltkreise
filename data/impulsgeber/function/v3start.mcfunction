# Es werden zwei Punkte-Ziele erstellt, welche Tick-Wert und den Auslöser-Wert speichern können.
scoreboard objectives add PZImpG.3Wert dummy ["Impulsgeber.3: ",{text:"Wert",bold:true}]
scoreboard objectives add PZImpG.3Ausl trigger ["Impulsgeber.3: ",{text:"Klick",bold:true}]

# Es wird eine Variable für den Zeitabstand gesetzt.
scoreboard players set VarImpG.3Abstand PZImpG.3Wert 1

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit speziellen NBT-Eigenschaften.
give @a[distance=..15] minecraft:stick[minecraft:lore=["Wähle den Stock aus","um einen Impuls","auszulösen."],minecraft:custom_name={text:"Impulsgeber",color:"dark_purple",bold:true},minecraft:custom_data={EigImpG.3Alle:true,EigImpG.3Stock:true},minecraft:enchantment_glint_override=true]
