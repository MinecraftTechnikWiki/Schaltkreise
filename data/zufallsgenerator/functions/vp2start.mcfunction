# Zwei Punkte-Ziele werden erstellt.
scoreboard objectives add PZZufG.p2Pos dummy ["Zufallsgenerator.erweitert.2: ",{"text":"Feldposition und Auslöser","bold":true}]
scoreboard objectives add PZZufG.p2Wert trigger ["Zufallsgenerator.erweitert.2: ",{"text":"Wert der Variablen","bold":true}]

# Die Konstante mit dem Wert zehn wird erstellt.
scoreboard players set KonstZufG.p2ZEHN PZZufG.p2Wert 10

# Ein Datenspeicher wird angelegt.
data merge storage zufallsgenerator:vp2daten {EigZufG.p2Felder:[]}

# Ein Markierer, der in seinem Namen einen Wahrheitswert speichern kann, wird erzeugt.
summon minecraft:marker ~ ~ ~ {CustomName:'{"text":"falsch","color":"red","bold":true}',Tags:["EtiZufG.p2Alle","EtiZufG.p2Bool"]}

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick[minecraft:lore=['"Wähle den Stock aus"','"um Zahlenwerte in eine"','"Felderreihe zu speichern"','"und um einen zufälligen"','"Zahlenwert davon zu erhalten."'],minecraft:custom_name='{"text":"Zufallsgenerator","color":"dark_purple","bold":true}',minecraft:custom_data={EigZufG.p2Alle:true,EigZufG.p2Felder:true},minecraft:enchantment_glint_override=true]
