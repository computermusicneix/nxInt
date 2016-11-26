// nxVisual001
// November, 2016
// Miquel Parera

import oscP5.*;
import netP5.*;

String title = "";
PFont font;

OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList<nxInt001> nxInt001List;
int nxInt001color1;
int nxInt001color2;
int nxInt001color3;
int nxInt001color4;
float nxInt001freq;
float nxInt001vol;
float nxInt001positionX;
float nxInt001positionY;
float nxInt001width;
int nxInt001rotation;

void setup()
{
  size(800,600,P3D);
  oscP5 = new OscP5(this,12000);
  nxInt001List = new ArrayList<nxInt001>();
  
  font = createFont("Sawasdee-Bold-48", 20);
  textFont(font);
}

void draw()
{
  background(0);
  
  fill(255,255,255,100);
  text(title, 10, height/2);
  
  for (int i = nxInt001List.size(); i>0; i--){
    nxInt001 obj = nxInt001List.get(i-1);
    obj.display();
  };
  
}

void oscEvent(final OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/title")==true) {
    if(theOscMessage.checkTypetag("s")) {
      title = theOscMessage.get(0).stringValue();
    } }
    if(theOscMessage.checkAddrPattern("/nxInt001")==true) {
      if(theOscMessage.checkTypetag("iiiifffffi")) {
        nxInt001color1 = theOscMessage.get(0).intValue();
        nxInt001color2 = theOscMessage.get(1).intValue();
        nxInt001color3 = theOscMessage.get(2).intValue();
        nxInt001color4 = theOscMessage.get(3).intValue();
        nxInt001freq = theOscMessage.get(4).floatValue();
        nxInt001vol = theOscMessage.get(5).floatValue();
        nxInt001positionX = theOscMessage.get(6).floatValue();
        nxInt001positionY = theOscMessage.get(7).floatValue();
        nxInt001width = theOscMessage.get(8).floatValue();
        nxInt001rotation = theOscMessage.get(9).intValue();
        nxInt001List.add(new nxInt001(
          nxInt001color1,nxInt001color2,nxInt001color3,nxInt001color4,
          nxInt001freq,nxInt001vol,nxInt001positionX,nxInt001positionY,
          nxInt001width,nxInt001rotation
          ));
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001clear")==true) {
      if(theOscMessage.checkTypetag("i")) {
        nxInt001List.remove(theOscMessage.get(0).intValue());
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001color")==true) {
      if(theOscMessage.checkTypetag("iiiii")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001color1 = theOscMessage.get(1).intValue();
        nxInt001color2 = theOscMessage.get(2).intValue();
        nxInt001color3 = theOscMessage.get(3).intValue();
        nxInt001color4 = theOscMessage.get(4).intValue();
        nxInt001List.get(index).setColor(nxInt001color1,nxInt001color2,nxInt001color3,nxInt001color4);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001freq")==true) {
      if(theOscMessage.checkTypetag("if")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001freq = theOscMessage.get(1).floatValue();
        nxInt001List.get(index).setFreq(nxInt001freq);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001vol")==true) {
      if(theOscMessage.checkTypetag("if")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001vol = theOscMessage.get(1).floatValue();
        nxInt001List.get(index).setVol(nxInt001vol);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001positionX")==true) {
      if(theOscMessage.checkTypetag("if")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001positionX = theOscMessage.get(1).floatValue();
        nxInt001List.get(index).setPositionX(nxInt001positionX);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001positionY")==true) {
      if(theOscMessage.checkTypetag("if")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001positionY = theOscMessage.get(1).floatValue();
        nxInt001List.get(index).setPositionY(nxInt001positionY);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001width")==true) {
      if(theOscMessage.checkTypetag("if")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001width = theOscMessage.get(1).floatValue();
        nxInt001List.get(index).setWidth(nxInt001width);
      }
    }
    if(theOscMessage.checkAddrPattern("/nxInt001rotation")==true) {
      if(theOscMessage.checkTypetag("ii")) {
        int index = theOscMessage.get(0).intValue();
        nxInt001rotation = theOscMessage.get(1).intValue();
        nxInt001List.get(index).setRotation(nxInt001rotation);
      }
    }
}