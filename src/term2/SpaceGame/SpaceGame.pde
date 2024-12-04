// Tyson Lowe | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile John;
Spaceship Bob;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();

int score, level, Power;
boolean play;
Timer rTime;
Timer gOTime;
PImage gOvr;
Timer puTime;
Timer sTime;

void setup() {
  size(1000, 800);
  background(5);
  frameRate(120);


  Bob = new Spaceship();
  score = 0;
  play = false;
  rTime = new Timer(1000);
  rTime.start();
  gOTime = new Timer(500);
  puTime = new Timer(30000);
  gOvr = loadImage("loser.png");
  John = new SoundFile(this, "laser.wav");
  Power=1;
  level = Power;
  sTime = new Timer(50);
}

void levelUp () {
  rTime.totalTime-=Power*10;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s= stars.get(i);
      s.display();
      s.move();
      if (s.reachedLeft()) {
        stars.remove(s);
      }
    }
    noCursor();
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.reachedLeft()) {
        powups.remove(pu);
      }
      if (pu.intersect(Bob)) {
        powups.remove(pu);
        Power += 1;
        levelUp();
        Bob.health+=10;
      }
    }


    // lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j< rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r)) {
          lasers.remove(laser);
          r.health-=100;
          r.diam=r.diam/2;
        }

        laser.display();
        laser.move();
      }
      if (laser.reachedRight()) {
        lasers.remove(laser);
      }
    }


    // rocks
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (Bob.intersect(rock)) {
        Bob.health-=10;
        score+=5;
        rock.health-=100000;
      }
      if (rock.reachedLeft()) {
        rocks.remove(i);
      }

      if (rock.health<=0) {
        rocks.remove(i);
        score+=5;
      }
    }

    Bob.display();
    Bob.move(mouseX, mouseY);
    if (Bob.health<=0) {
      gameOver();
    }
  }
  infoPanel();
}


void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(35);
  text("Score:" + score, 20, 36);
  text("Health:" + Bob.health, 160, 36);
  text("Level:" + Power, 350, 36);
  text("Ammo:" + Bob.laserCount, 500, 36);
}

void startScreen() {
  background(0);
  textMode(CENTER);
  text("Space Game By Tyson Lowe", width/2, height/2);
  text("Press The Mouse To Start", width/2, height/2+40);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  gOvr.resize(width, height);
  image(gOvr, width/2, height/2);
}



void mousePressed() {
  if (!John.isPlaying()) {
    John.play();
  }
  if (Bob.laserCount>0) {
    if (Power==1) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
    } else if (Power==2) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
    } else if (Power==3) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
    } else if (Power==4) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
    } else if (Power==5) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
    } else if (Power==6) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
    } else if (Power==7) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
      lasers.add(new Laser(Bob.x-20, Bob.y+20));
    } else if (Power==8) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
      lasers.add(new Laser(Bob.x-20, Bob.y+20));
      lasers.add(new Laser(Bob.x-20, Bob.y+55));
    } else if (Power==9) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
      lasers.add(new Laser(Bob.x-20, Bob.y+20));
      lasers.add(new Laser(Bob.x-20, Bob.y+55));
      lasers.add(new Laser(Bob.x-20, Bob.y+15));
    } else if (Power==10) {
      lasers.add(new Laser(Bob.x-20, Bob.y+35));
      lasers.add(new Laser(Bob.x-20, Bob.y+40));
      lasers.add(new Laser(Bob.x-20, Bob.y+30));
      lasers.add(new Laser(Bob.x-20, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
      lasers.add(new Laser(Bob.x-20, Bob.y+20));
      lasers.add(new Laser(Bob.x-20, Bob.y+55));
      lasers.add(new Laser(Bob.x-20, Bob.y+15));
      lasers.add(new Laser(Bob.x-20, Bob.y+60));
    } else {
      lasers.add(new Laser(Bob.x-30, Bob.y+35));
      lasers.add(new Laser(Bob.x-30, Bob.y+40));
      lasers.add(new Laser(Bob.x-30, Bob.y+30));
      lasers.add(new Laser(Bob.x-30, Bob.y+45));
      lasers.add(new Laser(Bob.x-30, Bob.y+25));
      lasers.add(new Laser(Bob.x-30, Bob.y+50));
      lasers.add(new Laser(Bob.x-30, Bob.y+20));
      lasers.add(new Laser(Bob.x-30, Bob.y+55));
      lasers.add(new Laser(Bob.x-30, Bob.y+15));
      lasers.add(new Laser(Bob.x-30, Bob.y+60));
      lasers.add(new Laser(Bob.x-30, Bob.y+35));
      lasers.add(new Laser(Bob.x-30, Bob.y+40));
      lasers.add(new Laser(Bob.x-30, Bob.y+30));
      lasers.add(new Laser(Bob.x-30, Bob.y+45));
      lasers.add(new Laser(Bob.x-20, Bob.y+25));
      lasers.add(new Laser(Bob.x-20, Bob.y+50));
      lasers.add(new Laser(Bob.x-20, Bob.y+20));
      lasers.add(new Laser(Bob.x-20, Bob.y+55));
      lasers.add(new Laser(Bob.x-20, Bob.y+15));
      lasers.add(new Laser(Bob.x-20, Bob.y+60));
    }


    Bob.laserCount-=Power;
  }
}
