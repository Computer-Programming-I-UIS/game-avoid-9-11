int y;
PImage  avi;
PImage exp;

class avion{
  
avion(){
    y = height/2;
    avi = requestImage("Avion.png");
    exp = requestImage("exp.png");
}
  
void MostrarYMover(){
  imageMode(CENTER);
  image(avi, 100 ,y);
  
  if(!keyPressed){
    avi = loadImage("Avion.png");
  }
  
    if(keyPressed && (key == CODED)){
    if(keyCode == UP){
         y -=3;
         avi = loadImage("Avion subiendo.png");
         if(y < 30){
           y = 30;
         }
    }else if(keyCode == DOWN){
      y +=3;
      avi = loadImage("Avion bajando.png");
       if(y > 630){
          y = 630;
            //exp = loadImage("exp.png");
            //image(exp, 100 ,y);
       }
    }
   }
}


}
