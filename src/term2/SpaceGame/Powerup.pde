class Powerup {
  // Member Variables
  int x, y, diam, speed;
  //PImage rImage;

  // Constructor
  Powerup() {
    speed = 4;
    y=int(random(height));
    x=width+20;
    diam = 100;
  }



  //Member Metthods

  void display() {
    //imageMode(CENTER);
    fill(255, 0, 0);
    ellipse(x, y, diam, diam);
    textSize(15);
    fill(0);
    textMode(CENTER);
    text("level +1",x-20,y);
  }


  void move() {
    x-=speed;
  }

  void spawn() {
  }

  boolean reachedLeft() {
    if  (x<-300) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<diam) {
      return true;
    } else {
      return false;
    }
  }
}
