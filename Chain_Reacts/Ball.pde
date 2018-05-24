//Pulled Hamstring - Rubin Peci, Tim Marder, Daniel Gelfand

class Ball 
{
//instance variables
int radius;  //raidus of the ball
float xSpeed;  //speed in the x direction
float ySpeed;  //speed in the y direction
float xCor;    //current x pos
float yCor;    //current y pos
color c;     //its color

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
  //fill everything with the color
  fill(c);
  //draw the ellipse at the respective x and y cordinate
  ellipse(xCor, yCor, radius, radius);
  //increment the coordinate by the speed
  xCor += xSpeed;
  yCor += ySpeed;
  
  //allows it to bounce by reversing direction when it hits a wall
  if (xCor >= 600 || xCor <= 0) {
    xSpeed = -(xSpeed);
  }
  if (yCor >= 600 || yCor <= 0){
    ySpeed = -(ySpeed);
  }
  
}

}
