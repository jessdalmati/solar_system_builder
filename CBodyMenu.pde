class CBodyMenu extends Menu {
  int planet;
  
  CBodyMenu() {
  }
  
  CBodyMenu(String[] buttonNames) {
    super(buttonNames);
  }
  
  void drawMenu(Planet sun) {
    if(show) {
      if(sun.planets != null) {
        sun.planets[planet].highlight = true;
      }
      drawBackground();
      for(int i = 0; i < buttons.length; i++) {
         buttons[i].drawButton();
      }
      highlight();
    }
  }
  
}
