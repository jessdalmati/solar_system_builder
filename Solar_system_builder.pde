Planet sun;

Menu mainMenu;
PlanetMenu planetMenu;
CBodyMenu cBodyMenu;

Starfield sf = new Starfield();



void settings() {
  size(600, 620, P3D);
}

void setup() {

  sun = new Planet(50, 0, 0);
  String[] names1 = {"+", "-", "planets", "sun", "ring"};
  mainMenu = new Menu(names1);
  planetMenu = new PlanetMenu();
  String[] names2 = {"moon", "-moon", "ring", "texture", "+size", "-size", 
    "+dist", "-dist", "+speed", "-speed"};
  cBodyMenu = new CBodyMenu(names2);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  
  //hint(DISABLE_DEPTH_MASK);
  sf.drawStars();
  //hint(ENABLE_DEPTH_MASK);
  
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
