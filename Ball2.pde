class Ball2 {
  PVector location;
  PVector velocity;
  PVector acceleration, acceleration2;
  float magnetism, magnetism2 ;
  float radius ;
  float friction; 
  float mass;

  Ball2(float x, float y, float min, float max, float m_min, float m_max, int rmin, int rmax) {
    radius =random(rmin, rmax);

    magnetism =random(min, max);
    magnetism2 =random(min, max);
    friction = random(m_min, m_max); 
    //mass = random(m_min, m_max);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector( 0, 0);
    acceleration2 = new PVector( 0, 0);
  }

  void draw() {
    float distance = sqrt(((mouseX-location.x)*(mouseX-location.x))+((mouseY-location.y)*(mouseY-location.y)))+0.00000000001;
    if (mouseX <= 50 || mouseX >= width-50 || mouseY <=0+50 || mouseY >= height-50) {
      acceleration.x=0;
      acceleration.y=0;
    } else {
      acceleration.x = -radius/2.5*magnetism * (mouseX - location.x) / (distance * distance); 
      acceleration.y = -radius/2.5*magnetism * (mouseY - location.y) / (distance * distance);
    }

    float distance2 = sqrt(((width/2-location.x)*(width/2-location.x))+((height/2-location.y)*(height/2-location.y)))+0.00000000001;
    acceleration2.x = radius/3*magnetism * (width/2 - location.x) / (distance2 * distance2); 
    acceleration2.y = radius/3*magnetism * (height/2 - location.y) / (distance2 * distance2);
    
    
    if (distance2 < 1) {
      velocity.x=0;
      velocity.y=0;
    }
    else if ((location.x <= (width/2)+5 && location.x >= (width/2)-5) && (location.y <= (height/2)+5 && location.y >= (height/2)-5)) {
      velocity.x=0;
      velocity.y=0;
    }else{
      velocity.add(acceleration.x+acceleration2.x,acceleration.y+acceleration2.y).mult(friction); 
    }

    location.add(velocity.x,velocity.y);
    
    float speed = sqrt((velocity.x*velocity.x)+ (velocity.y*velocity.y)); 
    int r = int(map(speed, 0, 5, 0, 255)); 
    int g = int(map(speed, 0, 50, 64, 255));
    int b = int(map(speed, 0, 5, 128, 255));

    fill(r, g, b, 220);
    ellipse(location.x, location.y, radius, radius);
    
    /*
    if (distance2 < 1) {
     int temp = round(random(1, 4));
     if (temp ==1) {
     
     location.x = -50;
     location.y = random(height);
     } else if (temp==2) {
     location.x = 1320;
     location.y = random(height);
     } else if (temp==3) {
     location.x = random(width);
     location.y = -50;
     } else {
     location.x = random(width);
     location.y = 760;
     }
     velocity.x=0;
     velocity.y=0;
     }
     
     if ((location.x <= (width/2)+5 && location.x >= (width/2)-5) && (location.y <= (height/2)+5 && location.y >= (height/2)-5)) {
     int temp = round(random(1, 4));
     if (temp ==1) {
     
     location.x = -50;
     location.y = random(height);
     } else if (temp==2) {
     location.x = 1320;
     location.y = random(height);
     } else if (temp==3) {
     location.x = random(width);
     location.y = -50;
     } else {
     location.x = random(width);
     location.y = 760;
     }
     velocity.x=0;
     velocity.y=0;
     }
     */
  }
}