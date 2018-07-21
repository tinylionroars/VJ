//import processing.video.*;

//Capture vid;

float r = random(80, 180);
float g = random(0, 100);
float b = random(155, 255);

void setup() {
  size(1280, 720);
  
  /*
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
  
  vid = new Capture(this, cameras[1]);
  vid.start();
  */
}

/*
void captureEvent(Capture vid) {
  vid.read();
}
*/

void draw() {
  tint(r, g, b);
  
  
  
}


void keyPressed() {
  if (key == 'a' || key == 'A') { //Draw a rectangle where the mouse is when I press a
    noFill();
    stroke(r, g, b);
    rect(mouseX, mouseY, 20, 20);
  }
  
  if (key == 'r' || key == 'R') { //Change red value when I press r
    if (r < 245) {
      r = r + 10;
    } else {
      r = 0;
    }
  }
  
  if (key == 'g' || key == 'G') { //Change green value when I press g
    if (g < 245) {
      g = g + 10;
    } else {
      g = 0;
    }
  }
  
  if (key == 'b' || key == 'B') { //Change blue value when I press b
    if (b < 245) {
      b = b + 10;
    } else {
      b = 0;
    }
  }
  
  if (key == ' ') {
    background(r, g, b);
  }
  
  if (key == 's' || key == 'S') {
    noStroke();
    fill(r, g, b);
    ellipse(mouseX, mouseY, 20, 20);
  }
  
  
}
