int XYaxis;
int Zaxis;

int segments = 15;
float radius = 20;
float boneradius = 40;
int bend = 0;
int[] base = new int[3];
int controller = 20;

void setup(){
  size(1200,700,P3D);
background(0);
  for(int i : base){ base[i] = 0;}
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  translate(width/2, 3*(height/4));
  box(radius);
  translate(0,-boneradius,0);
  
  next(segments);


  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      if(bend>0){bend-=1;}
    }
    if(key == 'x' || key == 'X') {
      if(bend<segments);
      bend +=1; 
    }
    if (key == 'w' || key == 'W') {
      base[2]+=1;
    }
    if (key == 's' || key == 'S') {
      base[2]-=1;
    }
    if (key == 'a' || key == 'A') {
      base[0]-=1;
    }
    if (key == 'd' || key == 'D') {
      base[0]+=1;
    }
  } 
}

void next(int h){
  if(h>1){
stroke(255);
  noFill();
    XYaxis = int(map(mouseX,0, width, -controller, controller));
    
    Zaxis = int(map(mouseY,0,height, -controller, controller));
    if(h<bend){
      rotateZ(radians(XYaxis));
      rotateX(radians(Zaxis));
    }
    if(h>segments/2){
      rotateZ(radians(base[0]));
      rotateX(radians(base[2]));
    }
    box(radius);
    translate(0,-boneradius,0);
      
      next(h-1);
    }
  }