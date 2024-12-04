class Rock {
  // Member Variables
  int x, y, diam, speed, xspeed, health, rInt;
  PImage rImage;


  // Constructor
  Rock() {
    xspeed = int(random(2,5)+Power);
    x=width+300;
    y=int(random(height));
    diam = int(random(100,600));
    health = diam-50;
    rImage = loadImage("rockms.png");
   
  }



  //Member Metthods

  void display() {
    imageMode(CENTER);

    rImage.resize(diam, diam);
    image(rImage, x, y);
  }


  void move() {
    x-=xspeed;
  }

  void spawn() {
  }

  boolean reachedLeft() {
    if  (x<-200) {
      return true;
    } else {
      return false;
    }
  }
}
