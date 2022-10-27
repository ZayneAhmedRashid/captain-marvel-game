class CaptainMarvel {
  float x;
  float y;
  float speed;
  float speedEmpowered;
  float health = 100;
  float energy = 100;
  float progress = 0;
  int currentFrame = 0;
  int previousFrame = 0;
  final int timeFrame = 150;
  PImage[] standardImage = new PImage[2];
  PImage empoweredImage = loadImage ("images/Captain_Marvel_Empowered.png");

  CaptainMarvel (float x, float y, float speed, float speedEmpowered) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.speedEmpowered = speedEmpowered;
    for (int i = 0; i < standardImage.length; i++) {
      standardImage[i] = loadImage ("images/Captain_Marvel"+i+".png");
      standardImage[i].resize(40, 150);
    }
  }

  void statistics() {
    textAlign(CENTER);
    textSize(15);

    fill(0);
    rect(25, 0, width-50, 20);
    fill(#800000);
    rect(25, 0, 250, 20);
    fill(#000080);
    rect(275, 0, 250, 20);
    fill(#008000);
    rect(525, 0, 250, 20);

    fill(255, 0, 0);
    rect(25, 0, map(health, 0, 100, 0, 250), 20);
    fill(255);
    text("HEALTH  " + health + "%", 150, 15);

    fill(0, 0, 255);
    rect(275, 0, map(energy, 0, 100, 0, 250), 20);
    fill(255);
    text("ENERGY  " + energy + "%", 400, 15);

    if (infiniteMode == false) {
      fill(0, 255, 0);
      rect(525, 0, map(progress, 0, 100, 0, 250), 20);
      fill(255);
      text("PROGRESS " + int(progress) + "%", 650, 15);
    } else {
      fill(0, 255, 0);
      rect(525, 0, 250, 20);
      fill(255);
      text("INFINITE MODE", 650, 15);
    }
    fill(0);
    if (level == 1) {
      text("LVL 1 HIGHEST SCORE: " + level1HighestScore, width/2, 40);
    }
    if (level == 2) {
      text("LVL 2 HIGHEST SCORE: " + level2HighestScore, width/2, 40);
    }
    text("SCORE: " + levelScore, width/2, 60);
  }

  void standard() {
    imageMode (CENTER);
    if (millis() > previousFrame + timeFrame) {
      currentFrame++;
      if (currentFrame > 1) {
        currentFrame = 0;
      }
      previousFrame = millis();
    }
    image (standardImage[currentFrame], x, y);
    float targetX = mouseX;
    float dx = targetX - x;
    float targetY = mouseY;
    float dy = targetY - y;
    x += dx * speed;
    y += dy * speed;
    if (x > width - standardImage[currentFrame].width/2) {
      x = width - standardImage[currentFrame].width/2;
    }
    if (x < standardImage[currentFrame].width/2) {
      x = standardImage[currentFrame].width/2;
    }
    if (y > height - standardImage[currentFrame].height/2) {
      y = height - standardImage[currentFrame].height/2;
    }
    if (y < standardImage[currentFrame].height/2) {
      y = standardImage[currentFrame].height/2;
    }
  }

  void empowered() {
    imageMode (CENTER);
    empoweredImage.resize (45, 190);
    image (empoweredImage, x, y);
    y += speedEmpowered;
    if (x > width - empoweredImage.width/2) {
      x = width - empoweredImage.width/2;
    }
    if (x < empoweredImage.width/2) {
      x = empoweredImage.width/2;
    }
    if (y > height - empoweredImage.height/2) {
      y = height - empoweredImage.height/2;
    }
    if (y < empoweredImage.height/2) {
      y = empoweredImage.height/2;
    }
  }

  boolean isEmpowered() {
    if (energy > 0 && keyPressed == true) {
      return true;
    } else {
      return false;
    }
  }
}
