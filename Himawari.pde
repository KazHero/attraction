class Himawari {
  PVector location;
  PImage img;
  PImage img2;
  PVector[] star = new PVector[2000];

  float G;
  float g;
  float m;
  float M;
  float h;
  float R;
  float v;
  float v2;
  float w;
  float t;
  float rr;
  float r;
  float light;

  Himawari() { 
    img = loadImage("earth.png");
    img2 = loadImage("himawari.png");


    for (int i=0; i<star.length; i++) {
      star[i] = new PVector(random(width), random(height), round(random(1, 3)));
    }

    t = 0;
    m= 1290;
    M = 5.972 * pow(10, 24);
    R = 6378;
    g = 9.8;
    G =6.67408 *pow(10, -11);

    w = (2 * PI)/(24*60*60);
    println(w);
    r= (float)Math.cbrt((G*M)/(w*w));
    h =( r/1000) - R;
    println(h);
    v = sqrt((G*M)/(R+h));

    v2 = sqrt((g*R*R)/(R+h));
    println(v, v2);
    rr= h+R;
    location = new PVector(0, 0);
  }

  void draw() {
    fill(0, 255, 255);
    textSize(16);
    text("location.X :"+hima.location.x+(width/2), 1080, 30);
    text("location.Y :"+hima.location.y+(height/2), 1080, 50);

    for (int i=0; i<star.length; i++) {
      if (i % 1 ==0) {
        light =0;
        for (int j =0; j<8; j++) {
          light += random(140);
        }
        noStroke();
        fill(abs(cos(t/3000))*30+(light / 8));
        ellipse(star[i].x, star[i].y, star[i].z, star[i].z);
      } else {
        noStroke();
        fill(255);  
        ellipse(star[i].x, star[i].y, star[i].z, star[i].z);
      }
    }

    t +=100;
    location.x = rr/200*cos(w*t);
    location.y = rr/200*sin(w*t);
    image(img, width/2, height/2, R/200, R/200 );

    image(img2, location.x+(width/2), location.y+ (height/2), 10, 10);
  }
}