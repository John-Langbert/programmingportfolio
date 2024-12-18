// Tyson Lowe | EtchASketch assignment | 9/18/24
int x, y,z;
PImage e1;

void setup() {
  frameRate(100);
  size(800, 658);
  background(128);
  x=width/2;
  y=height/2;
  z=3;
  
  e1 = loadImage("Etch.png");
}
void draw() {
  image(e1, 0, 0);
  strokeWeight(z);

    for(int i=0;i<1000;i++){
      
      stroke(int (random(100)),int (random(255)),int (random(255)));
      point(x,y);
      point(x+i*z,y);
      point(x-i*z,y);
      
      
    }
 


  if (keyPressed) {
    if (key == 'w' || key == 'W' || key == UP) {
      y=y-z;
    } else if (key == 'a' || key == 'A' || key == LEFT) {
      x=x-z;
    }
    if (key == 'd' || key == 'D' || key == RIGHT) {
      x=x+z;
    }
    if (key == 's' || key == 'S' || key == DOWN) {
      y=y+z;
    }
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
