/*
Pulled Hamstring - Rubin Peci, Tim Marder, Daniel Gelfand
 APCS2 pd02
 HW#52 -- All That Bouncin’
 2018-05-24
 */

class Ball 
{
  //instance variables
  float radius;  //radius of the ball
  float xSpeed;  //speed in the x direction
  float ySpeed;  //speed in the y direction
  float xCor;    //current x pos
  float yCor;    //current y pos
  color c;     //its color
  int state;
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  
  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;

  //constructor
  Ball()
  {
    radius = 25;  //balls will be size 25
    //x and y speed will be a random number between 5 and -5 
    xSpeed = (random(10) - 5);
    ySpeed = (random(10) - 5);
    //start in the middle of the screen
    xCor = 300.;
    yCor = 300.;
    //have a random color
    c = color(random(255), random(255), random(255));
  }

  //draw method
  void draw() {
    
    state = MOVING;
    //fill everything with the color
    fill(c);
    //draw the ellipse at the respective x and y cordinate
    ellipse(xCor, yCor, radius, radius);
    //increment the coordinate by the speed
    xCor += xSpeed;
    yCor += ySpeed;

    //allows it to bounce by reversing direction when it hits a wall
    if (xCor >= width || xCor <= 0) {
      xSpeed = -(xSpeed);
    }
    if (yCor >= height || yCor <= 0) {
      ySpeed = -(ySpeed);
    }
  }
  
  void grow() {
   
   state = GROWING;
   if (radius == MAX_RADIUS) {
     shrink();
   }
    
   xSpeed = 0;
   ySpeed = 0;
   radius *= (1 + CHANGE_FACTOR);
    
  }
  
  void shrink() {
    
   state = SHRINKING;
   
   radius *= (1 - CHANGE_FACTOR);
    
  }
  