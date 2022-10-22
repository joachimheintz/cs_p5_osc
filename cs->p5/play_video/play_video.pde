//import the video and osc library
import processing.video.*; 
import oscP5.*;
//create objects
OscP5 oscP5;
Movie movie;

void setup() {
  size(560, 406);
  background(0);
  // load the video
  movie = new Movie(this,"launch2.mp4");
  //receive OSC
  oscP5 = new OscP5(this,12000);
  //pass the message to the startVideo method
  oscP5.plug(this,"startVideo","/launch2/start");
}

//activate video playback when startVideo receives 1
void startVideo(int onOff) {
    if (onOff == 1) {
    movie.play();
  }
}

//callback function to read new frames
void movieEvent(Movie m) {
  m.read();
}

//show it
void draw() {
  image(movie, 0, 0, width, height);
}
