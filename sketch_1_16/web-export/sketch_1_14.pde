PFont myFont;
PGraphics drawing;

boolean drawingMode = false;
boolean small, medium, large;
boolean roundTransition = true;
boolean drawingScreen = false;
boolean blackbg = true;

int W;
color colorPick;

//meter
float meterWidth;
float decVal;
boolean meterStart;
color meterColor;
int meterColorRed;

//buttons
int smallx, medx, largex, y;
color buttonFillS;
color buttonFillM;
color buttonFillL;
color buttonPressed;

boolean mediumOver = false;
boolean smallOver = false;
boolean largeOver = false;

//arrays and counters
String R1 ;
String[] roundNum = new String[4];

int sx, sy;
int mx, my;
int lx, ly;
int circS = 8;
int circM = 18;
int circL = 35;

color circColor;

//SETUP

void setup() {

  size(320, 568);
  background(250);
  noStroke();
  smooth();
  
  drawing = createGraphics(width, height);

  circColor=color(180);
  //Color
  colorPick = color(20, 130, 200);
  //Round Number
  roundNum[0] = "1";
  roundNum[1] = "2";
  roundNum[2] = "3";
  roundNum[3] = "4";
  R1 = "Round "+roundNum[0];

  //Meter
  meterWidth = 320;
  decVal = .8;
  meterColorRed = 55;

  //buttons
  smallx = 93;
  y = 535;
  medx=155;
  largex = 227;
  buttonFillS = circColor;
  buttonFillM = circColor;
  buttonFillL = circColor;
  buttonPressed = color(55);
}

void draw() {
  background(255);
  noStroke();

  drawing.beginDraw();
  if (drawingMode) {
    drawing.stroke(colorPick);
    drawing.strokeWeight(W);
    drawing.line(mouseX, mouseY, pmouseX, pmouseY);
  }
  drawing.endDraw();
  image(drawing, 0, 0);
  paint_layout();
  if (meterWidth<=0) {
    roundTransition=true;
  }
  if (blackbg) {
    blackScreen();
  }
  if (roundTransition) {
    transitionScreen();
  }
}

void paint_layout() {
  //top bar
  noStroke();
  fill(230);
  rect(0, 0, 320, 68);
  myFont=createFont("Avenir", 20, true);
  textFont(myFont);
  fill(55);
  textAlign(CENTER);
  text(R1, width/2, 42);
  //bottom bar
  fill(230);
  rect(0, 501, 320, 67);
  //buttons
  fill(buttonFillS);
  ellipse(smallx, y, circS, circS);
  fill(buttonFillM);
  ellipse(medx, y, circM, circM);
  fill(buttonFillL);
  ellipse(largex, y, circL, circL);
  meter();
}

void meter() {
  fill(175);
  rect(0, 61, width, 7);
  meterColor = color(meterColorRed, 55, 55);
  fill(meterColor);
  rect(0, 61, meterWidth, 7);
  if (mousePressed) {
    meterStart=true;
  }
  if (meterStart & meterWidth > 0) {
    meterWidth-=decVal;
  }
  if (meterWidth<(width*.6)& meterWidth>0) {
    meterColorRed++;
  }
}

void mousePressed() {
  if (drawingScreen && !(blackbg)){
    drawingMode = true;
    buttonFillM = color(55);
    W = circM;
    if ((mouseX > (smallx-(circS/2)) && mouseX < smallx+(circS/2)) && mouseY > y-(circS/2) && mouseY < y+(circS/2)) {
      small = true;
      medium = false;
      large = false;
    }
    if ((mouseX > (medx-(circM/2)) && mouseX < medx+(circM/2)) && mouseY > y-(circM/2) && mouseY < y+(circM/2)) {
      medium = true;
      small = false;
      large = false;
    }
    if ((mouseX > (largex-(circL/2)) && mouseX < largex+(circL/2)) && mouseY > y-(circL/2) && mouseY < y+(circL/2)) {
      large = true;
      small = false;
      medium = false;
    }
    if ((medium==true)) {
      W = circM; 
      buttonFillM = color(55);
      buttonFillS = color(180);
      buttonFillL = color(180);
      small = false;
      large = false;
    }
    if ((small==true)) {
      W= circS;
      buttonFillS = color(55);
      buttonFillM = color(180);
      buttonFillL = color(180);
      medium = false;
      large = false;
    }
    if ((large == true)) {
      W = circL; 
      buttonFillL = color(55);
      buttonFillM = color(180);
      buttonFillS = color(180);
      small = false;
      medium = false;
    }
  }
  if (roundTransition) {
    meterStart=false;

    if (mousePressed & mouseX>(width/4) & mouseX<((width/2)+width/4) & mouseY > (height*.45) & mouseY<(height*.45+(height*.1))) {
      drawingScreen=true;
      roundTransition=false;
      blackbg=false;
      drawingMode=false;
      meterWidth = 320;
      meterColorRed= 55;
      W=0;
     // println("click");
    }
  }
} 

void mouseReleased() {
    drawingMode=false;
}

void blackScreen() {
  drawingMode = false;
  noStroke();
  fill(0, 210);
  rect(0, 0, width, height);
}

void transitionScreen() {
  blackbg=true;
  noStroke();
  myFont=createFont("Avenir", 20, true);
  textFont(myFont);
  fill(#ffffff);
  textAlign(CENTER);
  text("Next Player", width/2, 200);
  fill(#9933dd);
  rect(width/4, height*.45, width/2, height*.1);
  fill(#ffffff);
  textSize(15);
  textAlign(CENTER);
  text("CONTINUE", width/2, 290);
}


