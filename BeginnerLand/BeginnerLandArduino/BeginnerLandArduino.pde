/*
 A basic obstacle-avoiding-rocket game for the processing game.
 The Arduino Controlled version
 
 Author: Siddharth Kothari
 Date: 31-10-2020
*/


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int potentiometerVal;      // Data received from the serial port


Obstacle o;
Player p;

void setup(){
  size(500, 500);
  o = new Obstacle(0, gapWidth);
  p = new Player( 0 , playerY, playerWidth, playerHeight);
  
  //Arduino Connection 
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  if(!gameOver){
  background(#D4CD6A);
  o.draw();
  o.update();
  p.draw();
  o.checkCollisionWithPlayer();
  
 

 if ( myPort.available() > 0) {               // If data is available,
    potentiometerVal = myPort.read();         // read it and store it in val
    p.arduinoMove(potentiometerVal);
  }
  
  }
  
}

void keyPressed() {
  p.move();
  
} 
