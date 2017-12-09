 import processing.pdf.*;
 int numIterations = 100;
 int x=0;
 int y=0;

void setup () {
  
  //noLoop();
  size(600,600);
  frameRate(120);
 
}

void draw() {
  
  beginRecord(PDF,"images/album-####.pdf");
  
  //Color Palletes
  color[] backgroundCol = { #9EDBC6, #FFCC99, #F4D8AB, #F1E9DB};
  color[] colorstreamA = { #73A696, #F05240, #E2A137  };
  String [] svgShape = { "yellowphone.svg", "bluephone.svg", "redphone.svg" };
  String [] svgLogo = {"shout.svg", "boogie.svg", "fever.svg" };
  String [] svgTeardrop = {"reddrop.svg", "bluedrop.svg", "yellowdrop.svg" };
  
  background(backgroundCol [int(random(4))]);
  noStroke();
  
  //Create PImage (Processing Generated)
   for(int i=0; i<=1000; i+=110) {
   float weight = random(10,40); //random weight of line
   strokeWeight(weight);
   strokeCap(SQUARE);
   stroke(colorstreamA[int(random(3))]);             //random stroke color
   line(170,270,random(250,500),random(50,320));   //random line coordinates
    }

  //Import SVG PShape
  PShape mellophone;
  pushMatrix();
  mellophone = loadShape(svgShape[int(random(3))]);   //picks one of 3 different coloured mellophones
  mellophone.scale(0.37);
  rotate(4.9);
  shape(mellophone,-550,60);
  popMatrix();
  
  //Import SVG PShape
  PShape teardrop;
  pushMatrix();
  teardrop = loadShape(svgTeardrop[int(random(3))]);  //picks one of 3 different coloured teardrops
  teardrop.scale(random(0.3,0.4));  //random scale size of teardrop
  shape(teardrop,0,0);
  popMatrix();
 
  //Import Typographic Element
  PShape logo;
  pushMatrix();
  logo = loadShape(svgLogo[int(random(3))]); //picks one of 3 different typographic logos
  logo.scale(0.3);
  logo.rotate(random(0,0.2)); //random angle of rotation of logo
  shape(logo, 220,290);
  popMatrix();
  
  endRecord();
   if (frameCount >=numIterations){
   exit();
  }
}