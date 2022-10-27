class SmallEnergyBlast extends LargeEnergyBlast {
  SmallEnergyBlast (float x, float y, float speed, int sizeWidth, int sizeHeight) {
    super (x, y, speed, sizeWidth, sizeHeight);
    largeEnergyBlastImage.resize (sizeWidth, sizeHeight);
  }
}
