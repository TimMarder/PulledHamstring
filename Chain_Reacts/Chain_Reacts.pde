/*
Pulled Hamstring - Rubin Peci, Tim Marder, Daniel Gelfand
APCS2 pd02
HW#52 -- All That Bouncin’
2018-05-24
*/

//Create an array of balls
Ball[] balls;

void setup()
{
 //set the size and background color 
 size(600, 600);
 background(0);
 //initialize the array
 balls = new Ball[30];
 //initialize each ball in the array
 for (int i = 0; i < balls.length; i++)
   balls[i] = new Ball();
    
}

void draw() {
  //clear the screen
  clear();
  //call upon each Ball's draw method
  for (Ball b : balls) {
    b.draw();
  }
}
