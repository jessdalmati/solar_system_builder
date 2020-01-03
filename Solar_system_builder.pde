Planet sun;
//PeasyCam cam;
Boolean selected;

void setup() {
  size(600, 600, P3D);
  //cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0);
  //sun.spawnMoons(4, 1);
  selected = false;
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
  if(selected) {
    stroke(#D6E50E);
    strokeWeight(10);
    noFill();
    ellipse(0, 0, sun.radius*2, sun.radius*2);
  }
}

void mousePressed() {

  if(pmouseX < width/2 + sun.radius && pmouseX > width/2 - sun.radius 
    && pmouseY < height/2 + sun.radius && pmouseY > height/2 - sun.radius) {
      if(selected) {
        selected = false;
      } else {
        selected = true;
      }
  }
 
}


void keyPressed() {
  if(key == 'r' && selected) {
    sun.removeMoon();
  }
  
  if(key == 'a' && selected) {
    sun.spawnMoon();
  }
}
