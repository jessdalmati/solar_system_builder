class CBodyMenu extends Menu {
  int planet;
  
  CBodyMenu() {
  
  }
  
  void drawMenu(Planet sun) {
    if(show) {
      if(sun.planets != null) {
        sun.planets[planet].highlight = true;
      }
      noStroke();
      fill(200, 75);
      rect(-width/2, -height/2, 120, height);
      for(int i = 0; i < buttons.length; i++) {
         buttons[i].drawButton();
      }
      highlight();
    }
  }
  
}
