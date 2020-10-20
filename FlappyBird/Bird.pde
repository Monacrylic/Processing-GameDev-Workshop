class Bird {
    
    int x, y, r; 
    float velY, accY;
    color colour;
    
    
    Bird(int bx,int by,int br,color bcolour) {
    x = bx;
    y = by;
    r = br;
    colour = bcolour;
    velY = birdVelY;
    accY = birdAccY;
  }

  void drawBird() {
    //  Drawing player (bird) sprite
    fill(colour);
    circle(x, y ,r);
    
  }

  void moveBird() {
    y += this.velY;
    velY += this.accY;
  }

  //Sets bird velocity to 0 and bird position to bottom of screen
  void killBird() {
    velY = 0;
    y = height - this.r;
    showEndScreen();
  }
}
