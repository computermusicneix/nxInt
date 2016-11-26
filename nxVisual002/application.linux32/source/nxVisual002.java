import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class nxVisual002 extends PApplet {

// nxVisual002
// November, 2016
// Miquel Parera




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
float nxInt001width;
int nxInt001rotation;

public void setup()
{
  //size(800,600,P3D);
  
  oscP5 = new OscP5(this,12000);
  nxInt001List = new ArrayList<nxInt001>();
  
  font = createFont("Sawasdee-Bold-48", 20);
  textFont(font);
}

public void draw()
{
  background(0);
  
  fill(255,255,255,100);
  text(title, width/2, height/2);
  
  for (int i = nxInt001List.size(); i>0; i--){
    nxInt001 obj = nxInt001List.get(i-1);
    obj.display();
  };
  
}

public void oscEvent(final OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/title")==true) {
    if(theOscMessage.checkTypetag("s")) {
      title = theOscMessage.get(0).stringValue();
    } }
    if(theOscMessage.checkAddrPattern("/nxInt001")==true) {
      if(theOscMessage.checkTypetag("iiiifffi")) {
        nxInt001color1 = theOscMessage.get(0).intValue();
        nxInt001color2 = theOscMessage.get(1).intValue();
        nxInt001color3 = theOscMessage.get(2).intValue();
        nxInt001color4 = theOscMessage.get(3).intValue();
        nxInt001freq = theOscMessage.get(4).floatValue();
        nxInt001vol = theOscMessage.get(5).floatValue();
        nxInt001width = theOscMessage.get(6).floatValue();
        nxInt001rotation = theOscMessage.get(7).intValue();
        nxInt001List.add(new nxInt001(
          nxInt001color1,nxInt001color2,nxInt001color3,nxInt001color4,
          nxInt001freq,nxInt001vol,nxInt001width,nxInt001rotation
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
class nxInt001 {
  int nxInt001color1;
  int nxInt001color2;
  int nxInt001color3;
  int nxInt001color4;
  float nxInt001freq;
  float nxInt001vol;
  float nxInt001width;
  int nxInt001rotation;

  nxInt001(
  int nxInt001color1TEMP,int nxInt001color2TEMP,int nxInt001color3TEMP, int nxInt001color4TEMP,  
  float nxInt001freqTEMP,
  float nxInt001volTEMP,
  float nxInt001widthTEMP,
  int nxInt001rotationTEMP){
    nxInt001color1 = nxInt001color1TEMP;
    nxInt001color2 = nxInt001color2TEMP;
    nxInt001color3 = nxInt001color3TEMP;
    nxInt001color4 = nxInt001color4TEMP;
    nxInt001freq = nxInt001freqTEMP;
    nxInt001vol = nxInt001volTEMP;
    nxInt001width = nxInt001widthTEMP;
    nxInt001rotation = nxInt001rotationTEMP;
  }
  public void display(){
    pushMatrix();
    noFill();
    stroke(nxInt001color1,nxInt001color2,nxInt001color3,nxInt001color4);
    strokeWeight(nxInt001width);
    translate(((width)/2.0f),((height)/2.0f));
    if(nxInt001rotation == 0){
      rotateX(frameCount*PI/nxInt001freq);
    };
    if(nxInt001rotation == 1){
      rotateY(frameCount*PI/nxInt001freq);
    };
    if(nxInt001rotation == 2){
      rotateY(frameCount*PI/nxInt001freq);
      rotateX(frameCount*PI/nxInt001freq);
    };   
    ellipse(0,0,nxInt001vol,nxInt001vol); 
    popMatrix();  
}
  public void setColor(int r, int g, int b, int alpha){
     nxInt001color1 = r;
     nxInt001color2 = g;
     nxInt001color3 = b;
     nxInt001color4 = alpha;     
  }
  public void setFreq(float freq){
    nxInt001freq = freq;
  }
  public void setVol(float vol){
    nxInt001vol = vol;
  }
  public void setWidth(float widthset){
    nxInt001width = widthset;
  }
  public void setRotation(int rotation){
    nxInt001rotation = rotation;
  }
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "nxVisual002" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
