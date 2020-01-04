class Button {
  int x;
  int y;
  int w;
  int h;
  
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void drawButton(String text, int textX, int textY, int textSize) {
    noStroke();
    fill(0);
    rect(x, y, w, h, 10);
    fill(255);
    textSize(textSize);
    text(text, textX, textY);
  }
  
  Boolean mouseOverButton() {
    int x = this.x + width/2;
    int y = this.y + height/2;
    
    if(mouseX < x + w && mouseX > x && mouseY < y + h
      && mouseY > y) {
        return true;
      }
      return false;
  }
  
  void drawHighlight() {
    stroke(#D6E50E);
    strokeWeight(3); 
    noFill();
    rect(x, y, w, h, 10);
  }

}
