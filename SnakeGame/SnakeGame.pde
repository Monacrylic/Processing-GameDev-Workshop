ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, blocks=20, direction=2, foodx=15, foody=15, speed = 10, fc1 = 255, fc2 = 255, fc3 = 255; 
int[]x_direction={0, 0, 1, -1}, y_direction={1, -1, 0, 0}; //direction for x and y
boolean gameover=false;

void setup() { 
  size(1000, 1000); 
  x.add(0); //snake start position
  y.add(15);
}   
void draw() {  
  background(0);
  fill(0, 255, 0); //snake color green
  for (int i = 0; i < x.size(); i++) rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks); //snake
  if (!gameover) {  
    fill(fc1, fc2, fc3); //food color red
    ellipse(foodx*blocks+10, foody*blocks+10, blocks, blocks); //food
    textAlign(LEFT); //score
    textSize(20);
    fill(255);
    text("fun game for ya'll, if snake=loop u die, snake gets food = longer, use arrow keys, 1st time java", 10, 10, width - 20, 50);
    text("Score: " + x.size(), 10, 100, width - 20, 50);
    if (frameCount%speed==0) { 
      x.add(0, x.get(0) + x_direction[direction]); //make snake longer
      y.add(0, y.get(0) + y_direction[direction]);
      if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true; 
      for (int i=1; i<x.size(); i++) 
        if (x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover=true; 
      if (x.get(0)==foodx && y.get(0)==foody) { //new food if we touch
         if (x.size() %5==0 && speed>=2) speed-=1;  // every 5 points speed increase
        foodx = (int)random(0, w); //new food
        foody = (int)random(0, h);
        fc1 = (int)random(255); fc2 = (int)random(255); fc3 = (int)random(255); //new food color
      } else { 
        x.remove(x.size()-1); 
        y.remove(y.size()-1);
      }
    }
  } else {
    fill(200, 200, 0); 
    textSize(30); 
    textAlign(CENTER); 
    text("GAME OVER \n Your Score is: "+ x.size() +"\n Press ENTER", width/2, height/3);
    if (keyCode == ENTER) { 
      x.clear(); 
      y.clear(); 
      x.add(0);  
      y.add(15);
      direction = 2;
      speed = 8;
      gameover = false;
    }
  }
}
void keyPressed() { 
  int newdir=keyCode == DOWN? 0:(keyCode == UP?1:(keyCode == RIGHT?2:(keyCode == LEFT?3:-1)));
  if (newdir != -1) direction = newdir;
}
