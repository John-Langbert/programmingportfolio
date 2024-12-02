class Laser {
  // Member Variables
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 5;
  }

  //Member Metthods

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    x += speed;
  }

  boolean reachedRight() {
    if (x>width+20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam/2) { // refine the collision detection
      return true;
    } else {
      return false;
    }
  }
}
