import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture videoStream;
OpenCV opencv;
Movie aset;

int macW = 640;
int macH = 480; 

void setup() {
  
  size(macW, macH);
  videoStream = new Capture(this, macW/2, macH/2);
  opencv = new OpenCV(this, macW/2, macH/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  videoStream.start();
}

void draw() {
  scale(-2,2);
  opencv.loadImage(videoStream);
  image(videoStream, -macW/2, 0);

  noFill();
  stroke(255, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) {
  c.read();
}

