
Galaxy MilkyWay, AlphaCentauri;
Planet earth, mars, sun, x, y, z;
int tiles;
void setup() {
  size(800, 700, P3D);
  background(0);
  stroke(100);
  color red = color(255,0,0);
  color blue = color(0,0,255);
  color yellow = color(255, 204, 0);
  tiles = 1;
  
  int numPlanets = 5;
  
  MilkyWay = new Galaxy(2);
 // AlphaCentauri = new Galaxy(1);
  
  earth = new Planet(random(width),random(height),5,0,0,blue);
  mars = new Planet(random(width),random(height),9,0,0,red);
  sun = new Planet(random(width),random(height),11,0,0,yellow);
  
  x = new Planet();
  y = new Planet();
  z = new Planet();
   
   //MilkyWay.add(earth);
   //MilkyWay.add(mars);
   //MilkyWay.add(sun);
   //MilkyWay.add(x);
   //MilkyWay.add(y);
   //MilkyWay.add(z);
   
   for(int i=0;i<numPlanets;i++){
     MilkyWay.add(new Planet());
  //   AlphaCentauri.add(new Planet());
   }
 //  AlphaCentauri.trails = true;
//   print(MilkyWay.length());
}

void draw(){
   
  MilkyWay.update();
  MilkyWay.display(tiles);
 // AlphaCentauri.update();
 // AlphaCentauri.display();
}

void mouseClicked(){
  background(0);
  MilkyWay.reset();
  tiles = int(random(8));
 // AlphaCentauri.reset();
}

 int gravoff = 1;
  
  void keyPressed() {
  gravoff *= -1;
  
  if(gravoff<0){
    MilkyWay.mouseOff();
    println("off");
  }
  else{
    MilkyWay.mouseOn();
  println("on");
}
}