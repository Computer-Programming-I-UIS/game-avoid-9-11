PImage fondo, S, B; //Declaración de la imagen
PImage edificio;
//PImage imginicio; // Espacio para declarar la imagen del inicio del juego
int x = 0, y; //Variables
int gravedad = 0;
int modojuego = 0; // 1 es jugar, 0 es la pantalla de comienzo
int fond = 0;
int[] vx = new int [2]; ///Arrays para declarar la cantidad de edificios que se generan
int[] vy = new int [2];

avion Avion;

void setup(){
  size(1300, 700);
  Avion = new avion();  //Creación del objeto avión
}

void mousePressed(){
  /*if(modojuego==1){
    vx[0] = 600;
    vy[0] = height/2;
    vx[1] = 900;
    vy[1] = 600;
    
  }*/
}

void draw(){
  //if(modojuego == 0){
    modojuego = 0;
    fondo = loadImage("New york 2.jpg");
    imageMode(CORNER);
    modojuego = 0;
    image(fondo, x, 0); 
    image(fondo, x+fondo.width, 0);//Movimiento del fondo
    x -= 5; //Velocidad de movimiento del fondo
    if(x == -1300) x = 0;
    Avion.MostrarYMover();
    edificio = loadImage("edificio.png");
    for(int i = 0 ; i < 2 ; i++){
      //imageMode(CENTER);
      image(edificio, vx[i], vy [i] - (edificio.height/2+100));  //Generación de los edificios
      image(edificio, vx[i], vy [i] + (edificio.height/2+100));
     if(vx[i] < 0){
        vy[i] = (int)random(200,height-200);
        vx[i] = width;
      }
      vx[i] -= 6;
      }
  //}
}
