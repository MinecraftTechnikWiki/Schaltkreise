# Das Punkte-Ziel wird erstellt.
scoreboard objectives add PZTaktG.6Wert trigger ["Taktgeber.6: ",{text:"Wert der Variablen",bold:true}]

# Ein Markierer der in seinem Namen die Wahrheitswerte "wahr" und "falsch" speichern kann, wird erzeugt.
summon minecraft:marker ~ ~1 ~ {CustomName:{text:"falsch",color:"red",bold:true},Tags:["EtiTaktG.6Alle","EtiTaktG.6Bool"]}
