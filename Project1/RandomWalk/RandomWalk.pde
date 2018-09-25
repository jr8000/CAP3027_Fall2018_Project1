import controlP5.*;

import java.lang.Math;
import java.util.LinkedList;
import java.util.concurrent.TimeUnit;
import java.lang.System;

ControlP5 cp5;
Button startButton;
CheckBox checkBox1;
Slider slider1;
Slider slider2;
boolean startButtonPressedOnce = false;
boolean startButtonWasPressedByUser = false;
int debugCounter = 0;
int currentX = 400;
int currentY = 400;
int numberOfPointsGenerated = 0;

long timeToReleaseData = System.currentTimeMillis();

class XYCoordinate {
  public int x;
  public int y;
  public XYCoordinate(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

LinkedList<XYCoordinate> pointsToDraw;


void setup() {
  size(800, 800);
  background(color(100, 100, 200, 0.1));
  
  pointsToDraw = new LinkedList<XYCoordinate>();


  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  //cp5.addBackground("background1")
    //.setBackgroundColor(color(0, 0, 255, 1))
    //.setHeight(800)
    //.setWidth(800);
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
  startButtonPressedOnce = true;
}

int randIntFromZeroToThree() {
    double fraction = Math.random();
    fraction = fraction * 4;
    // result integer will be between from 0 to 3 inclusive
    int result = (int)fraction;
    //print("random integer: ");
    //print(result);
    //print("\n");
    return result;
}


void draw() {
  cp5.draw();
  if (startButtonWasPressedByUser) {
    makeMoreDrawData();
    doTheDrawing();
  }
}

void startButton() {
  if (!startButtonPressedOnce) {
    startButtonPressedOnce = true;
    return;
  }
  startButtonWasPressedByUser = true;
  //println("start button pressed");
  //print("current state of item 1 in the checkbox: ");
  //print(checkBox1.getState(0));
  print("\ncurrent state of item 2 in the checkbox: ");
  print(checkBox1.getState(1));
  print("\n");
  //randIntFromZeroToThree();
  //makeNextPoint();
  //drawCurrentPointWithColor();
}

void doTheDrawing() {
  XYCoordinate xyTemp;
  if (checkBox1.getState(0)) { // color
    while (true) {
      if (pointsToDraw.isEmpty()) {
        break;
      }
      xyTemp = pointsToDraw.removeLast();
      stroke(
          100 - (int)(Math.log((double)(((numberOfPointsGenerated/10)%100) + 1)) * 100.0 / 4.61512051684126)
          //(numberOfPointsGenerated/10)%100
      );
      //stroke(
          //xyTemp.x,
          //xyTemp.y,
          //color(
              //((numberOfPointsGenerated/10) + 0)%100,
              //((numberOfPointsGenerated/10) + 33)%100,
              //((numberOfPointsGenerated/10) + 66)%100,
              //0.5
          //)
      //);
      point(
          xyTemp.x,
          xyTemp.y
      );
    }
  } else { // no color
    while (true) {
      if (pointsToDraw.isEmpty()) {
        break;
      }
      xyTemp = pointsToDraw.removeLast();
      point(xyTemp.x, xyTemp.y);
    }
  }
}

void makeMoreDrawData() {
  int numberOfPointsCutoff = (int)slider1.getValue();
  if (checkBox1.getState(1)) {
    if (timeToReleaseData > System.currentTimeMillis()) {
      return;
    } else {
      timeToReleaseData = System.currentTimeMillis() + 100;
    }
    int numberOfDataPointsPerCall = (int)slider2.getValue();
    for (int i = 0; i < numberOfDataPointsPerCall; i++) {
      if (numberOfPointsGenerated >= numberOfPointsCutoff) {
        break;
      }
      makeNextPoint();
      pointsToDraw.add(0, new XYCoordinate(currentX, currentY));
    }
  } else {
    for (int i = 0; i < (numberOfPointsCutoff - numberOfPointsGenerated); i++) {
      makeNextPoint();
      pointsToDraw.add(0, new XYCoordinate(currentX, currentY));
    }
  }
}

void makeNextPoint() {
  int randInt = randIntFromZeroToThree();
  if (randInt == 0) { // up
    if (currentY < 1) {
      currentY++;
    } else {
      currentY--;
    }
  } else if (randInt == 1) { // down
    if (currentY > 798) {
      currentY--;
    } else {
      currentY++;
    }
  } else if (randInt == 2) { // left
    if (currentX < 1) {
      currentX++;
    } else {
      currentX--;
    }
  } else { // right
    if (currentX > 798) {
      currentX--;
    } else {
      currentX++;
    }
  }
  numberOfPointsGenerated++;
}

void drawCurrentPointNoColor() {
  point(currentX, currentY);
}

void drawCurrentPointWithColor() {
  stroke((numberOfPointsGenerated/10)%100);
  point(currentX, currentY);
}
