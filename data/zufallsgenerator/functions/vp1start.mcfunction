# Zwei Punkte-Ziele werden erstellt.
scoreboard objectives add PZZufG.p1Pos dummy ["Zufallsgenerator.erweitert.1: ",{"text":"Feldposition und Auslöser","bold":true}]
scoreboard objectives add PZZufG.p1Wert trigger ["Zufallsgenerator.erweitert.1: ",{"text":"Wert der Variablen","bold":true}]

# Die Konstante für dne Wert zehn wird gesetzt.
scoreboard players set KonstZufG.p1ZEHN PZZufG.p1Wert 10

# Ein NBT-Speicher wird angelegt.
data merge storage zufallsgenerator:vp1daten {EigZufG.p1Felder:[]}

# Spieler im Umkreis von 15 Blöcken erhalten einen Stock mit Verzauberungsschimmer.
give @a[distance=..15] minecraft:stick{EigZufG.p1Alle:true,EigZufG.p1Felder:true,Enchantments:[{id:-1}],display:{Name:'{"text":"Zufallsgenerator","color":"dark_purple","bold":true}',Lore:['"Wähle den Stock aus"','"um Zahlenwerte in eine"','"Felderreihe zu speichern"','"und um einen zufälligen"','"Zahlenwert davon zu erhalten."'] } }
