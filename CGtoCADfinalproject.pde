/*

 参考サイト
 https://qiita.com/akspect/items/6a574e12181c00125d40
 https://qiita.com/tobira-code/items/49553738a1ce89579fec
 https://www.openprocessing.org/sketch/394718
 https://processing.org/reference/PVector.html
 https://processing.org/reference/image_.html
 https://processing.org/reference/blendMode_.html
 http://www.sojamo.de/libraries/controlP5
 http://wakariyasui.sakura.ne.jp/p/mech/bannyuu/jinnkou.html
 http://wakariyasui.sakura.ne.jp/p/mech/bannyuu/jinnkou_ho.html
 http://www.enjoy.ne.jp/~k-ichikawa/Satellite_GS.html
 http://www.jma-net.go.jp/sat/himawari/himawari89_system.html
 https://ja.wikipedia.org/wiki/%E3%81%B2%E3%81%BE%E3%82%8F%E3%82%8A_(%E6%B0%97%E8%B1%A1%E8%A1%9B%E6%98%9F)
 https://ja.wikipedia.org/wiki/%E9%9D%99%E6%AD%A2%E8%BB%8C%E9%81%93
 
 */

import controlP5.*;

ControlP5 Button;

int bNUM = 4500;
int bNUM3 = 2800;
Ball[] ball1 = new Ball[bNUM3];
Ball[] ball2 = new Ball[bNUM3];
Ball[] ball4 = new Ball[bNUM];
Ball2[] ball3 = new Ball2[bNUM3];
Himawari hima;
int state =  0;

void setup() {
  size(1280, 720, P3D);
  frameRate(60);
  hima = new Himawari();
  background(0);

  Button = new ControlP5(this);
  Button.addButton("1")
    .setLabel("1 Button")
    .setPosition(10, 10)
    .setSize(100, 40)
    .setColorBackground(0)
    .setColorForeground(0)
    .setColorCaptionLabel(color(122, 255, 222)); 
  Button.addButton("2")
    .setLabel("2 Button")
    .setPosition(10, 50)
    .setSize(100, 40)
    .setColorBackground(0)
    .setColorForeground(0)
    .setColorCaptionLabel(color(122, 255, 222)); 
  Button.addButton("3")
    .setLabel("3 Button")
    .setPosition(10, 90)
    .setSize(100, 40)
    .setColorBackground(0)
    .setColorForeground(0)
    .setColorCaptionLabel(color(122, 255, 222)); 
  Button.addButton("4")
    .setLabel("4 Button")
    .setPosition(10, 130)
    .setSize(100, 40)
    .setColorBackground(0)
    .setColorForeground(0)
    .setColorCaptionLabel(color(122, 255, 222));
}

void draw() {
  if (state == 1) {
    background(0);

    hima.draw();
  } else if (state ==2) {

    for (int i = 0; i < ball1.length; i++) {
      ball1[i].draw();
      ball2[i].draw();
    }
  } else if (state ==3) {
    background(0);
    for (int i = 0; i < ball3.length; i++) {
      ball3[i].draw();
    }
  } else if (state ==4) {
    for (int i = 0; i < ball4.length; i++) {
      ball4[i].draw();
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().getName() == "1") {
    state =1;
    blendMode(BLEND);
    fill(0);
  }
  if (theEvent.getController().getName() == "2") {
    state =2;
    noStroke(); 
    fill(0);
    background(0);
    blendMode(ADD);
    for (int i = 0; i < bNUM3; i++) {
      ball1[i] = new Ball(width/4, height/2, 10, 10, 0.95, 0.95, 4, 4, true);
    }
    for (int j = 0; j< bNUM3; j++) {
      ball2[j] = new Ball((width*3)/4, height/2, 10, 10, 0.95, 0.95, 4, 4, false);
    }
  }
  if (theEvent.getController().getName() == "3") {
    state =3;
    noStroke(); 
    fill(0);
    background(0);
    blendMode(ADD);
    for (int i = 0; i < bNUM3; i++) {
      ball3[i] = new Ball2(random(width), random(height), 10, 10, 0.95, 0.95, 20, 30);
    }
  }
  if (theEvent.getController().getName() == "4") {
    state =4;
    noStroke(); 
    fill(0);
    background(0);
    blendMode(ADD);
    for (int i = 0; i < bNUM; i++) {
      ball4[i] = new Ball(0, 0, 80, 110, 0.40, 0.80, 1, 1, true);
    }
  }
}