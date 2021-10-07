//--Imagenes usadas--
PImage fondo, S, B; 
PImage edificio;
PImage pantallainicio;

//--Variables usadas--
int x = 0, y; 
//int gravedad = 0;         //Implementando gravedad
int[] vx = new int [2];     //Arrays para declarar la cantidad de edificios que se generan
int[] vy = new int [2];
int modojuego = 1;          // 1 es jugar, 0 es la pantalla de comienzo
//int fond = 0;             //Inexplicable aparición de esta variable, por ahora no se usa
int puntajemaximo = 0;
int puntaje = 0;
avion Avion;                //Declaración del objeto de nombre avión
 
//--Fuentes utilizadas--
PFont fuentep;

//--Funciones del juego--
void setup(){
  fuentep = loadFont("AmericanCaptain-48.vlw");   //Declaración de fuente
  textFont(fuentep);
  fill(255);                                      //Características fuente
  textSize(55);
  size(1300, 700);
  Avion = new avion();                            //Creación del objeto avión
}

void mousePressed(){
  if(modojuego==1){
    /*vx[0] = 600;            //Cambio de modos de juego con presionar el clic
    vy[0] = height/2;
    vx[1] = 900;              //Ubicación del primer par de edificios
    vy[1] = 600;*/
    modojuego = 0;
  }
}

void draw(){
  if(modojuego == 0){
    fondo = loadImage("New york 2.jpg");
    imageMode(CORNER);
    image(fondo, x, 0); 
    image(fondo, x+fondo.width, 0);          //Movimiento del fondo
    x -= 13;                                  //Velocidad de movimiento del fondo  (NO subir de 13)
    
    if(x == -1300) x = 0;                    //Marcación límite del movimiento del background
    
    Avion.MostrarYMover();                   //Función de la clase de Avión
    
    edificio = loadImage("edificio.png");
    for(int i = 0 ; i < 2 ; i++){
      imageMode(CENTER);
      image(edificio, vx[i], vy [i] - (edificio.height/2+100));  //Generación de los edificios
      image(edificio, vx[i], vy [i] + (edificio.height/2+100));
     if(vx[i] < 0){
        vy[i] = (int)random(200, height-200);                     //Movimiento de los edificios
        vx[i] = width;
      }
      if(vx[i] == width/2) {
        puntaje = puntaje + 1;                                                //Contaje de puntaje y puntaje máximo y declaración de su texto en pantalla
        puntajemaximo = max(puntaje, puntajemaximo);
      }
      if(y > height || y < 0 || (abs(width/2-vx[i]) < 25 && abs(y-vy[i]) > 100)) {
        modojuego = 1;
        puntaje = 0;
      }
      vx[i] -= 25;                                                //Velocidad de movimiento de los edificios (Testeado hasta 25)
      }
    rect(0, 0, 100, 50);
    fill(250);
    text(puntaje, 40, 45);                                        //Texto puntaje actual
    fill(0);
            
            
   } else {
     imageMode(CENTER);
     fondo = loadImage("New york 2.jpg");
     image(fondo, width/2, height/2); 
     pantallainicio = loadImage("pantallainicio.png");            //Situar pantalla de incio (Formato PNG) por encima del background del juego
     image(pantallainicio, width/2, height/2);
     rect(435, 640, 400, 50);
     fill(250);
     text("Puntaje maximo: " + puntajemaximo, 460, 690);          //Texto puntaje máximo
     fill(0);
   }
}
