PImage fondo, S, B;
int x;

avion Avion;

void setup(){
  fondo = loadImage("New york 2.jpg");
  size(1300, 700);
  Avion = new avion();
}

void draw(){
  background(fondo);
  imageMode(CORNER);
  Avion.MostrarYMover();
}
