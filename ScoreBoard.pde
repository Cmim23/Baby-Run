class Scoreboard {
  int highScore;
  int startTime;
  int score;

  Scoreboard() {
    // Load the high score from a file or database, if available
    highScore = 0;
    startTime = 0;
    score = 0;
  }

  void startGame() {
    // Store the current time as the start time
    startTime = millis();
  }

  void endGame() {
    // Check if the current score is higher than the high score
    if (score > highScore) {
      highScore = score;
      // Save the new high score to a file or database
    }
  }
 void resetScore() {
    // Reset the score to zero
    score = 0;
  }
  void incrementScore() {
    // Increment the score every second
    if (millis() - startTime >= 1000) {
      score++;
      startTime = millis();
    }
  }

  void display() {
    // Display the high score and current score
    textSize(20);
    fill(255);
    textAlign(RIGHT, TOP);
    text("High Score: " + highScore, width - 10, 10);
    textAlign(LEFT, TOP);
    text("Score: " + score, 10, 10);
  }
}
