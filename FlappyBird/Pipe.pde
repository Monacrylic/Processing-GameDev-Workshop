class Pipe{
    int x, y, pWidth, pHeight;
    float velX;
    color colour;
    
    Pipe(int px,int py, int pw,int ph) {
    x = px;
    y = py;
    pWidth = pw;
    pHeight = ph;
    colour = pipeColor;
    velX = pipeVelX;
  }

  void drawPipe() {
    fill(colour);
    rect(x, y, pWidth, pHeight); //lower pipe
    rect(x, 0, pWidth, y - gapWidth); //upper pipe
  }

  void notInGap() {
    if (x > 175 && x < 175+pWidth) {
      
      //Check if the bird is touching any of the pipes by checking the bird's Y co-ordinate
      if ((bird.y - bird.r) <= (y - gapWidth) || (bird.y + bird.r) >= y) {
        isPlaying = false;
        bird.killBird(); 
        showEndScreen();
      }
    }
    else if (x == 150 && isPlaying) {
      score++;
    }

  }

  void movePipe() {
    x -= velX;
  }
}
