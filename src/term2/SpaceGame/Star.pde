class Star {
  // Member Variables
  int x, y, diam, speed;
  PImage s1;

  // Constructor
  Star() {
    x=width+100;
    y=int(random(height));
    diam = int(random(1, 4));
    speed = int(random(1,50));
  }

  //Member Metthods

  void display() {
  }

  void move() {
    x-=speed;
  }

  boolean reachedLeft() {
    if (x<-20) {
      return true;
    } else {
      return false;
    }
  }
}
