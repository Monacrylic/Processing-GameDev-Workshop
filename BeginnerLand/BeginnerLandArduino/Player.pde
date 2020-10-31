class Player{
  float x, y, playerWidth, playerHeight;
  
  Player(float x, float y, float playerWidth, float playerHeight){
    this.x =x;
    this.y= y;
    this.playerWidth= playerWidth;
    this.playerHeight= playerHeight; 
  }
  void draw(){
    fill(#FFF9AA);
    rect(this.x, this.y, this.playerWidth, this.playerHeight);
  }
  
  void move(){
    if(keyCode == LEFT) {
      this.x -= 10;
    } else if (keyCode == RIGHT) {
      this.x += 10; 
    }
  }
  
  void arduinoMove(int arduinoInput){
    //convert arduinoInput (0-255) to (0-width)
    this.x = map(arduinoInput, 0, 255, 0 , width);
  }
  
}
