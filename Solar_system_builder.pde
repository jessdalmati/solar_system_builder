Sun sun;
Menu mainMenu;
PlanetMenu planetMenu;
CBodyMenu cBodyMenu;
Boolean pause;

Starfield sf = new Starfield();

void settings() {
  size(600, 620, P3D);
}

void setup() {
  sun = new Sun(60);
  mainMenu = new Menu(sun);
  planetMenu = new PlanetMenu(sun);
  cBodyMenu = new CBodyMenu(sun);
  pause = false;
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);

  sf.drawStars();

  sun.show();
  if(!pause) {
    sun.orbit();
  }

  mainMenu.drawMenu();
  
  planetMenu.drawMenu();
  
  cBodyMenu.drawMenu();
}


void mousePressed() {
  
  if(sun.mouseOver()) {
    clickOnSun();
  } else if(mainMenu.mouseOver()) {
    clickOnMainMenu();
  } else if(planetMenu.mouseOver()) {
    clickOnPlanetMenu();
  } else if(cBodyMenu.mouseOver()) {
    clickOnCBodyMenu();
  } else if(mouseOverPlay()) {
    clickOnPlay();
  } else {
    closeMenu();
  }
 
}

Boolean mouseOverPlay() {
  if(mouseX > 590 && mouseY > 590) {
    return true;
  }
  return false;
}

void clickOnPlay() {
  pause = !pause;
}

void clickOnPlanetMenu() {
  int selected = planetMenu.selected();
  if(selected != -1) {
    if(selected == planetMenu.buttons.length - 1) {
      planetMenu.show = false;
      mainMenu.show = true;
    } else {
      planetMenu.show = false;
      cBodyMenu.planet = selected;
      cBodyMenu.show = true; 
    }
  }
}


void clickOnCBodyMenu() {
  int selected = cBodyMenu.selected();
  switch(selected) {
    case 0:
      sun.planets[cBodyMenu.planet].spawnMoon();
      break;
    case 1:
      sun.planets[cBodyMenu.planet].removeMoon();
    case 2: 
      sun.planets[cBodyMenu.planet].ring = !sun.planets[cBodyMenu.planet].ring;
      break;
    case 3: 
      sun.planets[cBodyMenu.planet].nextColour();
      break;
    case 4:
      cBodyMenu.show = false;
      planetMenu.show = true;
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
        sun.selected = false;
        mainMenu.show = false;
        planetMenu.show = true;
        break;
      case 3:
        sun.nextColour();
        break;
      case 4: 
        sun.ring = !sun.ring;
        break;
  }
}

Boolean menuOpen() {
  return mainMenu.show || planetMenu.show || cBodyMenu.show;
}

void clickOnSun() {
  sun.selected = !sun.selected;
  mainMenu.show = !mainMenu.show;   
  planetMenu.show = false;
  cBodyMenu.show = false;
}

void closeMenu() {
  sun.selected = false;
  mainMenu.show = false;
  planetMenu.show = false;
  cBodyMenu.show = false;
}
