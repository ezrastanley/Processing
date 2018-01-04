class Branch {
  PVector root, tip, angle;
  float thickness, growthRate, leafColor;
  ArrayList<Branch> subBranches;
  float shade = 70; 
  int branchDensity = 100;
  int view = 0;
  
  Branch(PVector rt, PVector a, float g){
    root = rt.copy();
    tip = rt.copy();
    growthRate = g;
    thickness = 3;
    angle = a;
    leafColor = 325; //pick leaf color out of 360
    
    subBranches = new ArrayList<Branch>();
  }
  
  void update(){   
   
  if(thickness>5){leafColor = 36;} //turns leaf to branch
  
  if(shade>20){shade -= .1;} //ages branches

  else if(shade>17) {shade += random(-.2,.2);} //differentiates branches
 
  else{ shade = 17;} //darkest branch
      
      tip.y -= 10*growthRate;
      growthRate*= .9998;
      interpolateRoots();
      thickness += growthRate;
      
      if(random(branchDensity)<1){
        PVector a = new PVector(random(-40,40),random(-40,40),random(-40,40));
        Branch b = new Branch(tip.copy().mult(random(.4, .7)),a,growthRate);
        b.tip.set(0,0,0);
        subBranches.add(b);
        branchDensity -= 2;
      }
      
       if(subBranches.size() > 0){
    for(Branch branch : subBranches){
      branch.update();
    }
       } 
      
      
  }
  
  
  void display(){
    stroke(leafColor, 80, shade);
    fill(leafColor, 80, shade);
    translate(0,tip.y/2,0);
    box(thickness,tip.y,thickness);

    if(subBranches.size() > 0){
    for(Branch branch : subBranches){
      pushMatrix();
      
      translate(0,branch.root.y,0);
      rotateX(radians(branch.angle.x));
      rotateY(radians(branch.angle.y));
      rotateZ(radians(branch.angle.z));
      
      
      branch.display();
      popMatrix();

    }
    
    }

  }
  
  void interpolateRoots(){
    if(subBranches.size() > 0){
      for(Branch branch : subBranches){
          branch.root.sub(new PVector(0,7*growthRate));
      }
  }
  
  }
 
  void list(){
    println("Root: "+root);
    println("Tip: "+tip);
    println("Branches :");
    for(Branch branch : subBranches){
      print(branch.root+""+branch.angle+", ");
    }
    println();
 
  }
  
}