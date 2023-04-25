class Obstacle {
  int x, y, w, h;
  int speed = 20;
  int lastSpeedIncrease = 0; // stores the last time the speed was increased
  PImage obstacleImage;
  PImage[] obstacleImageOptions = { loadImage("obstacle1.png"), loadImage("obstacle2.png"), loadImage("obstacle3.png") };
  
  Obstacle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    obstacleImage = obstacleImageOptions[(int) random(obstacleImageOptions.length)];
  }
  
  void move() {
    y -= speed;
    if (y + h < 0) {
      reset();
    }
  }
  
  void reset() {
    x = (int) random(width);
    y = (int) random(height, height + 500);
    w = (int) random(100, 100);
    h = (int) random(100, 100);
    obstacleImage = obstacleImageOptions[(int) random(obstacleImageOptions.length)];
  }
  
  void render() {
    image(obstacleImage, x, y, w, h);
  }
  
  boolean checkCollision(Baby b) {
    if (x + w < b.x || x > b.x + b.w || y + h < b.y || y > b.y + b.h) {
      return false;
    } else {
      // Check for overlapping pixels between obstacleImage and Baby's sprite
      int overlapLeft = max(x, b.x);
      int overlapRight = min(x + w, b.x + b.w);
      int overlapTop = max(y, b.y);
      int overlapBottom = min(y + h, b.y + b.h);

      for (int i = overlapLeft; i < overlapRight; i++) {
        for (int j = overlapTop; j < overlapBottom; j++) {
          int obstaclePixelColor = obstacleImage.get(i - x, j - y);
          int babyPixelColor = b.sprite.get(i - b.x, j - b.y);
          if (alpha(obstaclePixelColor) != 0 && alpha(babyPixelColor) != 0) {
            // Collision detected
            return true;
          }
        }
      }

      // No collision detected
      return false;
    }
  }

  void updateSpeed() {
    int currentTime = millis();
    if (currentTime - lastSpeedIncrease >= 3000 && speed < 45) { // increase speed every 10 seconds
      speed += 5;
      lastSpeedIncrease = currentTime;
    }
  }
}
