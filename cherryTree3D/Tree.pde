class Tree {
  Branch trunk;
  PVector angle = new PVector(0,0);;
  
  Tree(PVector rt){
    trunk = new Branch(rt,angle,.02);
  }
  
  void update(){
    trunk.update();
    //trunk.list();
  }
  
  void display(){
    background(0);
    trunk.display();
  }
  
  
}