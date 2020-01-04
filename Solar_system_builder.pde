Planet sun;
//PeasyCam cam;
Boolean showMenu;

void setup() {
  size(600, 600, P3D);
  sun = new Planet(50, 0, 0);
  showMenu = false;
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  sun.show();
  sun.orbit();
  
  if(mouseOverSun()) {
    highlightSun();
  }
  
  if(showMenu) {
    drawMenu();
    if(mouseOverAdd()) {
      highlightAdd();
    } else if(mouseOverRemove()) {
      highlightRemove();
    }
  }
  
}

void drawMenu() {
  noStroke();
  fill(200, 75);
  rect(-width/2, -height/2, 120, height);
  drawAddButton();
  drawRemoveButton();
}

void drawAddButton() {
  fill(0);
  rect(-width/2 + 20, -height/2 + 20, 80, 40, 10);
  fill(255);
  textSize(25);
  text("+", -width/2 + 50, -height/2 + 47);
}

void drawRemoveButton() {
  fill(0);
  rect(-width/2 + 20, -height/2 + 80, 80, 40, 10);
  fill(255);
  stroke(5);
  textSize(28);
  text("-", -width/2 + 53, -height/2 + 107);
}

void highlightSun() {
  stroke(#D6E50E);
  strokeWeight(10); 
  noFill();
  ellipse(0, 0, sun.radius*2, sun.radius*2);
}

void highlightAdd() {
  stroke(#D6E50E);
  strokeWeight(3); 
  noFill();
  rect(-width/2 + 20, -height/2 + 20, 80, 40, 10);
}

void highlightRemove() {
  stroke(#D6E50E);
  strokeWeight(3); 
  noFill();
  rect(-width/2 + 20, -height/2 + 80, 80, 40, 10);
}

Boolean mouseOverAdd() {
  if(mouseX > 20 && mouseX < 100
    && mouseY < 60 && mouseY > 20) {
      return true;
    }
    return false;
}

Boolean mouseOverRemove() {
    if(mouseX > 20 && mouseX < 100
    && mouseY < 120 && mouseY > 80) {
      return true;
    }
    return false;
}

Boolean mouseOverSun() {
    if(pmouseX < width/2 + sun.radius && pmouseX > width/2 - sun.radius 
    && pmouseY < height/2 + sun.radius && pmouseY > height/2 - sun.radius) {
      return true;
    }
    return false;
}

void mousePressed() {

  if(mouseOverSun()) {
    showMenu = true;
  } else if(mouseOverAdd()) {
    sun.spawnMoon();
  } else if(mouseOverRemove()) {
    sun.removeMoon();
  } else {
    showMenu = false;
  }
 
}
