/* Flappy bird template 
Technotix Hardware Game Dev Workshop - Part 1

This is a simple code as a bluepirnt for flappy bird.
Not really an effficient code, but notice-

1) A separate class for every object in the game
2) Splitting the code into functions
3) Trying to minimze hardcoded values

Add comments wherever possible.

*/

//Global Variables are in the variable tab


void setup(){
  //Everything here runs once
  
  size(600, 400); //create a canvas
  bird = new Bird(birdX, birdY, birdRadius, birdColor);
  setupPipe0();
  setupPipe1();
  
}

void draw(){
  //Everything here runs forever
  background(0); //set the background color black
  
  //done using trial and error
  if (frameCount %  120*frameRate == 0) {   
        setupPipe0();
        
      }
  if (frameCount % 120*frameRate != 0 && frameCount % 60*frameRate== 0) {
    setupPipe1();
  }
  drawEverything();
  moveEverything();
}

void resetAndStartGame(){
  score=0;
  isPlaying=true;
}

void keyPressed(){
  bird.velY = -10;
  
 if(!isPlaying)
 resetAndStartGame();
}
void drawEverything(){
  bird.drawBird();
  pipes[0].drawPipe();
  pipes[1].drawPipe();
  stroke(255);
  textSize(32);
  text("Score : " + score, 50, 50);
}

void moveEverything(){
  bird.moveBird();
  pipes[0].movePipe();
  pipes[1].movePipe();
  checkCollision();
}

void checkCollision(){
  //  Bird with bottom
  if (bird.y + bird.r >= height) {
    bird.killBird();
  }

  //Bird with pipe
  for (int i = 0; i < 2; i++) {
    pipes[i].notInGap();
  }
}

void setupPipe0(){
  int pipeYTemp = 200 + floor(random(1) * 150);
  pipes[0] = new Pipe(pipeX, 600 - pipeYTemp, pipeWidth, pipeYTemp);
}

void setupPipe1(){
  int pipeYTemp = 200 + floor(random(1) * 150);
  pipes[1] = new Pipe(pipeX, 600 - pipeYTemp, pipeWidth, pipeYTemp);
}

void showEndScreen(){
  background(0);
  fill(255);
  text("Score : " + score, 50, 50);
  text("GAME OVER", 180, height/ 2);
}
