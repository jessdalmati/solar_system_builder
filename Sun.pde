class Sun extends Planet {
  
  Boolean selected;
  //PImage sunTexture;
  
  Sun(int r) {
    super(r, 0, 0.001);
    angle = radians(45);
    selected = false;
    //sunTexture = loadImage("sun.jpg");
    //globe.getChild(0).setTexture(sunTexture);
  }
  
  @Override
  void spawnMoon() {
    float r = (radius*random(0.25, 0.65));
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
  
  @Override
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
  
  @Override
  void show() {
    pushMatrix();
    noStroke();
    
    PVector v2 = new PVector(1, 0, 1);
    PVector perp = v.cross(v2);
    
    rotateY(angle);
    translate(v.x, v.y, v.z);

    globe.getChild(0).setFill(fill);
    
    ring();
    shape(globe);
    
    if (planets != null) {
      for(int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    
    popMatrix();
    highlight();
  }
  
  @Override
  void highlight() {
    if(mouseOver() || selected) {
      pushMatrix();
      stroke(#D6E50E);
      strokeWeight(10); 
      noFill();
      ellipse(0, 0, sun.radius*2, sun.radius*2);
      popMatrix();
    }
  }
  
  Boolean mouseOver() {
    if(pmouseX < width/2 + sun.radius && pmouseX > width/2 - sun.radius 
    && pmouseY < height/2 + sun.radius && pmouseY > height/2 - sun.radius) {
      return true;
    }
    return false;
  }
  
}
