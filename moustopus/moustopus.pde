void setup(){
  size(1200,700);
background(0);
}

float theta;

void draw(){

  translate(width/2, 3*(height/4));
  line(0,0,0,-10);
  translate(0,-10);
}

void next(float h, float s) {
  if(h>1){
    strokeWeight(s);
    stroke(random(256),random(256),random(256));
  theta = random(-.5,.5);
  rotate(theta);
  line(0, 0, 0, -s);
  translate(0,-s);

 

  next(h-1, s+.3);}
  
}

void mouseMoved(){
  next(100,5);   
  delay(1);
    if(frameCount%50 == 0){
    background(0);}
}