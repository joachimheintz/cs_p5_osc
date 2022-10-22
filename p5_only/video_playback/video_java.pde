//import the lib and create video object
import processing.video.*;
Movie movie;

void setup() {
  size(560, 406);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "launch2.mp4");
  movie.loop(); //use .play as alternative
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  image(movie, 0, 0, width, height);
}
