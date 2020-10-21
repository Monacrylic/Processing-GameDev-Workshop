class Paddle
{
  float paddleX;
  
  Paddle()
  {
    paddleX = width / 2 - paddleWidth / 2;
  }
  
  void draw()
  {
    // Set color of the paddle and draw on screen
    fill(255);
    rect(paddleX, paddleYCoord, paddleWidth, paddleHeight);
  }
  
  void update()
  {
    // Check if any key is pressed and change position of the paddle according to
    // the key
    if(keyPressed && keyCode == RIGHT)
      paddleX += paddleSpeed;
    
    if(keyPressed && keyCode == LEFT)
      paddleX -= paddleSpeed;
    
    // Constrain the paddle to the width of the window
    paddleX = constrain(paddleX, 0, width - paddleWidth);
  }

  // Getter function for X coordinate of the paddle
  float getX()
  {
    return paddleX;
  }
}  
