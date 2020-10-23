/* CAR OBSTACLE AVOIDING GAME 
DEVELOPED BY RITVIK & DEVASHISH (Technotix Core Team)
Processing game dev workshop*/

//naming images
PImage you,others,ert,car,car2;
float rt;
int r=0;
int s=0;
int p=0;


//divider limits
int []divider={-50,100,250,400,550,700,900};

//moving divider
int d_move=200;

//defining the axis
int x=350,y=800;

//creating obstacle
int rx1(){
 return int(random(175,315));
 }
 int rx2(){
   return int(random(385,525));
 }
 int ry(){
   return int(random(-60,-59));
 }
 int rs(){
   return int(random(2));
 }
 
 //randomising obstacle
int[]cx={rx1(),rx1(),rx2(),rx2()};
int[]cx1={rx1(),rx1(),rx2(),rx2()};
float[]cy={-59,-200,-350,-600};
float[]cyr={-59,-200,-350,-600};

//initiating score
int scr;

int k=0;

//calling rs function for obstacle
int roadside =rs();

float m=5;

float d=m;

float n=0.001;


int pos=0;

//basic layout
void setup(){
  size(700,900);
  textAlign(CENTER, CENTER);
  //loding images
  you=loadImage("24.png");
  ert=loadImage("earth.png");
  car=loadImage("car.png");
  car2=loadImage("car2.png");
  others=loadImage("2.jpg");

  for(int i=0;i<=3;i++){
    cy[i]=ry();
    cx[i]=p;
  }
}
void draw(){
  background(0,371,0);
    d=m;
    n=.001;
    d_move=2;
  imageMode(CENTER); 
  if(r==0){
    fill(0);
     textSize(50);
    text("Press r to start",width/2,height/2);
  }
  //calling gameover in line 166
  if(r==1){
    gameover();
  }
  //preventing overlapping of game and start screen
  if(r==2){
    rectMode(CENTER);
    fill(100);
    rect(350,450,400,900);
    for(int i=0;i<=6;i++){
      fill(255);
      noStroke();
      rect(width/2,divider[i],20,100);
    }
    for(int i=0;i<=6;i++){
      divider[i]+=d_move;
      if(divider[i]>=950){
      divider[i]=-50;
    }
  }
  //loading player images
  image(you,x,y);
  for(int i=0;i<=3;i++){
    image(others,cx[i],cy[i]);
  }
  fill(0);
  textSize(50);
  text(scr,70,200); //giving score
  m+=n;
  for(int i=0;i<=3;i++){
    cy[i]+=d;
  }
  //stopping car from going out of bounds i.e. screen (road)
  for(int i=0;i<=3;i++){
    if(cy[i]>=959){
      scr+=5;
      cy[i]=ry();
      roadside=rs();
      if(roadside==0){
        cx[i]=rx1();
      }
    if(roadside==1){
      cx[i]=rx2();
    }
  }
}
//align cars in bounds i.e roads
if(x>=521){
  x=521;
}
else if(x<=179){
  x=179;
}
if(y>=840){
  y=840;
}
else if(y<=60){
  y=60;
}
for(int i=0;i<=3;i++){
  if(cy[i]>=(y-117) && cy[i]<=(y+117) && cx[i]>=(x-46) && cx[i]<=(x+46)){
    gameover();
  }
}
}
}
// arrow keys to control player's car
void keyPressed(){
  if(keyCode == 32){
    k=1;
  }
  
if(keyCode==RIGHT){
x+=d;
}
else if(keyCode==LEFT){
x-=d;
}
else if(keyCode==UP){
y-=d;
}
else if(keyCode==DOWN){
y+=d;
}

// pressing r or R to restart game
if(key=='r' || key=='R'){
  r=2;
  scr=0;
  reset();
  m=5; //increasing score by 5 after each car passes bottom bound
  d=m;
  s=0;
  }
}

void keyReleased(){
  k=0;
}
//when cars collide calling gameover function
void gameover(){
 r=1;
 
fill(0);
//Not played well when score under 50
if(scr<=49){
  image(car2,350,462);
  textSize(50);
  text("Not good",350,100);
  text("Your score :",350,150);
  text(scr,350,300);
  textSize(10);
  text("PRESS R TO RESTART",350,350);
  textSize(30);
  text("Better Luck Next Time",350,602);
}
//Played well when score above 50
if(scr>=50){
  pushMatrix();
  translate(350,1200);
  rotate(rt); //rotating image of earth after good game
  rt+=.02;    //Rotating factor for earth image
  image(ert,0,0);
  popMatrix();
  image(car,350,462);
  textSize(30);
  text("YOU played Great !",350,270);
  text("Your score :",350,320);
  text(scr,350,370);
  textSize(10);
  text("PRESS R TO RESTART",350,400);
}
s++;
//calling reset function from line 213
reset();
}
//reset for restarting game
void reset(){
x=350;
y=800;
d=5;
for(int i=0;i<=3;i++){
  cx[i]=cx1[i];
  cy[i]=cyr[i];
  }
}
