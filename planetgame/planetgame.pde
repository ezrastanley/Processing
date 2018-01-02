
Galaxy MilkyWay, AlphaCentauri;
Planet earth, mars, sun, x, y, z;
int tiles;
void setup() {
  colorMode(HSB,360,100,100);
  size(800, 700, P3D);
  background(0);
  stroke(100);
  tiles = 1;
  
  int numPlanets = 10;
  
  MilkyWay = new Galaxy(3);
 // AlphaCentauri = new Galaxy(1);
   
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
  MilkyWay.display(tiles); //inset "tiles" to tesselate
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
