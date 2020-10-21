// Instances of bricks, paddle and ball
Brick bricks[];
Paddle paddle;
Ball ball;

// Set the number and dimensions of the bricks
int numRows = 5;
int numColumns = 10;
int numBricks = numRows * numColumns;
int brickWidth = 58;
int brickHeight = 20;

// Set the speed, position and dimensions of the paddle
int paddleSpeed = 5;
int paddleYCoord = 580;
int paddleWidth = 50;
int paddleHeight = 10;

// Set the speed and size of the ball
int ballSpeed = 4;
int ballRadius = 5;

// Set initial score to zero
int score = 0;
