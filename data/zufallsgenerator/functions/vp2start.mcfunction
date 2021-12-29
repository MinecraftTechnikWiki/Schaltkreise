# Zwei Punkte-Ziele werden erstellt.
scoreboard objectives add PZZufG.p2Pos dummy ["Zufallsgenerator.erweitert.2: ",{"text":"Feldposition und Auslöser","bold":true}]
scoreboard objectives add PZZufG.p2Wert trigger ["Zufallsgenerator.erweitert.2: ",{"text":"Wert der Variablen","bold":true}]

# Die Konstante mit dem Wert zehn wird erstellt.
scoreboard players set KonstZufG.p2ZEHN PZZufG.p2Wert 10

# Ein NBT-Speicher wird angelegt.
data merge storage zufallsgenerator:vp2daten {EigZufG.p2Felder:[]}

# Ein Markierer, der in seinem Namen einen Wahrheitswert speichern kann, wird erzeugt.
summon minecraft:marker ~ ~ ~ {CustomName:'{"text":"falsch","color":"red","bold":true}',Tags:["EtiZufG.p2Alle","EtiZufG.p2Bool"]}

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick{EigZufG.p2Alle:true,EigZufG.p2Felder:true,Enchantments:[{id:-1}],display:{Name:'{"text":"Zufallsgenerator","color":"dark_purple","bold":true}',Lore:['"Wähle den Stock aus"','"um Zahlenwerte in eine"','"Felderreihe zu speichern"','"und um einen zufälligen"','"Zahlenwert davon zu erhalten."'] } }
