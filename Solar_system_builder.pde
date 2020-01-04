Planet sun;
//PeasyCam cam;
Boolean showMenu;
Boolean showPlanetMenu;
Button[] BPlanets;

void setup() {
  size(600, 620, P3D);
  sun = new Planet(50, 0, 0);
  showMenu = false;
  showPlanetMenu = false;
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
    } else if(mouseOverPlanet()) {
      highlightPlanet();
    }
  } else if(showPlanetMenu) {
    drawPlanetMenu();
    highlightBPlanet();
  }
  
}

void drawPlanetMenu() {
  noStroke();
  fill(200, 75);
  rect(-width/2, -height/2, 120, height);
  drawPlanetButtons();
}

void drawPlanetButtons() {
  if(sun.planets != null) {
    BPlanets = new Button[sun.planets.length];
    for(int i = 0; i < BPlanets.length; i++) {
      BPlanets[i] = new Button(-width/2 + 20, -height/2 + i*60 + 20, 80, 40);
      BPlanets[i].drawButton(str(i + 1), -width/2 + 50, -height/2 + 47 + i*60, 25);
    }
  } 
}

void drawMenu() {
  noStroke();
  fill(200, 75);
  rect(-width/2, -height/2, 120, height);
  drawAddButton();
  drawRemoveButton();
  drawPlanetButton();
}

void drawPlanetButton() {
  noStroke();
  fill(0);
  rect(-width/2 + 20, -height/2 + 140, 80, 40, 10);
  fill(255);
  textSize(18);
  text("planets", -width/2 + 28, -height/2 + 165);
}

void drawAddButton() {
  noStroke();
  fill(0);
  rect(-width/2 + 20, -height/2 + 20, 80, 40, 10);
  fill(255);
  textSize(25);
  text("+", -width/2 + 50, -height/2 + 47);
}

void drawRemoveButton() {
  noStroke();
  fill(0);
  rect(-width/2 + 20, -height/2 + 80, 80, 40, 10);
  fill(255);
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

void highlightPlanet() {
  if(mouseOverPlanet()) {
    stroke(#D6E50E);
    strokeWeight(3); 
    noFill();
    rect(-width/2 + 20, -height/2 + 140, 80, 40, 10);
  }
}

void highlightBPlanet() {
  int i = mouseOverBPlanet();
  if(i != -1) {
    BPlanets[i].drawHighlight();
    sun.planets[i].highlight = true;
  }
}

int mouseOverBPlanet() {
  if(BPlanets != null) {
    for(int i = 0; i < BPlanets.length; i++) {
      if(BPlanets[i].mouseOverButton()) {
        return i;
      }
    }
  }
  return -1;
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

Boolean mouseOverPlanet() {
  if(mouseX > 20 && mouseX < 100
    && mouseY < 180 && mouseY > 140) {
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

Boolean mouseOverMenu() {
    if(mouseX > 0 && mouseX < 120
    && mouseY < height && mouseY > 0) {
      return true;
    }
    return false;
}

void mousePressed() {

  if(mouseOverSun()) {
    if(showMenu) {
      showMenu = false;
      showPlanetMenu = false;
    } else {
      showPlanetMenu = false;
      showMenu = true;
    }  
  } else if(mouseOverMenu()) {
    if(showMenu) {
      if(mouseOverAdd()) {
        sun.spawnMoon();
      } else if(mouseOverRemove()) {
        sun.removeMoon();
      } else if(mouseOverPlanet()) {
        showMenu = false;
        showPlanetMenu = true;
      }
    } else if(showPlanetMenu && BPlanets != null) {
      
    }
  } else {
    showMenu = false;
    showPlanetMenu = false;
  }
 
}
