/* 
Cherry Tree Sketch  by Ezra Stanley 1/3/2018
click mouse to grow new tree
press z or x to rotate
*/

Tree cherryTree;
float view = 0;

void setup(){
  colorMode(HSB,360,100,100);
  size(800,700, P3D);
  background(0);
  cherryTree = new Tree(new PVector(0,0,0));
}

void draw(){
   translate(width/2,height,-250);
   rotateY(view);

  cherryTree.display();
    cherryTree.update();
}

void mouseClicked(){
     cherryTree = new Tree(new PVector(0,0,0));
}

void keyPressed(){
  if(key == 'z'){
    view+=radians(10);
}

  if(key == 'x'){
   view-=radians(10); 
  }
}