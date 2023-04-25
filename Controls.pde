class Control {
  void display() {
    textSize(100);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Controls:", width/2, height/4);
    textSize(50);
    textAlign(LEFT, CENTER);
    text("Press 'a' to move left.", width/4, height/2);
    text("Press 'd' to move right.", width/4, height/2 + 60);
    text("Avoid the obstacles to stay alive!", width/4, height/2 + 120);
  }
}
