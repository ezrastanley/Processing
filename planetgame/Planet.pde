
class Planet {
  
  float mass;
  PVector location, velocity, acceleration;
  color c;
   
   Planet (float x, float y, float m, float sx, float sy, color cl){
     mass = m;
     location = new PVector(x,y);
     velocity = new PVector(sx,sy);
     acceleration = new PVector(0,0);
     c = cl;
   }
   
   Planet(){
     mass = random(3,12);
     location = new PVector(random(width),random(height));
     velocity = new PVector(random(2),random(2));
     acceleration = new PVector(0,0);
     c = color(random(255),random(255),random(255));
   }
   
   void update(){
     velocity.add(acceleration);
     location.add(velocity);
     acceleration.mult(0);
     checkEdges();
   }
   
    void checkEdges(){
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
     fill(c);
     ellipse(location.x,location.y,mass*3,mass*3);
     
   }
   
   void reset(){
     location.set(new PVector(random(width),random(height)));
     velocity.set(new PVector(random(2),random(3)));
   }
   
}