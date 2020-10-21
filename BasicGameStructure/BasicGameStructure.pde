Player p;

void setup(){
  size(800, 800);
  p= new Player(0, height-40);
}

void draw(){
  background(0);
  p.drawPlayer();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.moveLeft();
    } else if (keyCode == RIGHT) {
      p.moveRight();
    } 
  } 
}
