float inc = 0.1;
int scl = 30;
int cols, rows;
float zoff = 0;
Particle[] particle;
PVector[] flowField;

int arraySize;
float angle;

void setup() {
  size(940, 540);
  cols  = floor(width/scl); //32
  rows = floor(height/scl); //18
  arraySize = 200;
  //particle = new Particle(0,0);
  particle = new Particle[arraySize];
  for (int i = 0; i < arraySize; i++) {
    particle[i] = new Particle(random(width), random(height));
  }
  flowField = new PVector[cols * rows];//558;
  background(255);
}

void draw() {
  float yoff = 0;
  background(255);

  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = x + y * cols;
      angle = noise(xoff, yoff, zoff) * TWO_PI;
      //flowField[index] = vector;
      PVector vector = new PVector(0, 0).fromAngle(angle);
      vector.setMag(0.1);
      flowField[index] = vector;
      xoff += inc;
      stroke(0, 50);
      strokeWeight(1);
      pushMatrix();
      translate(x * scl, y * scl);
      rotate(vector.heading());
      line(0, 0, scl, 0);
      popMatrix();
      //rect(x * scl, y * scl, scl, scl);
    }
    yoff += inc;
    //zoff += 0.0005;
  }

  for (int i = 0; i < arraySize; i++) {
    particle[i].follow(flowField);
    particle[i].update();
    particle[i].show();
    particle[i].edges();

  }
}
