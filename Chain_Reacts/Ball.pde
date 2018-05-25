/*
Pulled Hamstring - Rubin Peci, Tim Marder, Daniel Gelfand
 APCS2 pd02
 HW#53 -- All That Bouncin’ Pt2
 2018-05-25
 */

class Ball {

  //constants
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;

  final float CHANGE_FACTOR = .25;
  final float MAX_RADIUS = 50;

  //instance variables
  color c;
  float xCor;
  float yCor;
  float xVel;
  float yVel;
  float radius;
  int state;

  //constructor
  Ball() {
    xVel = random(1, 10) - 5;
    yVel = random(1, 10) - 5;
    c = color(random(256), random(256), random(256));
    radius = 25;

    //start int he middle
    xCor = 300;
    yCor = 300;
  }


  void move() {
    if (xCor >= width || xCor <= 0) {
      xVel = -(xVel);
    }
    if (yCor >= height || yCor <= 0) {
      yVel = -(yVel);
    }
    //edit coordinate based on velocity
    xCor += xVel;
    yCor += yVel;
  }

  //Used to change 
  void change() {
    if (state == MOVING) move();
    //done with ball if it is dead
    else if (state == DEAD) return;
    else if (state == GROWING) radius += CHANGE_FACTOR;
    else if (state == SHRINKING) radius -= CHANGE_FACTOR;
    if (radius <= 0) state = DEAD;
    if (radius > MAX_RADIUS) state = SHRINKING;
  }

  //Returns true if balls are touching
  boolean touching(Ball other) {

    //check if touching a growing or shrinking ball
    return (this != other && state == MOVING && (other.state == SHRINKING || other.state == GROWING) 
      && ( (radius + other.radius)/2 > dist( xCor, yCor, other.xCor, other.yCor) ) );
  }
}
