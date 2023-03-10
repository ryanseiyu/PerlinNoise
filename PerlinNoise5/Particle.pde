class Particle {
  float a;
  float b;
  PVector position;
  PVector velocity;
  PVector acceleration;
  //PVector acc = new PVector(0,0);
  int maxSpeed = 2; //Max speed of particles.
  PVector prevPosition;

  void update() {    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void follow(PVector[] v) {
    int x = floor(position.x / scl); //max = 18
    println("x: " + x);
    int y = floor(position.y / scl);
    println("y: " + y);//max = 32
    int index = (x + y * cols)/2; //18 + 32 * 32
    PVector force = v[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void show() {
    //stroke(0); //No Alpha to remove opacity.
    stroke(0, 5); //Changes Alpha of Stroke to add opacity.  
    strokeWeight(2);
    line(position.x, position.y, prevPosition.x, prevPosition.y);
    //point(position.x, position.y);
    updatePrev();
    
  }
  
  void updatePrev() {
    prevPosition.x = position.x;
    prevPosition.y = position.y;
  }

  void edges() {
    if(position.x > width) {
      position.x = 0;
      updatePrev();
    }
    if(position.x < 0) {
      position.x = width;
      updatePrev();
    }
    if(position.y > height) {
      position.y = 0;
      updatePrev();
    }
    if(position.y < 0) {
      position.y = height;
      updatePrev();
    }
  }
  
  Particle(float apos, float  bpos) {
    position = new PVector(apos, bpos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    prevPosition = position.copy();
    //velocity = PVector.random2D();
  } // In Java you must make the function's constructor!
}
