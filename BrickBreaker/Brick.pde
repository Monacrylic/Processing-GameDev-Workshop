class Brick
{
  float brickX, brickY;
  color brickColor;
  
  boolean isHit;
  
  Brick(float x, float y)
  {
    brickX = x;
    brickY = y;
    brickColor = color(random(255), random(255), random(255));
    isHit = false;
  }
  
  void draw()
  {
    // Draw the bricks on screen
    if(!isHit)
    {
      fill(brickColor);
      rect(brickX, brickY, brickWidth, brickHeight);
    }
  }
  
  void collision()
  {
    // Check if the ball has collided with a brick, set the flag, increase the score
    // and bounce the ball according to the collision
    
    if(isHit)
      return;
    
    else if(abs(ball.getY() - (brickY - ballRadius)) < 3 &&
       ball.getX() > brickX - ballRadius &&
       ball.getX() < brickX + brickWidth + ballRadius)
    {
      isHit = true;
      score += 5;
      ball.bounceUp();
    }
    
    else if(abs(ball.getY() - (brickY + brickHeight + ballRadius)) < 3 &&
       ball.getX() > brickX - ballRadius &&
       ball.getX() < brickX + brickWidth + ballRadius)
    {
      isHit = true;
      score += 5;
      ball.bounceDown();
    }
    
    else if(abs(ball.getX() - (brickY - ballRadius)) < 3 &&
       ball.getY() > brickY - ballRadius &&
       ball.getY() < brickY + brickHeight + ballRadius)
    {
      isHit = true;
      score += 5;
      ball.bounceLeft();
    }
       
    else if(abs(ball.getX() - (brickX + brickWidth + ballRadius)) < 3 &&
       ball.getY() > brickY - ballRadius &&
       ball.getY() < brickY + brickHeight + ballRadius)
    {
      isHit = true;
      score += 5;
      ball.bounceRight();
    }
  }
}
