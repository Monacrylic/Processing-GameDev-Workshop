
boolean isPlaying = true;
int score = 0;

//Pipe
Pipe[] pipes= new Pipe[2];
int pipeX = 600;
int pipeY = 400;
float pipeVelX = 5;
int pipeWidth = 50;
int pipeHeight = 400;
int gapWidth = 150;

color pipeColor = color(255); //white

//Bird
Bird bird;
int birdX = 200;
int birdY = 200;
float birdVelY = 0;
float birdAccY = 0.5;
int birdRadius = 13;
color birdColor = color(52, 235, 222);
