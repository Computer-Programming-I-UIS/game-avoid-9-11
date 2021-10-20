//--Sonido--
import ddf.minim.*;
Minim minim;               //Biblioteca para reproducir sonido
AudioPlayer musica;

//--Imagenes usadas--
PImage fondo, S, B; 
PImage edificio;
PImage pantallainicio;
PImage guia, creditos;

//--Variables usadas--
int x = 0, y; 
//int gravedad = 0;         //Implementando gravedad
int[] vx = new int [2];     //Arrays para declarar la cantidad de edificios que se generan
int[] vy = new int [2];
int modojuego = 1;          // 1 es jugar, 0 es la pantalla de comienzo
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
  minim = new Minim(this);
  musica = minim.loadFile("musica.mp3");
  musica.loop();
  Avion = new avion();                            //Creación del objeto avión
}

void mousePressed(){
  if(modojuego == 1){
    if(mouseX > 468 && mouseX < 808 && mouseY > 489 && mouseY < 556){
    modojuego = 0;
  }
  if(mouseX > 1080 && mouseX < 1297 && mouseY > 662 && mouseY < 695){
      modojuego = 3;}
      }else if (modojuego == 3) {
      if(mouseX > 922 && mouseX < 1234 && mouseY > 605 && mouseY < 664){                        //Configuración de botones de la pantalla principal y menu del juego
      modojuego = 1; 
    }
      }      
  if(mouseX > 505 && mouseX < 766 && mouseY > 575 && mouseY < 646){
      modojuego = 2;
    } else if (modojuego == 2) {
      if(mouseX > 860 && mouseX < 1190 && mouseY > 590 && mouseY < 680){
      modojuego = 1; 
    }
  }
}

void draw(){
  if(modojuego == 0){
    fondo = loadImage("new york.jpg");
    imageMode(CORNER);
    image(fondo, x, 0); 
    image(fondo, x+fondo.width, 0);          //Movimiento del fondo
    x -= 13;                                  //Velocidad de movimiento del fondo  (NO subir de 13)
    
    if(x == -1300) x = 0;                    //Marcación límite del movimiento del background
    
    Avion.MostrarYMover();                   //Función de la clase de Avión
    
    edificio = loadImage("edificio.png");
    for(int i = 0 ; i < 2 ; i++){
      imageMode(CENTER);
      image(edificio, vx[i], vy [i] - (edificio.height/2+150));  //Generación de los edificios
      image(edificio, vx[i], vy [i] + (edificio.height/2+150));
     if(vx[i] < 0){
        vy[i] = (int)random(200, height-200);                     //Movimiento de los edificios
        vx[i] = width;
      }
      if(vx[i] == width/2) {
        puntaje = puntaje + 1;                                                //Contaje de puntaje y puntaje máximo y declaración de su texto en pantalla
        puntajemaximo = max(puntaje, puntajemaximo);
      }
      if(y > height || y < 0 || (abs(width/2-vx[i]) < 25 && abs(y-vy[i]) > 150)) {
        modojuego = 1;
        puntaje = 0;
      }
      vx[i] -= 25;                                                //Velocidad de movimiento de los edificios (Testeado hasta 25)
      }
    rect(0, 0, 100, 50);
    fill(250);
    text(puntaje, 40, 45);                                        //Texto puntaje actual
    fill(0);
            
            
   } else if(modojuego == 2){
     guia = loadImage("guia.png");
     image(guia,width/2,height/2);                                //Pantallas de guía y créditos
   } else if(modojuego == 3){
     creditos = loadImage("creditos.png");
     image(creditos,width/2,height/2);
   }else {
     imageMode(CENTER);
     fondo = loadImage("new york.jpg");
     image(fondo, width/2, height/2); 
     pantallainicio = loadImage("pantallainicio.png");            //Situar pantalla de incio (Formato PNG) por encima del background del juego
     image(pantallainicio, width/2, height/2);
     rect(435, 640, 400, 50);
     fill(250);
     text("Puntaje maximo: " + puntajemaximo, 460, 690);          //Texto puntaje máximo
     fill(0);
   }
}
