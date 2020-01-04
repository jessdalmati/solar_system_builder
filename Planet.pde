class Planet {
  float radius; 
  float angle;
  float dist;
  Planet[] planets;
  float orbitSpeed;
  PVector v;
  
  float x;
  float y;
  float z;
  
  PShape globe;
  
  Boolean highlight;
  
  Planet(float r, float d, float s) {
    v = PVector.random3D();
    x = v.x;
    y = v.y;
    z = v.z;
    radius = r;
    dist = d;
    v.mult(dist);
    angle = random(TWO_PI);
    orbitSpeed = s;
    
    noStroke();
    fill(255);
    globe = createShape(GROUP);
    PShape planet = createShape(SPHERE, radius);
    globe.addChild(planet);
    highlight = false;
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
  
  void spawnMoon() {
    float r = (radius*0.5);
    float d = random(radius+r+15, (radius+r)*2);
    float s = random(-0.035, 0.035);
    if(planets == null) {
      planets = new Planet[1];
      planets[0] = new Planet(r, d, s);
    } else if(planets.length < 10) {
      Planet[] temp = planets;
      planets = new Planet[temp.length + 1];
      for(int i = 0; i < temp.length; i++) {
        planets[i] = temp[i];
      }
      planets[planets.length - 1] = new Planet(r, d, s);
    }
  }
  
  void removeMoon() {
    if(planets != null) {
      if(planets.length == 1) {
        planets = null;
      } else {
        Planet[] temp = planets;
        planets = new Planet[temp.length - 1];
        for(int i = 0; i < planets.length; i++) {
          planets[i] = temp[i];
        }
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
    
    if(highlight) {
      globe.getChild(0).setFill(#D6E50E);
      highlight = false;
    } else {
      globe.getChild(0).setFill(color(255));
    }
    
    shape(globe);
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }
  

}
