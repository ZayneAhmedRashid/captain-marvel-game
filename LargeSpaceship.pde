class LargeSpaceship {
  float x;
  float y;
  float speed;
  int size;
  int currentFrame = 0;
  int previousFrame = 0;
  final int timeFrame = 75;
  PImage[] spaceship = new PImage[9];

  LargeSpaceship (float x, float y, float speed, int size) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.size = size;
    for (int i = 0; i < spaceship.length; i++) {
      spaceship[i] = loadImage ("images/Spaceship"+i+".png");
      spaceship[i].resize(size, size);
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
    image (spaceship[currentFrame], x, y);
  }

  boolean hit() {
    if (captainMarvel.isEmpowered() == false) {
      if (captainMarvel.x + 20 > this.x
        && captainMarvel.x - 20 < this.x + (this.size)
        && captainMarvel.y + 75 > this.y
        && captainMarvel.y - 75 < this.y + (this.size)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  boolean empoweredHit() {
    if (captainMarvel.isEmpowered() == true) {
      if (captainMarvel.x + 22.5 > this.x
        && captainMarvel.x - 22.5 < this.x + (this.size)
        && captainMarvel.y + 95 > this.y
        && captainMarvel.y - 95 < this.y + (this.size)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  boolean outOfBounds() {
    if (this.y < -size) {
      return true;
    } else {
      return false;
    }
  }
}
