
/*
A very-crappy rocket game where you have to control the rocket while avoiding the obstacles!
Technotix Hardware Game Dev Workshop - Part 1

Author: Raghav Vashisht
Date: 25.10.2020
*/

void setup(){
  fullScreen();
  // Initialize Handy.
  handy = new HandyRenderer(this);
  // Create new obstacle objects
  setupObstacles();
  refresh();
  obstacle();
  alive = true;
  score = 0;
}

void draw(){
  if (alive){
    refresh();
    obstacle();
    collisionCheck();
  }else{
   restartScreen();
  }
  scoreCheck();
}

void keyPressed() {
  if(keyCode == LEFT) {
    velocity = -3.5;
  } else if (keyCode == RIGHT) {
     velocity = 3.5; 
  }
}

void keyReleased() {
   velocity = 0; 
}

void obstacle(){
  //print(obstacleY);
  for(int i=0;i<obstacles.length;i++) {
    if(obstacles[i].y >= height) {
        obstacles[i].leftVal = random(300,width-500);
        obstacles[i].rightVal = obstacles[i].leftVal+125;
        obstacles[i].y = 0;
    }
  }
}

// Below are the helper functions

void refresh(){
  if (alive==true) {
    
    // Move rocket
    ballX += velocity;
    
    // White
    background(255,255,255);
    
    // Draw rocket
    fill(255,100,0);
    rect(ballX,height-100,50,50);
    
    // Redraw Obstacles
    for(Obstacle obstacle : obstacles) {
      obstacle.drawObstacle();
      // Move obstacles down by 3 px everytime they are redrawn
      obstacle.y += 3;
    }
  }
}

void setupObstacles() {
  float leftValue = random(300,width-500);
  obstacles[0] = new Obstacle(leftValue, leftValue+125, 0, 75);
  leftValue = random(300,width-500);
  obstacles[1] = new Obstacle(leftValue, leftValue+125, -distanceBWobstacle, 75);
}

void collisionCheck(){
  for(int i=0;i<obstacles.length;i++) {
    if((obstacles[i].y+75>height-100)&&(obstacles[i].y<height-150)) {
      if((ballX < obstacles[i].leftVal) || (ballX+50 > obstacles[i].rightVal)) {
        alive=false;
      }
    }
  }
}

void restartScreen(){
  textSize(50);
  fill(255,0,0);
  text("You died",130,200);
  fill(100);
  rect(130,250,200,100);
  fill(0);
  text("Restart",150,320);
}

void mouseClicked(){
  if (alive==false){
    if((mouseY>250)&(mouseY<350)&(mouseX>130)&(mouseX<330)){
      setup();
    }
  }
}

void scoreCheck(){
  for(int i=0;i<obstacles.length;i++) {
      if(obstacles[i].y >= height-4) {
        score++;
      }
  }
  fill(255,0,0);
  textSize(40);
  text(score,450,50);
}
