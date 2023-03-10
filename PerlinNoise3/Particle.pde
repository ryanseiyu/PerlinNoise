class Particle {
  float a;
  float b;
  PVector position;
  PVector velocity;
  PVector acceleration;
  //PVector acc = new PVector(0,0);
  //int maxSpeed = 4;

  void update() {    
    position.add(velocity);
    velocity.add(acceleration);
    //velocity.limit(maxSpeed);
    acceleration.mult(0);
  }

  void follow(PVector[] v){
    int x = floor(position.x / scl); //max = 18
    println("x: " + x);
    int y = floor(position.y / scl);
    println("y: " + y);//max = 32
    int index = (x + y * cols)/2; // 18 + 32 * 32
    PVector force = v[index];
    applyForce(force);
  }

  void applyForce(PVector force){
    acceleration.add(force);
  }

  void show() {
    stroke(0);
    strokeWeight(5);
    point(position.x, position.y);
  }

  void edges(){
    if(position.x > width) position.x = 0;
    if(position.x < 0) position.x = width;
    if(position.y > height) position.y = 0;
    if(position.y < 0) position.y = height;
  }
  
  Particle(float apos, float  bpos) {
    position = new PVector(apos, bpos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    //velocity = PVector.random2D();
  }
}
