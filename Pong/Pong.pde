//MacKenzie Becker
//January 


//paddle variables
float yPaddle;
int xPaddle = 40; //dosen't change
int paddleHeight = 90; //doesn't change
int paddleWidth = 20; //doesn't change
float easing = 0.05;

//Paddle2
float yPaddle2;
int xPaddle2 = 40; //dosen't change
int paddle2Height = 90; //doesn't change
int paddle2Width = 20; //doesn't change
float easing2 = 0.07;//Paddle2


//ball variables
int radius = 20;
float xBall, yBall; //starting postion
float xBallSpeed = 7;
float yBallSpeed = 7;
int xBallDirection = 1; //Left or right
int yBallDirection = 1; // Top to bottom

//points
int score = 0;
PFont scoreFont;

//timer
int start;



void setup() {
  size(800, 500);
  smooth();
  background(255);
  ellipseMode(RADIUS);
  xBall = width/2;
  yBall = height/2;
  start = second();
}

void draw() {
  background(255);
  rectMode(CENTER);
  int timer = second()-start;
  

  //player's Paddle 
  float targetY = mouseY;
  yPaddle += (targetY - yPaddle) * easing;
  rect(xPaddle, yPaddle, paddleWidth, paddleHeight);
  yPaddle = constrain(yPaddle, 0, 470);

  //Paddle 2
  float targetY2 = mouseY;
  yPaddle2 += (targetY2 - yPaddle2) * easing2;
  yPaddle2 = yBall;
  rect(750, yPaddle2, paddle2Width, paddle2Height);
  yPaddle2 = constrain(yPaddle2, 0, 420);

  //Ball
  // movement
  xBall = xBall + (xBallSpeed * xBallDirection);
  yBall = yBall + (yBallSpeed * yBallDirection);

  //Ball hitting Walls
  if (yBall > height-radius || yBall < radius) {
    yBallDirection *= -1;  
  }
  //Ball Bouncing off Player's Paddle 
  if (xBall <= xPaddle+32 && yBall <= yPaddle+48 && yBall >= yPaddle-48) {
    xBallDirection *= -1;
    fill(random(255), random(225), random(255), random(255));
    score = score+1;
  }
  //Ball Bouncing off Paddle2

  if (xBall < radius) {
    xBallSpeed *= 0;
    yBallSpeed *= 0;
  }
  if (xBall > width-80) {
    xBallDirection *= -1;
    fill(random(255), random(225), random(255), random(255));
  }
  if (xBallSpeed < 1 && yBallSpeed < 1) {
    background(0);
    println(score);
    fill(255);
    yPaddle = 1000;
    text("Game Over!", 250, 250);
    timer = timer+0;
    
  }
  scoreFont = loadFont("Broadway-48.vlw");
    textFont(scoreFont, 100);  
    text(score, 375, 100);
    textFont(scoreFont, 50);
    text(timer, 385, 475);
  ellipse(xBall, yBall, radius, radius);
}