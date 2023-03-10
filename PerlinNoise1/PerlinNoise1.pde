float inc = 0.1;
int scl = 30;
int cols, rows;
//PVector vector;

void setup(){
    size(940,540);
    cols  = int(width/scl);
    rows = int(height/scl);
    //colorMode(HSB);
    //background(255);
}

void draw(){
    float yoff = 0;
    background(255);
    for (int y = 0; y < rows; y++){
        float xoff = 0;
        for (int x = 0; x < cols; x++){
            float angle = noise(xoff, yoff) * TWO_PI;
            PVector vector = new PVector(0,0).fromAngle(angle);
            xoff += inc;
            stroke(0);
            pushMatrix();
            translate(x * scl, y * scl);
            rotate(vector.heading());
            line(0, 0, scl, 0);
            popMatrix();
            //rect(x * scl, y * scl, scl, scl);
            }
    yoff += inc;
  }  
}
