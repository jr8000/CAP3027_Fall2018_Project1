import controlP5.*;

import java.lang.Math;

ControlP5 cp5;
Button startButton;

void setup() {
  size(800, 800);
  
  cp5 = new ControlP5(this);
  cp5.addBackground("backgroun1")
    .setBackgroundColor(color(0, 0, 255, 1))
    .setHeight(800)
    .setWidth(800);
  startButton = cp5.addButton("startButton")
    .setValue(0)
    .setPosition(10, 30)
    .setSize(100, 25);
  startButton
    .setStringValue("Start");
}

int randIntFromOneToFour() {
    double fraction = Math.random();
    fraction = fraction * 4;
    // result integer will be between from 0 to 3 inclusive
    int result = (int)fraction;
    return result;
}


void draw() {
  
  
}
