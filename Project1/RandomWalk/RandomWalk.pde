import controlP5.*;

import java.lang.Math;

ControlP5 cp5;
Button startButton;
CheckBox checkBox1;
Slider slider1;
Slider slider2;
boolean startButtonPressedOnce = false;

void setup() {
  size(800, 800);
  
  cp5 = new ControlP5(this);
  cp5.addBackground("background1")
    .setBackgroundColor(color(0, 0, 255, 1))
    .setHeight(800)
    .setWidth(800);
  startButton = cp5.addButton("startButton")
    .setValue(0)
    .setPosition(10, 30)
    .setSize(100, 25);
  startButton.getCaptionLabel()
    .setText("Start");
  
  checkBox1 = cp5.addCheckBox("checkBox1")
    .setPosition(120, 30)
    .setSize(25, 25)
    .setColorActive(color(0, 255, 0, 1))
    //.setColorForeground(color(0, 255, 0, 1))
    .addItem("color", 0)
    .addItem("gradual", 1);
  
  slider1 = cp5.addSlider("slider1")
    .setPosition(200, 30)
    .setSize(300, 25)
    .setMin(1000)
    .setMax(500000);
  slider1.getCaptionLabel()
    .setText("Iterations");

  slider2 = cp5.addSlider("slider2")
    .setPosition(200, 56)
    .setSize(300, 25)
    .setMin(1)
    .setMax(1000);
  slider2.getCaptionLabel()
    .setText("Step count");

}

int randIntFromOneToFour() {
    double fraction = Math.random();
    fraction = fraction * 4;
    // result integer will be between from 0 to 3 inclusive
    int result = (int)fraction;
    print("random integer: ");
    print(result);
    print("\n");
    return result;
}


void draw() {
  
  
}

void startButton() {
  if (!startButtonPressedOnce) {
    startButtonPressedOnce = true;
    return;
  }
  println("start button pressed");
  randIntFromOneToFour();
}
