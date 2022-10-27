class MenuButton {
  int outlineColor;
  int mainColor;
  int x;
  int y;
  int sizeWidth;
  int sizeHeight;
  int level;

  MenuButton (int outlineColor, int mainColor, int x, int y, int sizeWidth, int sizeHeight, int level) {
    this.outlineColor = outlineColor;
    this.mainColor = mainColor;
    this.x = x;
    this.y = y;
    this.sizeWidth = sizeWidth;
    this.sizeHeight = sizeHeight;
    this.level = level;
  }

  void update() {
    rectMode (CENTER);
    textAlign (CENTER);
    textSize(12);
    fill (outlineColor);
    rect (x, y, sizeWidth + 5, sizeHeight + 5);
    fill (mainColor);
    rect (x, y, sizeWidth, sizeHeight);
    fill (255);
    if (level == -1) {
      text ("LOCKED", x, y);
    } else {
      text ("LEVEL "+level, x, y);
    }
    rectMode (CORNER);
  }

  void updateInfinite() {
    rectMode (CENTER);
    textAlign (CENTER);
    textSize(12);
    fill (outlineColor);
    rect (x, y, sizeWidth + 5, sizeHeight + 5);
    fill (mainColor);
    rect (x, y, sizeWidth, sizeHeight);
    fill (255);
    if (infiniteMode == false) {
      text ("INFINITE MODE\nDISABLED", x, y);
    } else {
      text ("INFINITE MODE\nENABLED", x, y);
    }
    rectMode (CORNER);
  }

  boolean hover() {
    if (mouseX >= x-(sizeWidth/2) && mouseX <= x+(sizeWidth/2) &&
      mouseY >= y-(sizeHeight/2) && mouseY <= y+(sizeHeight/2)) {
      return true;
    } else {
      return false;
    }
  }
}
