class Player {
  float x,y;
  Player(float px, float py){
    x=px;
    y=py;
  }
  void drawPlayer(){
    fill(255);
    rect(x, y , 80, 20);
  }
  
  void moveLeft(){
    x-=5;
  }
  
  void moveRight(){
    x+=5;
  }
}
