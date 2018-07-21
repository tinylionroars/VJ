//This is a comment
//They don't affect the code
//These are notes for the coder

float r = random(80, 180); //Use this as red value
float g = random(0, 100); //Use this as green value
float b = random(155, 255); //Use this as blue value

void setup() { //Runs once at the beginning & sets everything up
  size(1280, 720); //The size of our window/screen
}

void draw() { //Runs every frame
}


void keyPressed() { //Runs if key is pressed. It checks every frame, but only because we put it after void draw
  if (key == 'a' || key == 'A') { //Draw a rectangle where the mouse is when press a
    noFill(); //Not filled in
    stroke(r, g, b); //Outlined
    rect(mouseX, mouseY, 20, 20); //Draws rectangle
  }

  if (key == 's' || key == 'S') { //Draw a circle where the mouse is when press s
    noStroke(); //No outline
    fill(r, g, b); //Filled in
    ellipse(mouseX, mouseY, 20, 20); //Draws circle
  }

  if (key == ' ') { //Fill in whole screen (clear drawing) when press space
    background(r, g, b); //Make background be the r g b color
  }

  if (key == 'r' || key == 'R') { //Change red value when press r
    if (r < 245) { //If red value is more than 10 less than max value (255)
      r = r + 10; //Make color more red by 10
    } else { //If red value is close to max value
      r = 0; //Set red back to 0
    }
  }

  if (key == 'g' || key == 'G') { //Change green value when press g
    if (g < 245) { //If green value is more than 10 less than max value (255)
      g = g + 10; //Make color more green by 10
    } else { //If green value is close to max value
      g = 0; //Set green back to 0
    }
  }

  if (key == 'b' || key == 'B') { //Change blue value when press b
    if (b < 245) { //If blue value is more than 10 less than max value (255)
      b = b + 10; //Make color more blue by 10
    } else { //If blue value is close to max value
      b = 0; //Set blue back to 0
    }
  }
}
