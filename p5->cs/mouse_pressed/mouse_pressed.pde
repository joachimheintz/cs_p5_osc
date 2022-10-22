//import oscP5 and netP5 libraries
import oscP5.*;
import netP5.*;
//initialize objects
OscP5 oscP5;
NetAddress myRemoteLocation;

int count;

void setup(){
  size(600, 400);
  //create OSC object, listening at port 12001
  oscP5 = new OscP5(this,12001); 
  //create NetAddress for sending: localhost at port 12002
  myRemoteLocation = new NetAddress("127.0.0.1",12002);
  count = 0;
}

void mousePressed(){
  //create new OSC message when mouse is pressed
  OscMessage pressed = new OscMessage("/P5/pressed");
  //add count to the message
  count += 1;
  pressed.add(count);
  //send it
  oscP5.send(pressed, myRemoteLocation);
}

void draw(){
}
