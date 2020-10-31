/*
 A basic template for an obstacle-avoiding-rocket game.
 The Processing Standalone version
 
 Author: Siddharth Kothari
 Date: 31-10-2020
*/

Obstacle o;
Player p;

void setup(){
  size(500, 500);
  o = new Obstacle(0, gapWidth);
  p = new Player( 0 , playerY, playerWidth, playerHeight);
  

}

void draw(){
  if(!gameOver){
  background(#D4CD6A);
  o.draw();
  o.update();
  p.draw();
  o.checkCollisionWithPlayer();
  
 
  }
}

void keyPressed() {
  p.move();
  
} 
