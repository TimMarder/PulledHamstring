/*
Pulled Hamstring - Rubin Peci, Tim Marder, Daniel Gelfand
 APCS2 pd02
 HW#53 -- All That Bouncin’ Pt2
 2018-05-25
 */

//Create an ArrayList of balls
import java.util.ArrayList;

ArrayList<Ball> balls;

void setup() {
  //set size and background color
  size(600, 600);
  background(0);
  balls = new ArrayList<Ball>();
  int numBalls = 30;
  for (int i = 0; i < numBalls; i++) {
    //initialize each ball in the array
    balls.add(new Ball());
  }
}

void draw() {
  clear();
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball curr = balls.get(i);
    //Remove the ball from the ArrayList if dead
    if (curr.state == Ball.DEAD) {
      balls.remove(i);
    } 
    //if not dead the ball should change 
    curr.change(); 
    //color the Ball
    noStroke();
    fill(curr.c); 
    //draw the ball
    ellipse(curr.xCor, curr.yCor, curr.radius, curr.radius);
    //if ball is moving then check to see if touching other balls
    if (curr.state == Ball.MOVING) {
      for (Ball other : balls) {
        //ball should expand when touching a growing or shrinking ball
        if (curr.touching(other)) curr.state = Ball.GROWING;
      }
    }
  }
}

void mouseClicked() {
  //Add new ball
  balls.add(new Ball()); 
  //Edited added ball's instance variables
  balls.get(balls.size()-1).xCor = mouseX;
  balls.get(balls.size()-1).yCor = mouseY;
  //Label ball as growing
  balls.get(balls.size()-1).state = Ball.GROWING; 
}
