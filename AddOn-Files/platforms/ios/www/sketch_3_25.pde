PFont myFont;
PFont myFontBlack;
PGraphics drawing;


boolean drawingMode = false;
 boolean small, medium, large;
 boolean roundTransition = true;
 boolean drawingScreen = true;
 boolean blackbg = true;
 boolean endScreen=false;
 boolean gameEnd=false;

/*
boolean drawingMode = false;
boolean small, medium, large;
boolean roundTransition = false;
boolean drawingScreen = false;
boolean blackbg = false;
boolean endScreen=false;
boolean gameEnd=true;
*/

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

int sx, sy;
int mx, my;
int lx, ly;
int circS = 8;
int circM = 18;
int circL = 35;

color circColor;

//PLAYER AND ROUND

int roundCount;
String R1;
String[] roundNum= {
  "1", "2", "3", "4"
};
color bg;

String playerString;
String playerNum = getnames();
//String[] playerNum; // = {"evan", "lauren", "bradley", "brian"};
int playerCount;
int colorCount;
int totalPlayers;
int pColor = getcolors();
int pFill;

//int[] dColor = {#ffaaaa, #aaffaa, #aaaaff, #ffaaff, #cccccc};

//PlayerTags

//Player 1-1
  String p1;
  float p1W; 
  float p1x;
  float py;
  float h;
//Player 2-1
  String p2;
  float p2W;
  float p2x;
//Player3-1
    String p3;
    float p3W;
    float p3x;
//Player3-2
    Float py3;
//Player4-1;
    String p4;
    float p4W;
    float p4x;
    
    float py4;




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

    //PLAYER AND ROUND
    //pFill= color(pColor[playerCount]);
    pFill = color(pColor[colorCount], pColor[colorCount+1], pColor[colorCount+2]);

    playerCount=0;
    colorCount = 0;
    roundCount=4;
    R1 = "Round "+roundCount;
    playerString = playerNum[playerCount]+"'s Turn!";

    totalPlayers = playerNum.length;
    
    //PlayerTags
    
    myFontBlack=createFont("AvenirLTStd-Black.otf", 16, true);
    textAlign(LEFT);
    textFont(myFontBlack);

//Player 1-1
    p1 = playerNum[0];
    p1W = textWidth(p1); 
    py = 540;
    h= textAscent();
//Player 2-1
    p2 = playerNum[1];
    p2W = textWidth(p2);
   // p2x = p1x+p1W+20;
//Player3-1
    p3 = playerNum[2];
    p3W = textWidth(p3);
  //  p3x = p2x+p2W+20;
//Player3-2
    py3= py+10;
//Player 4
    p4 = playerNum[3];
    p4W = textWidth(p4);
  //  p4x = p3x+p3W+20;
    py4 = py+10;
    
    p1x= ((width/2)-((p1W+p2W+20)/2));
    p2x= p1x+p1W+20;
  }

void draw() {
  background(255);
  noStroke();

  drawing.beginDraw();
  if (drawingMode) {   
    //   if (mouseDragged){
    drawing.stroke(pFill);
    drawing.strokeWeight(W);
    drawing.line(mouseX, mouseY, pmouseX, pmouseY);
  }


  // }
  //   if (mousePressed){
  //     drawing.fill(pFill);
  //     drawing.ellipse(mouseX, mouseY, W);
  //   }

  drawing.endDraw();
  image(drawing, 0, 0);
  playerTags();
  if (drawingScreen) {
    paint_layout();
    if (meterWidth<=0) {
      if (roundCount <=4 && playerCount<=totalPlayers-1 ) {
        blackbg=true;
        roundPlayerCount();
        roundTransition=true;
      }
      if (roundCount==5) {
        blackbg=false;
        gameEnd=true;
        if (gameEnd) {
          gameEndScreen();
        }
        noLoop();
      }
    }
  }
  if (blackbg) {
    blackScreen();
    noLoop();
  }
  if (roundTransition) {  
    transitionScreen();
  }
 if(!blackbg && !drawingScreen && !drawingMode && !gameEnd &&!roundTransition){
         please_save();
         noLoop();
         window.onClick = window.location="gallery.html";

}
}


void paint_layout() {
  //top bar
  noStroke();
  fill(230);
  rect(0, 0, 320, 68);
  myFont=createFont("Avenir", 24, true);  
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
    if (mouseY>68 & mouseY<501) {
      meterStart=true;
    }
  }
  if (meterStart & meterWidth > 0) {
    meterWidth-=decVal;
  }
  if (meterWidth<(width*.6)& meterWidth>0) {
    meterColorRed++;
  }
}


void mousePressed() {
  //println("mousePressed()");
  if (drawingScreen&& !(blackbg)) {
    /*
      drawingMode = true; 
     buttonfillM = color(55);
     W = circM;
     if (drawingMode){
     drawing.fill(pFill);
     drawing.ellipse(mouseX, mouseY, W);}
     //*/
    if ((mouseX > (smallx-(circL/2)) && mouseX < smallx+(circL/2) && mouseY > y-(circL/2) && mouseY < y+(circL/2))) {
      small = true;
      medium = false;
      large = false;
    }
    if ((mouseX > (medx-(circL/2)) && mouseX < medx+(circL/2)) && mouseY > y-(circL/2) && mouseY < y+(circL/2)) {
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
}

//void mousePressed(){
void mouseDragged() {
  // println("mouseDragged()");
  if (drawingScreen && !(blackbg)) {
    drawingMode = true;
    buttonFillM = color(55);
    W = circM;
    //  drawing.fill(pFill);
    //  drawing.ellipse(mouseX,mouseY,W);
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
  }
}

void mouseReleased() {
  if (drawingScreen) {
    drawingMode=false;
  }
  if (roundTransition) {
    if (mouseX>(width/4) & mouseX<((width/2)+width/4) & mouseY > (height*.45) & mouseY<(height*.45+(height*.1))) {
      meterStart=false;
      drawingScreen=true;
      roundTransition=false;
      blackbg=false;
      drawingMode=false;
      meterWidth = 320;
      meterColorRed= 55;
      W=0;
      loop();
    }
  }
  if (gameEnd) {
    if (mouseX>(width/4) & mouseX<((width/2)+width/4) & mouseY > (height*.45) & mouseY<(height*.45+(height*.1))) {
      fill(230);         
      blackbg=false;
      drawingMode=false;
      gameEnd=false;
      roundTransition=false;
      //drawingScreen=true;
      R1= "Your Masterpiece"; 
      // playerTags();
      loop();

    }
  }
}

/*
void saveScreen(){
  if(!blackbg &!drawingMode & !gameEnd &!roundTransition){
         save();
}
  
}*/


void blackScreen() {
  meterStart=false;
  drawingMode = false;
  noStroke();
  fill(0, 210);
  rect(0, 0, width, height);
}

void transitionScreen() {
  blackbg=true;
  noStroke();
  myFont=createFont("AvenirLTStd-Black.otf", 24, true);
  textFont(myFont);
  fill(#ffffff);
  textAlign(CENTER);
  text(playerString, width/2, 200);
  fill(pFill);
  rect(width/4, height*.45, width/2, height*.1, 6);
  fill(#ffffff);
  textSize(15);
  textAlign(CENTER);
  text("CONTINUE", width/2, 290);
}

void roundPlayerCount() {
  if (playerCount<(totalPlayers)) {
    playerCount++;
    colorCount+=3;
    if (playerCount<totalPlayers){
      print(playerNum[1]);
      print(pColor[1]);
    playerString = playerNum[playerCount]+"'s Turn!"; ///
    pFill=color(pColor[colorCount], pColor[colorCount+1], pColor[colorCount+2]);
    noLoop();
  }
  if (playerCount>=totalPlayers) {
    if (roundCount<5) {
      roundCount++;
      if(roundCount<=4){
      R1 = "Round "+roundCount;
      playerCount=0;
      playerString = playerNum[playerCount]+"'s Turn!";
      pFill=color(pColor[colorCount], pColor[colorCount+1], pColor[colorCount+2]);
      noLoop();
      }
    }
  }
  }
  //if (roundCount>=4 && playerCount>totalPlayers-1) {
    //println("STOP2");
   // totalPlayers=5;
  //}
}

void gameEndScreen() {
  //println("gameEndScreen()");
  drawingScreen=false;
  drawingMode=false;
  roundTransition=false;
  playerString= "AddOn Complete!";
  pFill=(#34495e);
  
  noStroke();
  blackScreen();
  myFont=createFont("AvenirLTStd-Black.otf", 20, true);  
  textFont(myFont);
  fill(#ffffff);
  textSize(24);
  textAlign(CENTER);
  text(playerString, width/2, 200);
  fill(pFill);
  rect(width/4, height*.45, width/2, height*.1, 6);
  fill(#ffffff);
  textSize(15);
  textAlign(CENTER);
  text("CONTINUE", width/2, 290);
  //noLoop();
  loop();
}


void playerTags() {
  //top bar
  noStroke();
  fill(230);
  rect(0, 0, 320, 68);
  myFont=createFont("Avenir", 20, true);
  textFont(myFont);
  fill(55);
  textAlign(CENTER);
  text(R1, width/2, 42);
  stroke(230);
  //bottom bar
  fill(252);
  rect(0, 501, 320, 67); 
  
  //text info
  myFontBlack=createFont("AvenirLTStd-Black.otf", 16, true);
  textAlign(LEFT);
  textFont(myFontBlack);
  
  // Player 1
  fill(pColor[0], pColor[1], pColor[2]);
  text(p1, p1x, py);
  
  //Player 2
  fill(pColor[3], pColor[4], pColor[5]);
  text(p2, p2x, py);  
  
  
  // If there are 3 players
  if (totalPlayers==3) {  
      
    //centers the text
    p1x= ((width/2)-((p1W+p2W+p3W+40)/2));
    p2x = p1x+p1W+20;
    p3x = p2x+p2W+20;

    //checks to see if the text width is less than screen width
    if ((p3W+p3x)<(width-20)){ 
      fill(pColor[6], pColor[7], pColor[8]);
      text(p3, p3x, py);
    }
    
    //checks to see if the text width is more than screen width  
    if ((p3W+p3x)>(width-20)){
      
      p1x= ((width/2)-((p1W+p2W+20)/2));
      p2x = p1x+p1W+20;
      p3x = ((width/2)-((p3W)/2));
      
      py = 530;
      
      //Player 1    
      fill(pColor[0], pColor[1], pColor[2]);
      text(p1, p1x, py);
       
      //Player 2
      fill(pColor[3], pColor[4], pColor[5]);
      text(p2, p2x, py); 
      
      //Player 3
      fill(pColor[6], pColor[7], pColor[8]);
      text(p3,p3x,py3);
        
    }
  }
      
  //if there are 4 players     
  if (totalPlayers==4){
         
    p1x= ((width/2)-((p1W+p2W+p3W+p4W+60)/2));
    p2x = p1x+p1W+20;
    p3x = p2x+p2W+20;
    p4x = p3x+p3W+20;
       
      
    //checks if text width is less than screen width   
    if ((p4W+p4x)<(width-20)){ 
      
      //Player 3
      fill(pColor[6], pColor[7], pColor[8]);
      text(p3, p3x, py);  
       
      //Player 4   
      fill(pColor[9], pColor[10], pColor[11]);
      text(p4, p4x, py);
     }
     
     //checks if text width is more than screen width    
     if ((p4W+p4x)>(width-20)){
        
       //checks if first three players are less than screen width
       if((p3W+p3x)<(width-20)){
           
         p1x= ((width/2)-((p1W+p2W+p3W+40)/2));
         p2x = p1x+p1W+20;
         p3x = p2x+p2W+20;
         p4x = ((width/2)-((p4W)/2));
          
         py = 530;
          
         //Player 1  
         fill(pColor[0], pColor[1], pColor[2]);
         text(p1, p1x, py);
       
         //Player 2
         fill(pColor[3], pColor[4], pColor[5]);
         text(p2, p2x, py);
       
         //Player 3
         fill(pColor[6], pColor[7], pColor[8]);
         text(p3,p3x,py);
         
         //Player 4
         fill(pColor[9], pColor[10], pColor[11]);
         text(p4,p4x,py3); 
        }
         
        //checks if first three players are more than screen width
        if((p3W+p3x)>(width-20)){
          
          p1x= ((width/2)-((p1W+p2W+20)/2));
          p2x = p1x+p1W+20;
          p3x = ((width/2)-((p3W+p4W+20)/2));
          p4x = p3x+p3W+20;
          
          py = 530;
          
          //Player 1  
          fill(pColor[0], pColor[1], pColor[2]);
          text(p1, p1x, py);
       
          //Player 2
          fill(pColor[3], pColor[4], pColor[5]);
          text(p2, p2x, py);
       
          //Player 3
          fill(pColor[6], pColor[7], pColor[8]);
          text(p3,p3x,py3);
         
          //Player 4 
          fill(pColor[9], pColor[10], pColor[11]);
          text(p4,p4x,py3); 
         }
      }  
   }
}

