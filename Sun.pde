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
