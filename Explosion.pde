class Explosion {
  float x;
  float y;
  float speed;
  int sizeWidth;
  int sizeHeight;
  int counter = 0;
  int currentFrame = 0;
  int previousFrame = 0;
  final int timeFrame = 70;
  PImage[] explosion = new PImage[10];

  Explosion(float x, float y, float speed, int sizeWidth, int sizeHeight) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sizeWidth = sizeWidth;
    this.sizeHeight = sizeHeight;
    for (int i = 0; i < explosion.length; i++) {
      explosion[i] = loadImage ("images/Explosion"+i+".png");
      explosion[i].resize(sizeWidth, sizeHeight);
    }
  }

  void update() {
    y -= speed;
    if (counter < 120) {
      counter += 1;
      imageMode (CORNER);
      if (millis() > previousFrame + timeFrame) {
        currentFrame++;
        if (currentFrame > 9) {
          currentFrame = 9;
        }
        previousFrame = millis();
      }
      image (explosion[currentFrame], x, y);
    } else {
      explosion = null;
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
