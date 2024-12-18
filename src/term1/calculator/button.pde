class Button {
  // Member variables: what is needed?
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, String val, int w, int h, boolean isNum) {
    this.x = x;
    this.y = y;
    c1 = color(50,200,200);
    c2 = color(25,100,100);
    this.val = val;
    this.w = w;
    this.h = h;
    on=false;
    this.isNum = isNum;
  }

  // Member methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }

    rectMode(CENTER);

    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
