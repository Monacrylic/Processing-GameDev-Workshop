

class Ball {
  float x; // x coordinate of the ball;
  float y; // y coordinate of the ball;
  float speedX; // x direction Speed
  float speedY;
  float diameter;
  color c;
  
  // Constructor method
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225); 
  }
  
  void move() {
    // Add speed to location
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    //fill(c); //set the drawing color
    ellipse(x,y,diameter,diameter); //draw a ellipse as when a circular ball moves it appers to have a elliptical shaoe.
  }
  
  //functions to help with collision detection
  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float top(){
    return y-diameter/2;
  }
  float bottom(){
    return y+diameter/2;
  }

}
