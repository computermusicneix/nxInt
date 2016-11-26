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
  void display(){
    pushMatrix();
    noFill();
    stroke(nxInt001color1,nxInt001color2,nxInt001color3,nxInt001color4);
    strokeWeight(nxInt001width);
    translate(((width)/2.0),((height)/2.0));
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
  void setColor(int r, int g, int b, int alpha){
     nxInt001color1 = r;
     nxInt001color2 = g;
     nxInt001color3 = b;
     nxInt001color4 = alpha;     
  }
  void setFreq(float freq){
    nxInt001freq = freq;
  }
  void setVol(float vol){
    nxInt001vol = vol;
  }
  void setWidth(float widthset){
    nxInt001width = widthset;
  }
  void setRotation(int rotation){
    nxInt001rotation = rotation;
  }
}