# Zwei Punkte-Ziele werden erstellt.
scoreboard objectives add PZZufG.p1Pos dummy ["Zufallsgenerator.erweitert.1: ",{text:"Feldposition und Auslöser",bold:true}]
scoreboard objectives add PZZufG.p1Wert trigger ["Zufallsgenerator.erweitert.1: ",{text:"Wert der Variablen",bold:true}]

# Die Konstante für den Wert zehn wird gesetzt.
scoreboard players set KonstZufG.p1ZEHN PZZufG.p1Wert 10

# Ein Datenspeicher wird angelegt.
data merge storage zufallsgenerator:vp1daten {EigZufG.p1Felder:[]}

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick[minecraft:lore=["Wähle den Stock aus","um Zahlenwerte in eine","Felderreihe zu speichern","und um einen zufälligen","Zahlenwert davon zu erhalten."],minecraft:custom_name={text:"Zufallsgenerator",color:"dark_purple",bold:true},minecraft:custom_data={EigZufG.p1Alle:true,EigZufG.p1Felder:true},minecraft:enchantment_glint_override=true]
