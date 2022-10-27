class LargeEnergyBlast {
  float x;
  float y;
  float speed;
  int sizeWidth;
  int sizeHeight;
  PImage largeEnergyBlastImage = loadImage ("images/Energy_Blast.png");

  LargeEnergyBlast (float x, float y, float speed, int sizeWidth, int sizeHeight) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.sizeWidth = sizeWidth;
    this.sizeHeight = sizeHeight;
  }

  void update() {
    imageMode (CORNER);
    y -= speed;
    largeEnergyBlastImage.resize (sizeWidth, sizeHeight);
    image (largeEnergyBlastImage, x, y);
  }

  boolean hit() {
    if (captainMarvel.isEmpowered() == false) {
      if (captainMarvel.x + 20 > this.x
        && captainMarvel.x - 20 < this.x + (this.sizeWidth)
        && captainMarvel.y + 75 > this.y
        && captainMarvel.y - 75 < this.y + (this.sizeHeight)) {
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
        && captainMarvel.x - 22.5 < this.x + (this.sizeWidth)
        && captainMarvel.y + 95 > this.y
        && captainMarvel.y - 95 < this.y + (this.sizeHeight)) {
        return true;
      } else {
        return false;
      }
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
