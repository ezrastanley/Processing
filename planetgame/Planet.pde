
class Planet {
  boolean spiral = false;
  float mass;
  PVector location, velocity, acceleration;
  PVector c;
   
   Planet (float x, float y, float m, float sx, float sy, PVector cl){
     mass = m;
     location = new PVector(x,y);
     velocity = new PVector(sx,sy);
     acceleration = new PVector(0,0);
     c = cl;
   }
   
   Planet(){
     mass = random(3,12);
     location = new PVector(random(width),random(height));
     velocity = new PVector(random(-2,2),random(-2,2));
     acceleration = new PVector(0,0);
     c = new PVector(random(360),random(80,100),random(80,100));
   }
   
   void update(){
     velocity.add(acceleration);
     location.add(velocity);
     acceleration.mult(0);
     checkEdges();
   }
   
    void checkEdges(){
      if(spiral){
        if (location.y > height) {
   location.y =height-(location.x*height)/width;
   location.x = 0;
    }
        if (location.y < 0) {
     location.y =(location.x*height)/width;
   location.x = width;    }
        if (location.x > width) {
     location.x = width-(location.y*width)/height;
   location.y = 0;    }
        if (location.x < 0) {
     location.x = (location.y*width)/height;
   location.y = height;    }
      }
      
      else{
  if (location.y > height) {
   //velocity.y *= -1;
   location.y = 0;
    }
  if (location.y < 0) {
   //velocity.y *= -1;
   location.y = height;
    }
  if (location.x > width) {
   //velocity.x *= -1;
   location.x = 0;
    }
  if (location.x < 0) {
   //velocity.x *= -1;
   location.x = width;
    }
   }
    }
    
   float mass() {
     return mass;
   }
   
   PVector location() {
     return location;
   }
   
   PVector velocity() {
     return velocity;
   }
   
   void applyForce(PVector force){
     PVector f = force;
     f.div(mass/10);
     acceleration.add(f);
     
   }
   
   Planet copy(){
     Planet y = new Planet(location.x,location.y,mass,velocity.x,velocity.y,c);
     return y;
   }
   
   void display(){
     noStroke();
     fill(c.x,c.y,c.z);
     //stroke(c.x,c.y,c.z-20);
     //c.z+=20;
     
     ellipse(location.x,location.y,mass*2,mass*2);
     
   }
   
   void reset(){
     location.set(new PVector(random(width),random(height)));
     velocity.set(new PVector(random(-2,2),random(-2,2)));
   }
   
}
