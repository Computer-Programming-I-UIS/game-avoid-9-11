PImage  avi;

class avion{
  
avion(){
    y = height/2;
    avi = requestImage("Avion.png");
}
  
void MostrarYMover(){
  imageMode(CENTER);
  image(avi, width/2 ,y);
  
  if(!keyPressed){
    avi = loadImage("Avion.png");
  }
  
    if(keyPressed && (key == CODED)){
    if(keyCode == UP){
         y -= 5;
         avi = loadImage("Avion subiendo.png");
         if(y < 30){
           y = 30;
         }
    }else if(keyCode == DOWN){
      y += 5;
      avi = loadImage("Avion bajando.png");
       if(y > 630){
          y = 630;
       }
    }
   }
}


}
