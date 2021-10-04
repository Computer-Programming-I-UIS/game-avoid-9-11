PImage fondo, S, B; //Declaración de la imagen
PImage edificio;
int x = 0, y; //Variables
int gravedad = 0;
int modojuego = 0; // 1 es jugar, 0 es la pantalla de comienzo
int fond = 0;
int[] vx = new int [2];
int[] vy = new int [2];

avion Avion;

void setup(){
  size(1300, 700);
  Avion = new avion();  //Creación del objeto avión
}

void draw(){
  modojuego = 1;
  fondo = loadImage("New york 2.jpg");
  imageMode(CORNER);
  //while(modojuego = 1){
    //image(fondo, x, 0); 
  image(fondo, x+fondo.width, 0);//Movimiento del fondo
  //}
  image(fondo, x, 0); 
  image(fondo, x+fondo.width, 0);//Movimiento del fondo
  x -= 5; //Velocidad de movimiento del fondo
  Avion.MostrarYMover();
  edificio = loadImage("edificio.png");
  for(int i = 0 ; i < 2 ; i++){
    image(edificio, vx[i], vy [i] - (edificio.height/2+100));  //Generación de los edificios
    image(edificio, vx[i], vy [i] + (edificio.height/2+100));
    if(vx[i] > 0){
      vy[i] = (int)random(200,height-200);
      vx[i] = width;
    }
    vx[i] = 6;
  }
}
