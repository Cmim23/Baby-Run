class Baby {
  int x, y, w, h;
  boolean isMovingLeft, isMovingRight;
  int speed = 30;
  PImage sprite;
  PImage[] spriteOptions = { loadImage("baby1.png"), loadImage("baby2.png") };
  int currentSpriteIndex = 0;
  int spriteChangeDelay = 10;
  int spriteChangeCounter = 0;

  Baby(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    sprite = spriteOptions[currentSpriteIndex];
  }

void move() {
    if ( isMovingLeft == true) {
      x -= speed; // or x = x - speed;
    }

    if (isMovingRight ==true) {
      x += speed;
    }
    // Keep Baby within the screen bounds
    x = constrain(x, 0, width - w);
    y = constrain(y, 0, height - h);
  }

  void updateSprite() {
    if (spriteChangeCounter == spriteChangeDelay) {
      spriteChangeCounter = 0;
      currentSpriteIndex = (currentSpriteIndex + 1) % spriteOptions.length;
      sprite = spriteOptions[currentSpriteIndex];
    } else {
      spriteChangeCounter++;
    }
  }

  void render() {
    image(sprite, x, y, w, h);
  }


void reset() {
    // Reset baby position
    x = width / 2;
    y = height/4;

    // Reset baby movement
    isMovingLeft = false;
    isMovingRight = false;

    // Reset sprite animation
    currentSpriteIndex = 0;
    spriteChangeCounter = 0;
    sprite = spriteOptions[currentSpriteIndex];
  }
}
