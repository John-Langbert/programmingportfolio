// Tyson Lowe |colDet | 19 Sept 2024
int xspeed, yspeed, xpos, ypos, wdth, ht, xzoom, yzoom, xspot, yspot;

void setup() {
  size(1920,1000);
  background(0);
  xspeed = int(random(40));
  yspeed = int(random(60));
  xzoom =  int(random(40));
  yzoom = int(random(40));
  wdth = 24;
  ht = 34;
  noStroke();
  xpos = width/2;
  ypos = height/2;
  xspot = width/2;
  yspot = height/2;
  frameRate(1000000);
}

void draw() {
  background(0);
  
  fill(255);
  ellipse(xpos,ypos,wdth,ht);
  
  ellipse(xspot,yspot,wdth,ht);
  

  xpos= xpos + xspeed;
  ypos += yspeed;
  xspot+= xzoom;
  yspot+= yzoom;
  if(xpos >= width-wdth/2 || xpos<=wdth/2) {
    xspeed=xspeed*-1;
  }
  if(ypos >= height-ht/2 || ypos<=ht/2) {
    yspeed=yspeed*-1;
  }
  if(xspot >= width-wdth/2 || xspot<=wdth/2) {
    xzoom=xzoom*-1;
  }
  if(yspot >= height-ht/2 || yspot<=ht/2) {
    yzoom=yzoom*-1;
  }
}

  
