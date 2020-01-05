class Button {
  int x;
  int y;
  int w;
  int h;
  String text;

  Button(String text, int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  void drawButton() {
    noStroke();
    fill(0);
    rect(x, y, w, h, 10);
    fill(255);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
  }
  
  Boolean mouseOver() {
    int x = this.x + width/2;
    int y = this.y + height/2;
    
    if(mouseX < x + w && mouseX > x && mouseY < y + h
      && mouseY > y) {
        return true;
      }
      return false;
  }
  
  void highlight() {
    stroke(#D6E50E);
    strokeWeight(3); 
    noFill();
    rect(x, y, w, h, 10);
  }

}
