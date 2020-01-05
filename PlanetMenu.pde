class PlanetMenu extends Menu {
  
  PlanetMenu() {

  }
  
  void drawMenu(Planet sun) {
    if(show) {
      noStroke();
      fill(200, 75);
      rect(-width/2, -height/2, 120, height);
      if(sun.planets != null) {
        numButtons(sun.planets.length);
        for(int i = 0; i < buttons.length; i++) {
           buttons[i].drawButton();
        }
        highlight(sun);
      }
    }
  }
  
  void highlight(Planet sun) {
    if(mouseOver()) {
      for(int i = 0; i < buttons.length; i++) {
        if(buttons[i].mouseOver()) {
          buttons[i].highlight();
          sun.planets[i].highlight = true;
        }
      }
    }
  }

  void numButtons(int l) {
    String[] num = new String[l];
    for(int i = 0; i < l; i++) {
      num[i] = str(i + 1);
    }
    
    changeButtons(num);
  }
}
