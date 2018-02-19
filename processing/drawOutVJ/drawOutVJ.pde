import processing.sound.*;
import processing.video.*;

AudioIn input;
Amplitude rms;
int scale=1;

Capture video;
boolean drawing = false;

float r = random(80, 180);
float g = random(0, 100);
float b = random(155, 255);
float r2 = r;
float g2 = g;
float b2 = b;

void setup() {
  size(640, 480);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);

  // start the Audio Input
  input.start();

  // create a new Amplitude analyzer
  rms = new Amplitude(this);

  // Patch the input to an volume analyzer
  rms.input(input);
  
  input.amp(1);

  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + cameras[i]);
    }
  }
  video = new Capture(this, cameras[1]);
  video.start();

  ellipseMode(CENTER);
  strokeWeight(2);
}

void captureEvent(Capture video) {
  video.read();
  video.updatePixels();
  updatePixels();
}

void draw() {
  alpha(255);
  stroke(r, g, b);
  loadPixels();
  video.loadPixels();
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    drawing = true;
  }

  if (drawing == true) {
    for (int x = 0; x < width; x ++) {
      for (int y = 0; y < height; y ++) {
        int loc = x + y*width;
        color locRGB = pixels[loc];
        if (locRGB == color(r2, g2, b2)) {
          if ((x > 2) & (y > 2) & (r2 <= 250)) {
            int place = (x-2) + (y-2)*width;
            pixels[place] = color((r2 + 5), g2, b2);
            //print("color is same");
            updatePixels();
          } else {
            drawing = false;
            delay(5);
          }
        }
      }
    }
  } else {
    alpha(100);
    scale = int(map(rms.analyze(), 0, 0.01, 1, 255));
    image(video, 0, 0, width, height);
    tint(r, g, scale);
  }
  if (r2 <= 255) {
    r2 = r2 + 5;
  }
  println(drawing);
}



void mouseReleased() {
  println("old r2, g2, b2 is " + r2 + ", " + g2 + ", " + b2);
  println("old r, g, b is "+ r + ", " + g + ", " + b);
  r2 = r;
  g2 = g;
  b2 = b;

  r = random(80, 230);
  g = random(0, 150);
  b = random(105, 255);
  println("new r2, g2, b2 is " + r2 + ", " + g2 + ", " + b2);
  println("new r, g, b is " + r + ", " + g + ", " + b);
}