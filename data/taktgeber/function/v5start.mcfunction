# Das Punkte-Ziel wird erstellt.
scoreboard objectives add PZTaktG.5Wert trigger ["Taktgeber.5: ",{"text":"Wert der Variablen","bold":true}]

# Ein Markierer der in seinem Namen die Wahrheitswerte "wahr" und "falsch" speichern kann, wird erzeugt.
summon minecraft:marker ~ ~1 ~ {CustomName:{text:"falsch",color:"red",bold:true},Tags:["EtiTaktG.5Alle","EtiTaktG.5Bool"]}
