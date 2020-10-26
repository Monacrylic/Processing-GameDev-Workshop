/*
A simple Brick Breaker game
Technotix Hardware Game Dev Workshop - Part 1

Author: Pulkit Vyas
Date: 21.10.2020
*/

void setup()
{
  // Everything here runs once
  size(600, 600);
  
  bricks = new Brick[numBricks];
  paddle = new Paddle();
  ball = new Ball(width / 2, paddleYCoord - ballRadius);
  
  int counter = 0;
  float x;
  float y = 30;
  
  // Arrange the bricks
  for(int row = 0; row < numRows; row++)
  {
    x = 10;
    for(int column = 0; column < numColumns; column++)
    {
      bricks[counter] = new Brick(x, y);
      counter++;
      x += brickWidth;
    }
    y += brickHeight;
  }
}

void draw()
{
  // Everything here runs forever
  
  if (!gameOver){
  background(0);
  ball.draw();
  paddle.draw();
  
  ball.update();
  paddle.update();
  
  for(Brick brick : bricks)
  {
    brick.draw();
    brick.collision();
  }
  
  textSize(20);
  text("Score: ", width / 2 - 30, 20);
  text(score, width / 2 + 30, 20);
  
  // Check if the ball is out of the play area and player has lost
  if(ball.getY() >= height)
  {
    textSize(26);
    textAlign(CENTER);
    text("Gameover", width / 2, height / 2);
    text("Final Score: ", width / 2 - 10, height / 2 + 30);
    text(score, width / 2 + 80, height / 2 + 30);
    gameOver=true;
    
  }
  
  }
}

void resetGame(){
  score=0;
  setup();
  draw();
}

void keyPressed(){
  if(gameOver){
    resetGame();
    gameOver=false;
  }
}
