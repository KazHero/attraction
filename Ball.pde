class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float magnetism ;
  float radius ;
  float friction; 
  float mass;
  boolean han;

  Ball(float x, float y, float min, float max, float m_min, float m_max, int rmin, int rmax, boolean a) {
    radius =random(rmin, rmax);
    han=a;
    magnetism =random(min, max);
    friction = random(m_min, m_max); 
    //mass = random(m_min, m_max);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector( 0, 0);
  }

  void draw() {

    float distance = sqrt(((mouseX-location.x)*(mouseX-location.x))+((mouseY-location.y)*(mouseY-location.y)));
    if (distance>3 && han==true) {
      acceleration.x = magnetism * (mouseX - location.x) / (distance * distance); 
      acceleration.y = magnetism * (mouseY - location.y) / (distance * distance);
    } else if (distance>3 && han==false) {
      acceleration.x = -magnetism * (mouseX - location.x) / (distance * distance); 
      acceleration.y = -magnetism * (mouseY - location.y) / (distance * distance);
    }    
    
    velocity.add(acceleration.x,acceleration.y).mult(friction);
    location.add(velocity.x,velocity.y);

    float speed = sqrt((velocity.x*velocity.x)+ (velocity.y*velocity.y)); 

    int r = int(map(speed, 0, 5, 0, 255)); 
    int g = int(map(speed, 0, 50, 64, 255));
    int b = int(map(speed, 200, 5, 128, 255));

    fill(r, g, b, 32);
    ellipse(location.x, location.y, radius, radius);
  }
}