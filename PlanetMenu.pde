class PlanetMenu extends Menu {
  
  PlanetMenu(Sun sun) {
    this.sun = sun;
    this.show = false;
  }
  
  void drawMenu() {
    if(show) {
      drawBackground();
      if(sun.planets != null) {
        numButtons(sun.planets.length);
      } else {
        numButtons(0);
      }
      for(int i = 0; i < buttons.length; i++) {
        buttons[i].drawButton();
      }
      highlight();
    }
  }
  
  void highlight() {
    if(mouseOver()) {
      for(int i = 0; i < buttons.length; i++) {
        if(buttons[i].mouseOver()) {
          buttons[i].highlight();
          if(i != buttons.length - 1) {
            sun.planets[i].highlight = true;
          }
        }
      }
    }
  }

  void numButtons(int l) {
    String[] num = new String[l + 1];
    for(int i = 0; i < l; i++) {
      num[i] = str(i + 1);
    }
    num[l] = "<--";
    changeButtons(num);
  }
}
