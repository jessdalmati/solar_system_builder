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
  Boolean ring;
  color fill;
  color[] colours = {color(#9CEDB3), color(#ED9CE9), color(#EAED9C), color(255)};
  int curColour = 0;
  
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
    ring = false;
    this.fill = color(255);
  }
  
  void ring() {
    if(!ring) {
      int index = globe.getChildIndex(globe.getChild("RING"));
      if(index != -1) {
        globe.removeChild(index);
      }
    } else if(ring) {
      PShape ring = createShape();
      ring.beginShape();
      strokeWeight(radius/4);
      stroke(255);
      noFill();
      rotateZ(200);
      rotateY(180);
      rotateX(150);
      ellipse(0, 0, radius*2.5, radius*2.5);
      ring.endShape();
      globe.addName("RING", ring);
    }
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
    
    PVector v2 = new PVector(1, 0, 1);
    PVector perp = v.cross(v2);
    
    rotate(angle, perp.x, perp.y, perp.z);
    translate(v.x, v.y, v.z);
    
    globe.getChild(0).setFill(fill);
    highlight();
    ring();
    shape(globe);
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
  }
  
  void setColour(color fill) {
    this.fill = fill;
  }
  
  void nextColour() {
    if(curColour == colours.length) {
      curColour = 0;
    }
    this.fill = colours[curColour++];
  }
  
  void highlight() {
    if(highlight) {
      PShape highlight = createShape();
      highlight.beginShape();
      stroke(#D6E50E);
      strokeWeight(10); 
      noFill();
      ellipse(0, 0, radius*2, radius*2);
      highlight.endShape();
      globe.addName("HL", highlight);
      this.highlight = false;
    } else {
      int index = globe.getChildIndex(globe.getChild("HL"));
      if(index != -1) {
        globe.removeChild(index);
      }
    }
  }
  
}
