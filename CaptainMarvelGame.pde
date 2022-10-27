//--------Variable declaration & initialization--------------------------------------------------------------------------------------------------------------//
int gameMode = 0;
int level = 1;
int levelsUnlocked = 1;
int level1BackgroundY = 0;
int level2BackgroundY = 0;
int levelScore = 0;
int level1HighestScore;
int level2HighestScore;
Boolean infiniteMode = false;
PImage level1Background;
PImage level2Background;
PImage mainScreen;
CaptainMarvel captainMarvel;
MenuButton level1Button;
MenuButton level2Button;
MenuButton infiniteModeButton;
MenuButton levelLockedButton;
ArrayList<LargeSpaceship> largeSpaceships = new ArrayList<LargeSpaceship>();
ArrayList<SmallSpaceship> smallSpaceships = new ArrayList<SmallSpaceship>();
ArrayList<LargeEnergyBlast> largeEnergyBlasts = new ArrayList<LargeEnergyBlast>();
ArrayList<SmallEnergyBlast> smallEnergyBlasts = new ArrayList<SmallEnergyBlast>();
ArrayList<LargeCrystal> largeCrystals = new ArrayList<LargeCrystal>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();

//--------Setup & Level Control--------------------------------------------------------------------------------------------------------------//
void setup() {
  size (800, 800);
  level1Background = loadImage ("images/Level_1_Background.jpg");
  level2Background = loadImage ("images/Level_2_Background.jpg");
  mainScreen = loadImage ("images/Main_Screen.png");
  captainMarvel = new CaptainMarvel(width/2, height/2, 0.025, 10);
}

public void mousePressed() {
  if (gameMode == 0 & level1Button.hover() == true) {
    gameMode = 1;
    level = 1;
  }
  if (gameMode == 0 & level2Button.hover() == true & levelsUnlocked >= 2) {
    gameMode = 1;
    level = 2;
  }
  if (gameMode == 3 | gameMode == 4) {
    gameMode = 0;
  }
  if (gameMode == 0 & infiniteModeButton.hover() == true & infiniteMode == false) {
    infiniteMode = true;
  } else if (gameMode == 0 & infiniteModeButton.hover() == true & infiniteMode == true) {
    infiniteMode = false;
  }
}

void draw() {
  switch (gameMode) {
  case 0:
    drawMainScreen();
    break;
  case 1:
    drawGameScreen();
    break;
  case 3:
    drawLevelPassedScreen();
    break;
  case 4:
    drawGameOverScreen();
    break;
  default:
    drawMainScreen();
  }
   
}

void reset() {
  frameCount = 0;
  captainMarvel = new CaptainMarvel(width/2, height/2, 0.025, 10);
  largeSpaceships = new ArrayList<LargeSpaceship>();
  smallSpaceships = new ArrayList<SmallSpaceship>();
  largeEnergyBlasts = new ArrayList<LargeEnergyBlast>();
  smallEnergyBlasts = new ArrayList<SmallEnergyBlast>();
  largeCrystals = new ArrayList<LargeCrystal>();
  explosions = new ArrayList<Explosion>();
  levelScore = 0;
}

//--------Drawing Levels & Screens---------------------------------------------------------------------------------------------------------------------//
void drawMainScreen() {
  imageMode (CORNER);
  mainScreen.resize (width, height);
  image (mainScreen, 0, 0);
  level1Button = new MenuButton(255, 0, 100, 100, 100, 50, 1);
  level1Button.update();
  level2Button = new MenuButton(255, 0, 210, 100, 100, 50, 2);
  levelLockedButton = new MenuButton(255, 60, 210, 100, 100, 50, -1);
  if (levelsUnlocked < 2) {
    levelLockedButton.update();
  }
  if (levelsUnlocked >= 2) {
    levelLockedButton = null;
    level2Button.update();
  }
  infiniteModeButton = new MenuButton(255, 0, 320, 100, 100, 50, -1);
  infiniteModeButton.updateInfinite();
}

void drawGameScreen() {
  if (level == 1) {
    drawLevel1Screen();
  }
  if (level == 2) {
    drawLevel2Screen();
  }
}

void drawLevelPassedScreen() {
  levelsUnlocked += 1;
  background (255);
  fill(0);
  textAlign(CENTER);
  textSize(40);
  text("LEVEL PASSED", width/2, height/2);
  textSize(20);
  text("CLICK TO CONTINUE", width/2, (height/2)+50);
  reset();
}

void drawGameOverScreen() {
  background (0);
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("GAMEOVER", width/2, height/2);
  textSize(20);
  text("CLICK TO RETURN TO MENU", width/2, (height/2)+50);
  reset();
}

void drawLevel1Screen() {
  drawLevel1Background();
  drawLevel1Objects();
}

void drawLevel1Background() {
  imageMode (CORNER);
  level1Background.resize (width, height);
  image (level1Background, 0, level1BackgroundY);
  image (level1Background, 0, level1BackgroundY + level1Background.height);
  level1BackgroundY -= 4;
  if (level1BackgroundY == -level1Background.height) {
    level1BackgroundY = 0;
  }
}

void drawLevel1Objects() {
  drawCaptainMarvel(1.5);
  drawLargeSpaceships(300, 4, 150, 50, 7);
  drawSmallSpaceships(50, 5, 100, 25, 3);
  drawLargeEnergyBlast(250, 7, 40, 128, 75, 5);
  drawSmallEnergyBlast(50, 9, 20, 64, 50, 1);
  drawLargeCrystal(250, 2, 50, 42, 50);
  drawExplosion();
  drawStatistics();
}

void drawLevel2Screen() {
  drawLevel2Background();
  drawLevel2Objects();
}

void drawLevel2Background() {
  imageMode (CORNER);
  level2Background.resize (width, height);
  image (level2Background, 0, level2BackgroundY);
  image (level2Background, 0, level2BackgroundY + level2Background.height);
  level2BackgroundY -= 4;
  if (level2BackgroundY == -level2Background.height) {
    level2BackgroundY = 0;
  }
}

void drawLevel2Objects() {
  drawCaptainMarvel(1.5);
  drawLargeSpaceships(250, 4, 150, 50, 7);
  drawSmallSpaceships(35, 6, 100, 25, 3);
  drawLargeEnergyBlast(200, 9, 40, 128, 75, 5);
  drawSmallEnergyBlast(30, 11, 20, 64, 50, 1);
  drawLargeCrystal(700, 4, 51, 42, 50);
  drawExplosion();
  drawStatistics();
}

void drawStatistics() {
  captainMarvel.statistics();
  if (infiniteMode == false) {
    if (level == 1 & levelScore > level1HighestScore) {
      level1HighestScore = levelScore;
    }
    if (level == 2 & levelScore > level2HighestScore) {
      level2HighestScore = levelScore;
    }
    if (captainMarvel.progress != 100) {
      captainMarvel.progress += 0.05;
    }
    if (captainMarvel.progress >= 100) {
      gameMode = 3;
    }
  } else {
    if (level == 1 & levelScore > level1HighestScore) {
      level1HighestScore = levelScore;
    }
    if (level == 2 & levelScore > level2HighestScore) {
      level2HighestScore = levelScore;
    }
  }
}

//--------Drawing Individual Objects---------------------------------------------------------------------------------------------------------//
void drawCaptainMarvel(float energyLoss) {
  if (captainMarvel.isEmpowered() == false) {
    captainMarvel.standard();
  } else {
    captainMarvel.empowered();
    captainMarvel.energy -= energyLoss;
  }
  if (captainMarvel.energy < 0) {
    captainMarvel.energy = 0;
  }
  if (captainMarvel.health <= 0) {
    gameMode = 4;
    reset();
  }
}

void drawLargeSpaceships(int spawnRate, int speed, int size, int collisionDamage, int score) {
  if (frameCount % spawnRate == 0) {
    largeSpaceships.add(new LargeSpaceship(random(0, width-(size)), height+(size), random(speed, speed+2), size));
  }
  for (int i = 0; i < largeSpaceships.size(); i++) {
    LargeSpaceship LS = (LargeSpaceship) largeSpaceships.get(i);
    LS.update();
    if (LS.hit() == true) {
      explosions.add(new Explosion(LS.x, LS.y, LS.speed, LS.size, LS.size));
      largeSpaceships.remove(i);
      i--;
      captainMarvel.health -= collisionDamage;
    }
    if (LS.empoweredHit() == true) {
      explosions.add(new Explosion(LS.x, LS.y, LS.speed, LS.size, LS.size));
      largeSpaceships.remove(i);
      i--;
      levelScore += score;
    }
    if (LS.outOfBounds() == true) {
      largeSpaceships.remove(i);
      i--;
    }
  }
}

void drawSmallSpaceships(int spawnRate, int speed, int size, int collisionDamage, int score) {
  if (frameCount % spawnRate==0) {
    smallSpaceships.add(new SmallSpaceship(random(0, width-(size)), height+(size), random(speed, speed+2), size));
  }
  for (int i = 0; i < smallSpaceships.size(); i++) {
    SmallSpaceship SS = (SmallSpaceship) smallSpaceships.get(i);
    SS.update();
    if (SS.hit() == true) {
      explosions.add(new Explosion(SS.x, SS.y, SS.speed, SS.size, SS.size));
      smallSpaceships.remove(i);
      i--;
      captainMarvel.health -= collisionDamage;
    }
    if (SS.empoweredHit() == true) {
      explosions.add(new Explosion(SS.x, SS.y, SS.speed, SS.size, SS.size));
      smallSpaceships.remove(i);
      i--;
      levelScore += score;
    }
    if (SS.outOfBounds() == true) {
      smallSpaceships.remove(i);
      i--;
    }
  }
}

void drawLargeEnergyBlast(int spawnRate, int speed, int sizeWidth, int sizeHeight, int collisionDamage, int score) {
  if (frameCount % spawnRate == 0) {
    largeEnergyBlasts.add(new LargeEnergyBlast(random(0, width-(sizeWidth)), height+(sizeHeight), random(speed, speed+2), sizeWidth, sizeHeight));
  }
  for (int i = 0; i < largeEnergyBlasts.size(); i++) {
    LargeEnergyBlast LEB = (LargeEnergyBlast) largeEnergyBlasts.get(i);
    LEB.update();
    if (LEB.hit() == true) {
      largeEnergyBlasts.remove(i);
      i--;
      captainMarvel.health -= collisionDamage;
    }
    if (LEB.empoweredHit() == true) {
      largeEnergyBlasts.remove(i);
      i--;
      levelScore += score;
    }
    if (LEB.outOfBounds() == true) {
      largeEnergyBlasts.remove(i);
      i--;
    }
  }
}

void drawSmallEnergyBlast(int spawnRate, int speed, int sizeWidth, int sizeHeight, int collisionDamage, int score) {
  if (frameCount % spawnRate == 0) {
    smallEnergyBlasts.add(new SmallEnergyBlast(random(0, width-(sizeWidth)), height+(sizeHeight), random(speed, speed+2), sizeWidth, sizeHeight));
  }
  for (int i = 0; i < smallEnergyBlasts.size(); i++) {
    SmallEnergyBlast SEB = (SmallEnergyBlast) smallEnergyBlasts.get(i);
    SEB.update();
    if (SEB.hit() == true) {
      smallEnergyBlasts.remove(i);
      i--;
      captainMarvel.health -= collisionDamage;
    }
    if (SEB.empoweredHit() == true) {
      smallEnergyBlasts.remove(i);
      i--;
      levelScore += score;
    }
    if (SEB.outOfBounds() == true) {
      smallEnergyBlasts.remove(i);
      i--;
    }
  }
}

void drawLargeCrystal(int spawnRate, int speed, int sizeWidth, int sizeHeight, int energyGained) {
  if (frameCount % spawnRate == 0) {
    largeCrystals.add(new LargeCrystal(random(0, width-(sizeWidth)), height+(sizeHeight), random(speed, speed+2), sizeWidth, sizeHeight));
  }
  for (int i = 0; i < largeCrystals.size(); i++) {
    LargeCrystal LC = (LargeCrystal) largeCrystals.get(i);
    LC.update();
    if (LC.hit() == true) {
      largeCrystals.remove(i);
      i--;
      if (captainMarvel.energy < 100) {
        captainMarvel.energy += energyGained;
      }
      if (captainMarvel.energy > 100) {
        captainMarvel.energy = 100;
      }
    }
    if (LC.outOfBounds() == true) {
      largeCrystals.remove(i);
      i--;
    }
  }
}

void drawExplosion() {
  for (int i = 0; i < explosions.size(); i++) {
    Explosion XP = (Explosion) explosions.get(i);
    XP.update();
    if (XP.outOfBounds() == true) {
      explosions.remove(i);
      i--;
    }
  }
}
