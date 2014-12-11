/**

sketch built to help understand the mathematics that would 
be required to draw a rectangle around two specific points.

this was built to help with kinect data collection and forming it
into a shape usable with physics using the Box2D library.

**/

/*
float p1_x,p1_y,p2_x,p2_y;
void setup(){
  size(800,800);
  frameRate(1);

}

void draw(){
p1_x =  random(0,700);
p1_y =  random(0,700);
p2_x =  random(0,700);
p2_y =  random(0,700);
noFill();
background(0);
  
stroke(255);
strokeWeight(1);
line(p1_x,p1_y,p2_x,p2_y); 
float w = sqrt( pow( (p2_x-p1_x) , 2 ) + pow( (p2_y-p1_y) , 2 )  );
float a = acos((p2_x-p1_x)/w);
strokeWeight(3);

translate(p1_x,p1_y);
if(p2_y < p1_y) {rotate(2*PI-a);}
else{rotate(a);}
rect(0,-5,w,10);
}
*/
