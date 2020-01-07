class CBodyMenu extends Menu {
  String[] buttonNames = {"+", "-", "ring", "colour", "<--"}; //, "size", "dist", "speed"};
  int planet;

  CBodyMenu(Planet sun) {
    this.sun = sun;
    this.buttons = new Button[buttonNames.length];
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i] = new Button(buttonNames[i], -width/2 + 20, -height/2 + i*60 + 20, 80, 40);
    }
    
    this.show = false;
  }
  
  void drawMenu() {
    if(show) {
      sun.planets[planet].highlight = true;
      drawBackground();
      for(int i = 0; i < buttons.length; i++) {
         buttons[i].drawButton();
      }
      buttons[2].highlight = sun.planets[planet].ring;
      highlight();
    }
  }
  
}
