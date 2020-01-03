class Planet {
  float radius; 
  float angle;
  float dist;
  Planet[] planets;
  float orbitSpeed;
  PVector v;
  
  Planet(float r, float d, float s) {
    v = PVector.random3D();
    radius = r;
    dist = d;
    v.mult(dist);
    angle = random(TWO_PI);
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
      if(level < 3) {
        int numMoons = int(random(0, 3));
        planets[i].spawnMoons(numMoons, level+1);
      }
    }
  }
  
  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    
    PVector v2 = new PVector(1, 0, 1);
    PVector perp = v.cross(v2);
    
    rotate(angle, perp.x, perp.y, perp.z);
    translate(v.x, v.y, v.z);

    sphere(radius);
    //ellipse(0, 0, radius*2, radius*2);
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }

}
