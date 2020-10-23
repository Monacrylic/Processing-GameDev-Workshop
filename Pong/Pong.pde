
// Pong created by Aditya kr. Gupta E19CSE328
// skeleton code from Instructables.com
// Added background colour and a basic design
// Added different sounds for  different types of collision.
// optimized the paddle movement.




import ddf.minim.*;

Minim minim;   // libraray used to play sound
AudioSnippet hit;
AudioSnippet miss;
AudioSnippet wallHit;



Ball ball; //ball object

Paddle paddleLeft;
Paddle paddleRight;

int paddleTouch = 0;
int scoreLeft = 0;
int scoreRight = 0;

void setup(){
  fullScreen();
  ball = new Ball(width/2, height/2, 50); //new ball at centre
  ball.speedX = 5; // Giving the ball speed in x-axis
  ball.speedY = random(-3,3); // random speed in y direction as to make the ball move an an angle
  
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30,200);
  
  minim = new Minim(this);
  hit = minim.loadSnippet("sounds/hit.wav");
  miss = minim.loadSnippet("sounds/miss.wav");
  wallHit = minim.loadSnippet("sounds/wallHit.wav");

}

void draw(){
  
  background(124,210,0); //clear canvas
  
// setting up the background with a line and a circle in middle
  
  fill(124,210,0);  //bg color
  strokeWeight(4);  // border radius
  circle(width/2,height/2,400);
  stroke(126);
  line(width/2, 0, width/2,height);
  stroke(126);
  fill(255);
  circle(width/2,height/2,10);
  
  
  
  
  fill(255);
  ball.display(); // Draw the ball to the window
  ball.move(); //calculate a new location for the ball
  ball.display(); // Draw the ball on the window
  
  
  
  // drawing the paddles
  
  
  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();
  
  
  
  // checking if the ball miss the paddle 

  
  if (ball.right() > width) {
    miss.rewind();
    miss.play();
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
    paddleTouch = 0;
  }
  
  
  if (ball.left() < 0) {
    miss.rewind();
    miss.play();
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
    paddleTouch = 0;
  }
  
  
  
  //if ball hit the wall the do this 
  

  if (ball.bottom() > height) { //for bottom ball
    ball.speedY = -ball.speedY;
    wallHit.rewind();
    wallHit.play();
  }

  if (ball.top() < 0) { //for top vall
    ball.speedY = -ball.speedY;
    wallHit.rewind();
    wallHit.play();
  }
  
  
  
  
  // checking if paddle goes out of screen the redrawing it again at the end of the screen
  
  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  
  
  // condition if ball hit the paddle, basically checking and comparing the x and y coordinates of the ball , if it is in range of paddle or not !!
  


// for right paddle 
  if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
    paddleTouch+=1;
    hit.rewind();
    hit.play();
    
  }
  
  
// for left paddle

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY =  map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
    paddleTouch+=1;
    hit.rewind();
    hit.play();
  }
  
  
  
 // displaying the score 
   
  
  textSize(40);
  textAlign(CENTER);
  text(scoreRight, width/2+30, 30); // Right side score
  text(scoreLeft, width/2-30, 30); // Left side score
}




// controlling the paddle


// this is for Right paddle

void keyPressed(){
  if(keyCode == UP){
    paddleRight.speedY=-5;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=5;
  }
  if(key == 'w' || key =='W'){
    paddleLeft.speedY=-5;
  }
  if(key == 's' || key =='S'){
    paddleLeft.speedY=5;
  }
}


// this is for Left paddle

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'w' || key =='W'){
    paddleLeft.speedY=0;
  }
  if(key == 's' || key == 'D'){
    paddleLeft.speedY=0;
  }
}
