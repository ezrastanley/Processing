Tree hedge;
float view = 0;

void setup(){
  colorMode(HSB,360,100,100);
  size(800,700, P3D);
  background(0);
  stroke(36, 92, 40);
 
  hedge = new Tree(new PVector(0,0,0));
}

void draw(){
   translate(width/2,height,-200);
   rotateY(view);

  hedge.display();
    hedge.update();
}

void mouseClicked(){
     hedge = new Tree(new PVector(0,0,0));
}

void keyPressed(){
  if(key == 'z'){
    view+=radians(10);
}

  if(key == 'x'){
   view-=radians(10); 
  }
}