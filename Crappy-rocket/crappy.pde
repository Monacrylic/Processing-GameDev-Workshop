float ballX = 0;
float gravity = .2;
float velocity = 0;
float distanceBWobstacle = 500;

// 1st Obstacle
float leftValue1 = random(300,width-500);
float rightValue1 = leftValue1+125;
float obstacleY1 = distanceBWobstacle;

// 2nd Obstacle
float leftValue2 = random(300,width-500);
float rightValue2 = leftValue2+125;
float obstacleY2 = 0;

boolean alive = true;
int score = 0;

// When velocity is +ve, ball goes down

void setup(){
  fullScreen();
  refresh();
  obstacle();
  ballX = width/2;
  gravity = 0;
  velocity = 0;
  distanceBWobstacle = 500;
  leftValue1 = random(300,width-500);
  rightValue1 = leftValue1+125;
  obstacleY1 = 0;
  
  leftValue2 = random(300,width-500);
  rightValue2 = leftValue2+125;
  obstacleY2 = -distanceBWobstacle;
  
  alive = true;
  score = 0;
}

void refresh(){
  //if(ballY > 450){
  //  alive = false;
  //}
  //print(height);
  if (alive==true){
    velocity = velocity + gravity;
    ballX += velocity;
    background(0,100,255);
    fill(255,100,0);
    rect(ballX,height-100,50,50);
    //fill(0,150,0);
    //rect(0,480,500,20);
    fill(0);
    rect(0,obstacleY1,leftValue1,75);
    rect(rightValue1,obstacleY1,width,75);
    obstacleY1 += 3;
    
    fill(0);
    rect(0,obstacleY2,leftValue2,75);
    rect(rightValue2,obstacleY2,width,75);
    obstacleY2 += 3;
    
  }
}

void keyPressed() {
  if(keyCode == LEFT) {
    velocity = -3.5;
  } else if (keyCode == RIGHT) {
     velocity = 3.5; 
  }
  
  //if(keyCode == LEFT) {
      
    //  if (velocity > 0) {
    //     velocity -= 2.6; 
    //  } else if (velocity <= 0 && velocity >= -4.5) {
    //     velocity -= 0.5; 
    //  }
    //} else if (keyCode == RIGHT) {
    //  if (velocity < 0) {
    //     velocity += 2.6; 
    //  } else if (velocity >= 0 && velocity <= 4.5) {
    //     velocity += 0.5; 
    //  }
    //}
}

void keyReleased() {
   velocity = 0; 
}

void obstacle(){
  //print(obstacleY);
  if(obstacleY1 >= height){
    leftValue1 = random(300,width-500);
    rightValue1 = leftValue1+125;
    obstacleY1 = 0;
  }
  if(obstacleY2 >= height){
    leftValue2 = random(300,width-500);
    rightValue2 = leftValue2+125;
    obstacleY2 = 0;
  }
}

void collisionCheck(){
  if((obstacleY1+75>height-100)&&(obstacleY1<height-150)) {
      if((ballX < leftValue1) || (ballX+50 > rightValue1)) {
         alive=false; 
      }
  }
  if((obstacleY2+75>height-100)&&(obstacleY2<height-150)) {
      if((ballX < leftValue2) || (ballX+50 > rightValue2)) {
         alive=false; 
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
  if(obstacleY1 >= height){
    score++;
  }
  if(obstacleY2 >= height){
    score++;
  }
  fill(255,0,0);
  textSize(40);
  text(score,450,50);
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
