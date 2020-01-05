class Menu {
  Button[] buttons;
  String[] buttonNames;
  Boolean show;
  
  Menu() {
    this.buttonNames = new String[0];
    this.buttons = new Button[0];
    this.show = false;
  }
  
  Menu(String[] buttonNames) {
    this.buttonNames = buttonNames;
    this.buttons = new Button[buttonNames.length];
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i] = new Button(buttonNames[i], -width/2 + 20, -height/2 + i*60 + 20, 80, 40);
    }
    
    this.show = false;
  }
  
  void changeButtons(String[] buttonNames) {
    this.buttonNames = buttonNames;
    this.buttons = new Button[buttonNames.length];
    
    for(int i = 0; i < buttons.length; i++) {
      buttons[i] = new Button(buttonNames[i], -width/2 + 20, -height/2 + i*60 + 20, 80, 40);
    }
  }
  
  void drawMenu() {
    if(show) {
      noStroke();
      fill(200, 75);
      rect(-width/2, -height/2, 120, height);
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
          break;
        }
      }
    }
  }
  
  Boolean mouseOver() {
    if(mouseX > 0 && mouseX < 120
    && mouseY < height && mouseY > 0 && show) {
      return true;
    }
    return false;
  }
  
  int selected() {
    if(mouseOver()) {
      for(int i = 0; i < buttons.length; i++) {
        if(buttons[i].mouseOver()) {
          return i;
        }
      }
    }
    return -1;
  }
  
}
