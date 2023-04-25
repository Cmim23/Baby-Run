import processing.sound.*;

SoundFile bgSound;
float volume = 0.1;
PImage backgroundImage;

//declaring my vars
Baby b1;

Obstacle[] obstacles = new Obstacle[10];  // Array to hold multiple obstacles
Scoreboard scoreboard;
StartScreen startScreen;
boolean gameStarted = false;
boolean gameOver = false;
int numPlays = 0;                   // Number of times the game has been played
int maxPlays = 3;                   // Maximum number of times the game can be played

void setup() {
  size(1600, 900);

  //intialize my vars
  backgroundImage = loadImage("babyBack.png");
  bgSound = new SoundFile(this, "bg.wav");
  bgSound.loop();
  bgSound.amp(volume);

  b1 = new Baby(width/2, height/4, 150, 150);

  startScreen = new StartScreen();
scoreboard = new Scoreboard();
  resetObstacles();                 // Generate initial obstacle positions
}



void restartGame() {
  // Reset all game variables to their initial values
  gameStarted = false;
  gameOver = false;
  b1.reset();
  resetObstacles(); // call the function to reset obstacle positions
 
  // Start playing background music again
  bgSound.loop();
}

void draw() {
  // Handle input on the start screen
  int buttonClicked = startScreen.handleInput();
  if (buttonClicked >= 0) {
    switch (buttonClicked) {
      case 0:
        // Start game button clicked
        gameStarted = true; // call restartGame instead of setting gameStarted to true
         scoreboard.startGame();
         
        break;
      case 1:
        // Controls button clicked
        gameStarted = false;
       Control controlScreen = new Control();
       background(0,0,255);
controlScreen.display();

        break;
      case 2:
        // Exit button clicked
        exit();
        break;
    }
  } else {
    // Draw the start screen
    startScreen.display();
  }

  if (gameStarted) {
    // Reverse the direction of the background and obstacles
    image(backgroundImage, 0, 0, width, height);
    for (Obstacle obstacle : obstacles) {
      obstacle.updateSpeed();
      obstacle.move();  // move obstacle upward
      obstacle.render();
      if (obstacle.checkCollision(b1)) {
        gameOver = true;
      }
    }

    // Move and render the baby
    b1.move();
    b1.render();
    b1.updateSprite();
    scoreboard.incrementScore();
 scoreboard.display();
    // Draw the game over screen if the game is over
    if (gameOver) {
      scoreboard.endGame();
      scoreboard.resetScore();
      drawGameOverScreen();
      if (keyPressed && key == 'r') { // restart the game
        restartGame();
      }
    }
  }
}
void resetObstacles() {
   // Randomly generate obstacle positions and initialize obstacles
  for (int i = 0; i < obstacles.length; i++) {
    int x = (int) random(width);   // Random x position
    int y = (int) random(1700, 2000);   // Random y position (below the screen)
    int w = (int) (100);   // Random width
    int h = (int) (100);   // Random height
    obstacles[i] = new Obstacle(x, y, w, h);
  }
}






void keyPressed() {
  // Collision detection
  for (Obstacle obstacle : obstacles) {
    if (obstacle.checkCollision(b1)) {
      gameStarted = false;
      gameOver = true;
      break;
    }
  }

  if (gameStarted) {
    if (key == 'a') {
      b1.isMovingLeft = true;
    }
    if (key == 'd') {
      b1.isMovingRight = true;
    }
  }
}


void keyReleased() {
  if (gameStarted) {
    if (key == 'a') {
      b1.isMovingLeft = false;
    }
    if (key == 'd') {
      b1.isMovingRight = false;
    }
  }
}
