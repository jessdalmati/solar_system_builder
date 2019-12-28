class Planet {
  float radius; 
  float angle;
  float dist;
  Planet[] planets;
  float orbitSpeed;
  
  Planet(float r, float d, float s) {
    radius = r;
    angle = random(TWO_PI);
    dist = d;
    orbitSpeed = s;
  }
  
  void orbit() {
    angle = angle + orbitSpeed;
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for(int i = 0; i < planets.length; i++) {
      float r = (radius*0.5)/level;
      float d = random(radius+r+15, (radius+r)*2);
      float s = random(-0.035, 0.035);
      planets[i] = new Planet(r, d, s);
      if(level < 4) {
        planets[i].spawnMoons(int(random(0, 3)), level+1);
      }
    }
  }
  
  void show() {
    pushMatrix();
    fill(255, 100);
    rotate(angle);
    translate(dist, 0);

    ellipse(0, 0, radius*2, radius*2);
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }

}
