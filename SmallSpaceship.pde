class SmallSpaceship extends LargeSpaceship {
  SmallSpaceship (float x, float y, float speed, int size) {
    super (x, y, speed, size);
    for (int i = 0; i < spaceship.length; i++) {
      spaceship[i].resize(size, size);
    };
  }
}
