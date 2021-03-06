class Particle extends Object
{
  PVector dir;
  float speed, alphaSpeed, deceleration, gravity, gravitySpeed;
  
  public Particle(PVector pos)
  {
    super();
    
    this.pos = pos;
    dir = new PVector(random(-10, 10), random(-10, 1), random(-10, 10));
    speed = random(5, 10);
    colour = white;
    size = random(2, 6);
    alpha = random(200, 255);
    alphaSpeed = random(10, 15);
    deceleration = random(0.01, 0.1);
    gravity = random(0.5, 1.5);
    gravitySpeed = random(0.1, 0.5);
  }
  
  void show()
  {
    super.show();
  }
  
  void act()
  {
    if(alpha >= 0) alpha -= alphaSpeed;
    else hp = 0;
    
    if(pos.y >= blockSize)
    {
      dir.setMag(speed);
      pos.add(dir);
      
      if(speed > 0) speed -= deceleration;
      else speed = 0;
      
      pos.y += gravity;
      gravity += gravitySpeed;
    }
  }
}
