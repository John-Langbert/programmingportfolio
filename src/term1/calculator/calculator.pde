// Tyson Lowe | Calculator App | 30 Sept 24

Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
int rb;
boolean left;


void setup() {
  size(420, 520);
  background(12, 12, 75);
  l = 0.0;
  r = 0.0;
  op = ' ';
  left = true;
  rb = int(random(0, 23));

  buttons[0] = new Button(50, 470, ".", 60, 60, false);
  buttons[1] = new Button(50, 470-4*20, "1", 60, 60, true);
  buttons[2] = new Button(50, 470-8*20, "4", 60, 60, true);
  buttons[3] = new Button(50, 470-12*20, "7", 60, 60, true);
  buttons[4] = new Button(50, 470-16*20, "del", 60, 60, false);
  buttons[5] = new Button(50+4*30, 470, "0", 130, 60, true);
  buttons[6] = new Button(50+4*20, 470-4*20, "2", 60, 60, true);
  buttons[7] = new Button(50+4*20, 470-8*20, "5", 60, 60, true);
  buttons[8] = new Button(50+4*20, 470-12*20, "8", 60, 60, true);
  buttons[9] = new Button(50+4*20, 470-16*20, "±", 60, 60, false);
  buttons[10] = new Button(50+4*40, 470-4*20, "3", 60, 60, true);
  buttons[11] = new Button(50+4*40, 470-8*20, "6", 60, 60, true);
  buttons[12] = new Button(50+4*40, 470-12*20, "9", 60, 60, true);
  buttons[13] = new Button(50+4*40, 470-16*20, "xʸ", 60, 60, false);
  buttons[14] = new Button(50+4*60, 470, "+", 60, 60, false);
  buttons[15] = new Button(50+4*60, 470-4*20, "-", 60, 60, false);
  buttons[16] = new Button(50+4*60, 470-8*20, "÷", 60, 60, false);
  buttons[17] = new Button(50+4*60, 470-12*20, "x", 60, 60, false);
  buttons[18] = new Button(50+4*60, 470-16*20, "²√", 60, 60, false);
  buttons[19] = new Button(50+4*80, 470-40, "=", 60, 140, false);
  buttons[20] = new Button(50+4*80, 470-8*20, "π", 60, 60, false);
  buttons[21] = new Button(50+4*80, 470-12*20, "e", 60, 60, false);
  buttons[22] = new Button(50+4*80, 470-16*20, "C", 60, 60, false);
  //buttons[23] = new Button(50+4*40, 470, "x!", 60, 60, false);
}

void draw() {
  background(12, 12, 75);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}


void updateDisplay() {
  fill(200);
  rectMode(CORNER);
  rect(20, 20, 380, 80);
  fill(0);
  if (dVal.length()<15) {
    textSize(40);
  } else if (dVal.length() == 15) {
    textSize(39);
  } else if (dVal.length() == 16) {
    textSize(38);
  } else if (dVal.length() == 17) {
    textSize(37);
  } else if (dVal.length() == 18) {
    textSize(36);
  } else if (dVal.length() == 19) {
    textSize(35);
  } else if (dVal.length() == 20) {
    textSize(34);
  }
  textAlign(RIGHT);
  text(dVal, width-55, 70);
}

void mousePressed() {
  println("Left:" + l + "   Right:" + r + "   Result:" + result + "   Operator:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    }
    if (buttons[i].on == false && dVal.equals("0.0")) {
      dVal += buttons[i].val;
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      op = 'x';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      op = '÷';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("xʸ")) {
      op = '^';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left) {
        l = -l;
        dVal = str(l);
      } else {
        r = -r;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      if (left) {
        dVal += PI;
        l = PI;
      } else {
        dVal += PI;
        r = PI;
      }
    } else if (buttons[i].on && buttons[i].val.equals("e")) {
      if (left) {
        dVal += exp(1);
        l = exp(1);
      } else {
        dVal += exp(1);
        r = exp(1);
      }
    } else if (buttons[i].on && buttons[i].val.equals("²√")) {
      if (left) {
        l =  sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalculation();
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && buttons [i].val.equals("del")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l= float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r= float(dVal);
      }
    }
  }
}


void performCalculation() {
  // what do i do?
  if (op == '+') {
    result = l + r;
    dVal = str(result);
  } else if (op == '-') {
    result = l - r;
    dVal = str(result);
  } else if (op == 'x') {
    result = l * r;
    dVal = str(result);
  } else if (op == '÷') {
    result = l/r;
    dVal = str(result);
  } else if (op == '^') {
    result = pow(l, r);
    dVal = str(result);
  }
  l = result;
  r = 0;
  left = true;
}

void keyPressed() {
  println("Key:"+ key);
  println("keyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent ("0", true);
  } else if (key == 1 || keyCode == 49 || keyCode == 97) {
    handleEvent ("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent ("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode == 99) {
    handleEvent ("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100) {
    handleEvent ("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if ( keyCode == 10) {
    performCalculation();
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '÷' || keyCode == 111) {
    handleEvent("÷", false);
  } else if (key == '.' || keyCode == 110) {
    handleEvent(".", false);
  }
}
void handleEvent(String keyVal, boolean isNum) {

  if (left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = 'x';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("÷") && !isNum) {
    op = '÷';
    left = false;
    dVal = "0";
  } else if (keyVal.equals(".") && !isNum) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  }
}
