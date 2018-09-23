import controlP5.*;

import java.lang.Math;

ControlP5 cp5;

void setup() {
  size(800, 800);
  
  cp5 = new ControlP5(this);
  //
}

int randIntFromOneToFour() {
    double fraction = Math.random();
    fraction = fraction * 4;
    // result integer will be between from 0 to 3 inclusive
    int result = (int)fraction;
    return result;
}


void draw() {
  background(0);
  
  
}
