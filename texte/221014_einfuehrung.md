# Processing Einführung

Ich folge hier weitgehend dem Tutorial [*Processing Overview*](https://processing.org/tutorials/overview) von Casey Reas und Ben Fry.


## Hallo Linie

`line(10,10,300,200);`

Ausführen durch "Run" Button (= Ctrl+R).

Die Größe des Fensters ändern:

	size(500,400);
	
Den Hintergrund weiss machen:

	background(255);
	
Den Strich rot machen:

	stroke(255,0,0);
	

## Statisch versus Interaktiv

Schreibt man den Code wie oben, ist er unveränderlich. Interaktive oder sich bewegende Bilder müssen aber Frame für Frame neu ausgerechnet werden. Dazu werden zwei eingebaute Funktionen benutzt: `setup()` und `draw()`.

**`setup()`** läuft nur einmal und wird für statische Setzungen oder Initialisierungen benutzt. Die erste Zeile soll immer `size()` sein.

	void setup() {
	  size(400, 400);
	  stroke(255);
	  background(192, 64, 0);
	}
	
**`draw()`** wird Frame für Frame neu befragt. Hier kommt also alles sich verändernde rein:

	void draw() {
	  line(150, 25, mouseX, mouseY);
	}

Da der Hintergrund hier in der `setup()` Funktion erzeugt wird, ändert er sich nicht. Die Alternative ist dieses Programm:

```
void setup() {
  size(500,400);
  stroke(255,0,0);
}

void draw() {
  background(255);
  line(10,10,mouseX,mouseY);
}
```

Andere vordefinierte Funktionen erweitern die Interaktivität. Das folgende Programm löscht immer dann das Bild, wenn die Maus gedrückt wurde:

```
void setup() {
  size(400, 400);
  stroke(255);
}

void draw() {
  line(150, 25, mouseX, mouseY);
}

void mousePressed() {
  background(192, 64, 0);
}
```


## Bilddateien exportieren

`saveFrame()` am Ende von `draw()` erzeugt tiff Dateien für jedes Frame.  
Alternative Formate mit `saveFrame("output.png")` oder `saveFrame("output-####.png")`.

PDF Dateien exportieren mit der entsprechenden Bibliothek.


## Bilder importieren und anzeigen

(Normaler Suchort: Der Ordner "data" in dem Sketchbook Ordner.)

```
PImage img; //eine variable vom typ PImage deklarieren

void setup(){
  size(600,400);
  img = loadImage("flowchart.jpg");
}

void draw(){
  background(0);
  //parameter: variable, x, y, optional anzuzeigende breite und höhe
  image(img,0,0,width,height); 
}
```

Die `tint()` Funktion erlaubt viele Veränderungen, z.B. Farbänderungen, Durchsichtigkeit.



