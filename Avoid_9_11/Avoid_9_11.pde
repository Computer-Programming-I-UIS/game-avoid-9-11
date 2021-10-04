PImage fondo, S, B; //Declaración de la imagen
int x = 0, y; //Variables
int gravedad = 0;
int modojuego = 0; // 1 es jugar, 0 es la pantalla de comienzo
int fond = 0;

avion Avion;

void setup(){
  size(1300, 700);
  Avion = new avion();  //Creación del objeto avión
}

void draw(){
  modojuego = 1;
  fondo = loadImage("New york 2.jpg");
  imageMode(CORNER);
  while(modojuego = 1){
    image(fondo, x, 0); 
  image(fondo, x+fondo.width, 0);//Movimiento del fondo
  }
  image(fondo, x, 0); 
  image(fondo, x+fondo.width, 0);//Movimiento del fondo
  x -= 5; //Velocidad de movimiento del fondo
  Avion.MostrarYMover();
}
