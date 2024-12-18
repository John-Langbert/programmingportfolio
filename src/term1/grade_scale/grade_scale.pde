// Tyson Lowe | Grading Scale Assignment | 9/11/24
float grade;

void setup() {
  size(400, 150);
  background(200);
  textAlign(CENTER);
}
void draw() {
  grade=mouseX/width*4;
  fill(0);
  textSize(20);
  background(200);
  text("Grades by Tyson Lowe", width/2, 40);
  stroke(10, 10, 200);
  strokeWeight(height/100);
  line(5, 100, width-5, 100);
  ellipse(mouseX, 100, 10, 10);
  textSize(10);
  text((float)mouseX/width*4, mouseX, 90);
  for (int i=0; i<width; i+=50 ) {
    line(i, 95, i, 105);
    textSize(10);
    text(i, i, 110);
    
    assignGrade((float)mouseX/width*4);
  }

  println(grade);
}

void assignGrade(float tgrade) {
  if (tgrade>=3.51) {
    text("Assign letter grade A.",width/2,135);
  } else if (tgrade >= 3.0) { // In one conditional statement, you can only ever have one if and one else. However, you can have as many else if's as you like!
    text ("assign letter grade A-.",width/2,135);
  } else if (tgrade >= 2.84) {
    text ("Assign letter grade B+.",width/2,135);
  } else if (tgrade >=2.67) {
    text ("Assign letter grade B.",width/2,135);
  } else if (tgrade >= 2.50) {
    text ("Assign letter grade B-.",width/2,135);
  } else if (tgrade >=2.34) {
    text ("Assign letter grade c+.",width/2,135);
  } else if (tgrade >= 2.17) {
    text ("Assign letter grade c.",width/2,135);
  } else if (tgrade >=2.00) {
    text ("Assign letter grade c-.",width/2,135);
  } else if (tgrade >= 1.66) {
    text ("Assign letter grade d+.",width/2,135);
  } else if (tgrade >=1.33) {
    text ("Assign letter grade d.",width/2,135);
  } else if (tgrade >= 1.00) {
    text ("Assign letter grade d-.",width/2,135);
  } else {
    text ("Assign letter grade F.",width/2,135);
  }
}
