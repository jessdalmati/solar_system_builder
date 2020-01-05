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

      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      z = random(width/2);
      speed = random(2);
    }
    
    void update() {
      z = z - speed;
      if(z < 1) {
        z = width/2;
        x = random(-width/2, width/2);
        y = random(-height/2, height/2);
      }
    }
    
    void show() {
      fill(255);
      noStroke();
      
      float sx = map(x/z, 0, 1, 0, width/2);
      float sy = map(y/z, 0, 1, 0, height/2);
      float d = map(z, 0, width/2, 4, 0);
      
      ellipse(sx, sy, d, d);
    }
  }
}
