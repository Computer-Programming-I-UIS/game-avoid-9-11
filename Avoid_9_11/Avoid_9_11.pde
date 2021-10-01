PImage  I, N;

void setup(){
  size(1300, 700);
  N = loadImage("New york 2.jpg");
  image(N,0,0);
}
void draw(){
   I = loadImage("Avion bajando.png"); 
   image(I,0,0);
}
