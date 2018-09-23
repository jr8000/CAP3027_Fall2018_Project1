import controlP5.*;
import java.lang.Math;

ControlP5 cp5;
boolean t = false;
String testStr;

void setup() {
    size(800, 800);

    cp5 = new ControlP5(this);
    cp5.addButton("testButton").setValue(0).setPosition(400, 400).setSize(400, 200);
}

void draw() {
  background(0);
  if (t) {
    text("test msg", 200, 100);
  }
  text(testStr, 200, 200);
}



public void testButton() {
  double randNum = Math.random();
  // we are going to generate a random number between 3 and 5
  randNum = randNum * 2;
  randNum = randNum + 3;
  testStr = String.valueOf(randNum);
  println("printed test message");
  if (!t) {
    t = true;
  } else {
    t = false;
  }
}
