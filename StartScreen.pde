class StartScreen {
  int buttonWidth = 300;
  int buttonHeight = 100;
  int buttonSpacing = 35;
  color buttonColor = color(200);
  color buttonHoverColor = color(150);
  color buttonTextColor = color(0);
  ArrayList<Button> buttons;
  
  StartScreen() {
    buttons = new ArrayList<Button>();
    int totalButtonHeight = buttons.size() * buttonHeight;
    int totalSpacing = (buttons.size() - 1) * buttonSpacing;
    int startY = (height - totalButtonHeight - totalSpacing) / 2;
    buttons.add(new Button("Start Game", width/2, startY, buttonColor));
    buttons.add(new Button("Controls(PRESS AND HOLD)", width/2, startY + buttonHeight + buttonSpacing, buttonColor));
    buttons.add(new Button("Exit", width/2, startY + 2 * (buttonHeight + buttonSpacing), buttonColor));
  }
  
 void display() {
background(72);
  textSize(100);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Welcome to Baby Run", width/2, height/4);
  
  // Display the buttons
  textSize(50);
  for (Button button : buttons) {
    button.display();
  }
}
  
  int handleInput() {
    for (int i = 0; i < buttons.size(); i++) {
      Button button = buttons.get(i);
      if (button.isMouseOver()) {
        button.setColor(buttonHoverColor);
        if (mousePressed) {
          println("Button " + i + " clicked");
          return i; // Return the index of the clicked button
        }
      } else {
        button.setColor(buttonColor);
      }
    }
    return -1; // No button clicked
  }
  
  class Button {
    String label;
    int x, y;
    color buttonColor;
    
    Button(String label, int x, int y, color buttonColor) {
      this.label = label;
      this.x = x;
      this.y = y;
      this.buttonColor = buttonColor;
    }
    
    void display() {
      fill(buttonColor);
      stroke(0);
      strokeWeight(2);
      ellipseMode(CENTER);
      ellipse(x, y, buttonWidth, buttonHeight);
      textAlign(CENTER, CENTER);
      textSize(24);
      fill(buttonTextColor);
      text(label, x, y);
    }
    
    boolean isMouseOver() {
      float d = dist(mouseX, mouseY, x, y);
      return (d < buttonWidth/2 && d < buttonHeight/2); // should be d < buttonHeight/2
    }
    
    void setColor(color buttonColor) {
      this.buttonColor = buttonColor;
    }
  }
}
