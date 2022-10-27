class LargeCrystal {
  float x;
  float y;
  float speed;
  int sizeWidth;
  int sizeHeight;
  int currentFrame = 0;
  int previousFrame = 0;
  final int timeFrame = 100;
  PImage[] crystal = new PImage[9];

  LargeCrystal (float x, float y, float speed, int sizeWidth, int sizeHeight) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sizeWidth = sizeWidth;
    this.sizeHeight = sizeHeight;
    for (int i = 0; i < crystal.length; i++) {
      crystal[i] = loadImage ("images/Crystal"+i+".png");
      crystal[i].resize(sizeWidth, sizeHeight);
    }
  }

  void update() {
    imageMode (CORNER);
    y -= speed;
    if (millis() > previousFrame + timeFrame) {
      currentFrame++;
      if (currentFrame > 8) {
        currentFrame = 0;
      }
      previousFrame = millis();
    }
    image (crystal[currentFrame], x, y);
  }

  boolean hit() {
    if (captainMarvel.x + 20 > this.x
      && captainMarvel.x - 20 < this.x + (this.sizeWidth)
      && captainMarvel.y + 75 > this.y
      && captainMarvel.y - 75 < this.y + (this.sizeHeight)) {
      return true;
    } else {
      return false;
    }
  }

  boolean outOfBounds() {
    if (this.y < -sizeHeight) {
      return true;
    } else {
      return false;
    }
  }
}
