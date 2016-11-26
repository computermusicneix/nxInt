// Object from class arrayList
// Creation and destroy via OSC
// Add parameters to class
// Change parameters

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList<circle> circleList;
int circlecolor1;
int circlecolor2;
int circlecolor3;

void setup()
{
  size(800,600);
  oscP5 = new OscP5(this,12000);
  circleList = new ArrayList<circle>();
}

void draw()
{
  background(0);
  
  for (int i = circleList.size(); i>0; i--){
    circle obj = circleList.get(i-1);
    obj.display();
  };
  
}

void oscEvent(final OscMessage theOscMessage) {
    if(theOscMessage.checkAddrPattern("/circle")==true) {
      if(theOscMessage.checkTypetag("iii")) {
        circlecolor1 = theOscMessage.get(0).intValue();
        circlecolor2 = theOscMessage.get(1).intValue();
        circlecolor3 = theOscMessage.get(2).intValue();
        circleList.add(new circle(circlecolor1,circlecolor2,circlecolor3));
      }
    }
    if(theOscMessage.checkAddrPattern("/rcircle")==true) {
      if(theOscMessage.checkTypetag("i")) {
        circleList.remove(theOscMessage.get(0).intValue());
      }
    }
    if(theOscMessage.checkAddrPattern("/circleColor")==true) {
      if(theOscMessage.checkTypetag("iiii")) {
        int index = theOscMessage.get(0).intValue();
        circlecolor1 = theOscMessage.get(1).intValue();
        circlecolor2 = theOscMessage.get(2).intValue();
        circlecolor3 = theOscMessage.get(3).intValue();
        circleList.get(index).setColor(circlecolor1,circlecolor2,circlecolor3);
      }
    }
}

class circle {
  int colorcircle1;
  int colorcircle2;
  int colorcircle3;
  int wi = int(random(50,500));
  circle(int colorcircleTEMP1,int colorcircleTEMP2,int colorcircleTEMP3){
    colorcircle1 = colorcircleTEMP1;
    colorcircle2 = colorcircleTEMP2;
    colorcircle3 = colorcircleTEMP3;
  }
  void display(){
    noFill();
    stroke(colorcircle1,colorcircle2,colorcircle3);
    strokeWeight(10);
    ellipse(width/2,height/2,wi,wi);
  }
  void setColor(int r, int g, int b){
     colorcircle1 = r;
     colorcircle2 = g;
     colorcircle3 = b;
  }
}