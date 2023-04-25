// Draw the game over screen
void drawGameOverScreen() {
  // Stop playing sounds when game is over
  bgSound.stop();
  

  // Draw the game over screen
  background(255, 0, 0);
  textAlign(CENTER);
  textSize(50);
  text("You Died", width/2, height/2 - 50);
  textSize(30);
  text("Press 'R' to restart", width/2, height/2 + 50);

  // Restart the game when the 'R' key is pressed
  if (key == 'r' || key == 'R') {
    restartGame();
  }
}
