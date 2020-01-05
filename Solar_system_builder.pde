Planet sun;
//PeasyCam cam;

Menu mainMenu;
PlanetMenu planetMenu;
CBodyMenu cBodyMenu;


void settings() {
  size(600, 620, P3D);
}

void setup() {
  sun = new Planet(50, 0, 0);
  String[] buttonNames = {"+", "-", "planets"};
  mainMenu = new Menu(buttonNames);
  planetMenu = new PlanetMenu();
  cBodyMenu = new CBodyMenu();
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

  mainMenu.drawMenu();
  
  planetMenu.drawMenu(sun);
  
  cBodyMenu.drawMenu(sun);
  
}

void highlightSun() {
  stroke(#D6E50E);
  strokeWeight(10); 
  noFill();
  ellipse(0, 0, sun.radius*2, sun.radius*2);
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
    clickOnSun();
  } else if(mainMenu.mouseOver()) {
    clickOnMainMenu();
  } else if(planetMenu.mouseOver()) {
    clickOnPlanetMenu();
  } else if(cBodyMenu.mouseOver()) {
    
  } else {
    closeMenu();
  }
 
}

void clickOnPlanetMenu() {
  int selected = planetMenu.selected();
  if(selected != -1) {
    planetMenu.show = false;
    cBodyMenu.planet = selected;
    cBodyMenu.show = true; 
  }
}

void clickOnMainMenu() {
  int selected = mainMenu.selected();
  switch(selected) {
      case 0: 
        sun.spawnMoon(); 
        break;
      case 1: 
        sun.removeMoon();
        break;
      case 2: 
        mainMenu.show = false;
        planetMenu.show = true;
  }
}

Boolean menuOpen() {
  return mainMenu.show || planetMenu.show || cBodyMenu.show;
}

void clickOnSun() {
  mainMenu.show = !mainMenu.show;    
  planetMenu.show = false;
  cBodyMenu.show = false;
}

void closeMenu() {
  mainMenu.show = false;
  planetMenu.show = false;
  cBodyMenu.show = false;
}
