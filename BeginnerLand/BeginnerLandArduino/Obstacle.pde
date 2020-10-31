/*
        |----------Left obstacle----> GapWidth <--------Right obstacle---------|

*/


class Obstacle{
  float y, gapWidth, leftObstacleWidth;
  float leftObstacleX, rightObstacleX;
  
  Obstacle(float y, float gapWidth){
    this.y= y;
    this.gapWidth= gapWidth;
    this.leftObstacleWidth= random(0, width-gapWidth);
  }
  
  void draw(){
   fill(#554F00);
   rect(0, this.y, this.leftObstacleWidth, obstacleHeight);
   this.rightObstacleX=this.gapWidth + this.leftObstacleWidth;
   rect(rightObstacleX, this.y, width-rightObstacleX , obstacleHeight);
  }
  
  void update(){
    this.y= this.y + gravity;
    
    if(this.y > height){
     resetObstacle();
    }
  }
  
  void resetObstacle(){
    this.y=-5;
    this.leftObstacleWidth= random(0, width-gapWidth);
  }
  
  void checkCollisionWithPlayer(){
   
    //if the obstacle and player collide 
    if(this.y > p.y && this.y < p.y + p.playerHeight && ( p.x < this.leftObstacleWidth || p.x > (this.rightObstacleX - p.playerWidth))){
      
      gameOver=true;
    }
      
  }
}
