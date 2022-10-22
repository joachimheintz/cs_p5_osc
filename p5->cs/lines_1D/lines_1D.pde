//import oscP5 and netP5 libraries
import oscP5.*;
import netP5.*;
//initialize objects
OscP5 oscP5;
NetAddress myRemoteLocation;

//variables for the x position of the four lines
//(from processings Basics>Math>Distance 1D example) 
float xpos1;
float xpos2;
float xpos3;
float xpos4;
int thin = 8;
int thick = 36;

void setup(){
  size(640, 360);
  noStroke();
  xpos1 = width/2;
  xpos2 = width/2;
  xpos3 = width/2;
  xpos4 = width/2;
  //create OSC object, listening at port 12001
  oscP5 = new OscP5(this,12001); 
  //create NetAddress for sending: localhost at port 12002
  myRemoteLocation = new NetAddress("127.0.0.1",12002);
}

void draw(){
  //create movement depending on mouse position
  background(0);
  float mx = mouseX * 0.4 - width/5.0;
  fill(102);
  rect(xpos2, 0, thick, height/2);
  rect(xpos4, height/2, thick, height/2);
  fill(204);
  rect(xpos1, 0, thin, height/2);
  rect(xpos3, height/2, thin, height/2);	
  xpos1 += mx/16;
  xpos2 += mx/64;
  xpos3 -= mx/16;
  xpos4 -= mx/64;
  if(xpos1 < -thin)  { xpos1 =  width; }
  if(xpos1 >  width) { xpos1 = -thin; }
  if(xpos2 < -thick) { xpos2 =  width; }
  if(xpos2 >  width) { xpos2 = -thick; }
  if(xpos3 < -thin)  { xpos3 =  width; }
  if(xpos3 >  width) { xpos3 = -thin; }
  if(xpos4 < -thick) { xpos4 =  width; }
  if(xpos4 >  width) { xpos4 = -thick; }
  
  //create OSC message and add the four x-positions
  OscMessage xposMessage = new OscMessage("/P5/xpos");
  xposMessage.add(xpos1); 
  xposMessage.add(xpos2); 
  xposMessage.add(xpos3); 
  xposMessage.add(xpos4); 
  //send it
  oscP5.send(xposMessage, myRemoteLocation); 
}
