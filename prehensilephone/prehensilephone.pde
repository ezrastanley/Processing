import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;




int segments = 20;
float radius = 20;
float boneradius = 30;
int[] view = new int[2];
int[] base = new int[2];


int bendpoint = segments/2;
int XYaxis;
int Zaxis;

void setup(){
  size(1200,700,P3D);
background(0);
      view[0] = 0;
      view[1] = 0;
   oscP5 = new OscP5(this,31337);
   oscP5.plug(this,"bend","/mrmr/slider/horizontal/2/Felix-Artell");
   oscP5.plug(this,"XY","/mrmr/accelerometerZ/1/Felix-Artell");
   oscP5.plug(this,"Z","/mrmr/accelerometerX/1/Felix-Artell");
   oscP5.plug(this,"baseX","/mrmr/tactilezoneX/1/Felix-Artell");
   oscP5.plug(this,"baseY","/mrmr/tactilezoneY/1/Felix-Artell");
      
   oscP5.plug(this,"bend","/mrmr/slider/horizontal/1/Felix-Artell");
   oscP5.plug(this,"XY","/mrmr/accelerometerY/0/Felix-Artell");
   oscP5.plug(this,"Z","/mrmr/accelerometerX/0/Felix-Artell");
   oscP5.plug(this,"baseX","/mrmr/tactilezoneX/0/Felix-Artell");
   oscP5.plug(this,"baseY","/mrmr/tactilezoneY/0/Felix-Artell");
   
   
   
}

void bend(int b){
  
  bendpoint=b*segments/1000;
} 

void XY(int x){
  XYaxis=x;
}

void Z(int z){
  Zaxis=z;
}

void baseX(int x){
  base[0] = x;
}

void baseY(int x){
  base[1] = x;
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  translate(width/2, 3*(height/4));
 
  if (keyPressed) {      
      if (key == 'i' || key == 'I') {
      view[0] += 1;
    }
    if (key == 'k' || key == 'K') {
      view[0] -= 1;
    }
    if (key == 'j' || key == 'J') {
      view[1] += 1;
    }
    if (key == 'l' || key == 'L') {
      view[1] -= 1;
    }
    if (key == 'r' || key == 'R') {
      view[0] = 0;
      view[1] = 0;
    }
  } 
  rotateX(radians(view[0]));
  rotateY(radians(view[1]));
    
  box(radius);
  translate(0,-boneradius,0);
  
  next(segments);
}

void next(int h){
  if(h>1){
stroke(random(255),random(255),random(255));
  noFill();
  lights();
  
  int divider = 15;
  int offset = 500/divider;
  
    if(h<bendpoint){
      rotateX(-radians(XYaxis/divider-offset));
      rotateZ(-radians(Zaxis/divider-offset));
    }
    if(h>segments/2){
      rotateZ(radians(base[0]/divider-offset));
      rotateX(radians(base[1]/divider-offset));
    }
    sphere(radius);
    translate(0,-boneradius,0);
      
      next(h-1);
    }
    println("baseX:"+XYaxis);
    println("baseY:"+Zaxis);
    println("bendpoint:"+bendpoint);
     
    
  }

void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
  */  
  if(theOscMessage.isPlugged()==false) {
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());
  }
}