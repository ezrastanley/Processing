class Galaxy {
  boolean trails = true;
  ArrayList<Planet> planets;
    Planet u,d,l,r;
  float gravity;
  PVector mousecolor;
    int minDis = 20;
  
  Galaxy(float grav){
    
  mousecolor = new PVector(0,100,100);
  planets = new ArrayList<Planet>();
  Planet mouse = new Planet(mouseX,mouseY,20,0,0, mousecolor);
  planets.add(mouse);
  gravity = grav;
}

  void add(Planet i){
    planets.add(i);
  }
  
  int length(){
  return planets.size();
  }
  
  Planet get(int i){
  return planets.get(i);
  }
  

  
  void update(){
    
    planets.get(0).location.set(mouseX,mouseY);
    //println("Planet location: "+planets.get(0).location());
    for(int i = 1; i<planets.size();i++){
      PVector force = findForce(planets.get(0),planets.get(i));
        planets.get(i).applyForce(force);
    }
      
    for(int i = 1; i<planets.size();i++){
      for(int j = i+1; j<planets.size();j++){
        Planet a = planets.get(j);
        Planet b = planets.get(i);
        PVector force = findForce(a,b);
       b.location.y -= height;
        force.add(findForce(a,b));
        b.location.y += 2*height;
        force.add(findForce(a,b));
        b.location.x+=width;
        b.location.y-=height;
        force.add(findForce(a,b));
        b.location.x-=2*width;
        force.add(findForce(a,b));
        b.location.x+=width;
        
        //println(force);
        planets.get(i).applyForce(force);
        planets.get(j).applyForce(force.mult(-1));
      }
    }

    for(int i = 1; i<planets.size();i++){
      planets.get(i).update();
    }
  }
  
  void display(){
    if(!trails){background(0);}
    for(int i = 0; i<planets.size();i++){
      Planet x = planets.get(i);
      x.display();
    }
  }
  
  void display(int divide){
          if(!trails){background(0);}
  
   if(divide<1){
  
      for(int i = 0; i<planets.size();i++){
        Planet x = planets.get(i);
        
        for(int j = i+1;j<planets.size();j++){
          Planet y = planets.get(j);
          stroke(y.mass()*20);
          line(x.location.x,x.location.y,y.location.x,y.location.y);
        }
        println("Planet "+i+" location: "+x.location.x+","+x.location.y);
        
      }
    }
    
    else{
      int h = height/divide;
      int w = width/divide;
      
      for(int i = 0; i<planets.size();i++){
        Planet x = planets.get(i);
        Planet y = x.copy();
        x.location.div(divide);
        
        for(int j=0; j<divide;j++){
          for(int k=0; k<divide;k++){
            x.mass/=divide;
            x.display();
            x.mass*=divide;
            x.location.x += w;
          }
          x.location.x-= w*divide;
           x.location.y += h;
        }
        
        x.location.set(y.location());
    }
  }
  }

  PVector findForce(Planet a, Planet b){
    //if(a == b){return new PVector(0,0);}
       
    PVector f = a.location().copy().sub(b.location());
    if(f.mag()<minDis){
    f.normalize();
  f.mult(minDis);}
    float g = gravity*(a.mass()*b.mass())/f.magSq();
    f.normalize();
    f.mult(g);
    return f;
  }
  
  void reset(){
    for(Planet planet : planets){
     planet.reset(); 
    }
  }
  
 void mouseOff(){
   planets.get(0).mass = 0;
 }
 
 void mouseOn(){
    planets.get(0).mass = 5;
 }
}
