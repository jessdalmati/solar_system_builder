class Starfield {
  Star[] stars; 
  
  Starfield() {
    stars = new Star[300];
    for(int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
  }
  
  void drawStars() {
    for(int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  }
  
  class Star {
    float x;
    float y;
    float z;
    float speed;
    
    Star() {

      x = random(-width, width);
      y = random(-height, height);
      z = random(2*width);
      speed = random(3);
    }
    
    void update() {
      z = z - speed;
      if(z < 1) {
        z = 2*width;
        x = random(-width, width);
        y = random(-height, height);
      }
    }
    
    void show() {
      fill(255);
      noStroke();
      
      float sx = map(x/z, 0, 1, 0, width);
      float sy = map(y/z, 0, 1, 0, height);
      
      ellipse(sx, sy, random(1, 3), random(1, 3));
    }
  }
}
