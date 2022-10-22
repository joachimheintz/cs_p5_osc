/*
receives any OSC message on port 12000 
csound code: OSCsend(1,"",12000,"/P%/test","if",0,1.23)
 */
 
import oscP5.*;
OscP5 oscP5;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  }

void draw() {
  background(0);  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  println("### received an osc message.");
  println(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  print(" arguments: ");
  printArray(theOscMessage.arguments());
}
