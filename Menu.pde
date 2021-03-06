class Menu {
  Button[] buttons;
  String[] buttonNames = {"+", "-", "planets", "colour", "ring"};
  Boolean show;
  Planet sun;

  Menu() {
    this.sun = new Planet(0, 0, 0);
    this.show = false;
    this.buttons = new Button[0];
  }
  
  Menu(Planet sun) {
    this.sun = sun;
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
  
  void drawBackground() {
    noStroke();
    fill(255, 50);
    rect(-width/2, -height/2, 120, height);
  }
  
  void drawMenu() {
    if(show) {
      drawBackground();
      for(int i = 0; i < buttons.length; i++) {
         buttons[i].drawButton();
      }
      buttons[4].highlight = sun.ring;
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
  
  void selectButton(int selected) {
    buttons[selected].highlight = !buttons[selected].highlight;
  }
  
}
