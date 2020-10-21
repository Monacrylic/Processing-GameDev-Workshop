class Ball
{
  float ballX, ballY;
  float velX, velY;
  
  Ball(float x, float y)
  {
    ballX = x;
    ballY = y;
    
    velX = ballSpeed;
    velY = - ballSpeed;
  }
  
  void draw()
  {
    // Set color of the ball
    fill(255);
    // Drawing the ball
    ellipse(ballX, ballY, ballRadius * 2, ballRadius * 2);
  }
  
  void update()
  {
    // set ball's position with its velocity
    ballX += velX;
    ballY += velY;
    
    // Check if the ball touches a corner, then make it bounce according to the
    // position of the corner
    if(ballX < ballRadius)
      bounceRight();
      
    else if(ballX > width - ballRadius)
      bounceLeft();
      
    else if(ballY < ballRadius)
      bounceDown();
      
    else if(ballY > paddleYCoord - ballRadius &&
       ballX > paddle.getX() - ballRadius &&
       ballX < paddle.getX() + paddleWidth + ballRadius)
      bounceUp();
  }
  
  // Functions to set the direction of ball when it bounces
  
  void bounceLeft()
  {
    velX = -abs(velX);
  }
  
  void bounceRight()
  {
    velX = abs(velX);
  }
  
  void bounceUp()
  {
    velY = - abs(velY);
  }
  
  void bounceDown()
  {
    velY = abs(velY);
  }
  
  // Gettter functions for position
  
  float getX()
  {
    return ballX;
  }
  
  float getY()
  {
    return ballY;
  }
}
