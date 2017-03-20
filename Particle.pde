class Particle
{
  PVector location;
  float len;
  float noise_x;
  float noise_y;
  float noise_z;
  float noise_value;
  color body_color;
  
  Particle(float l, color c)
  {
    location = new PVector(0, 0, 0);
    len = l;
    
    noise_x = random(100);
    noise_y = random(100);
    noise_z = random(100);
    
    noise_value = random(0.001, 0.01);
    
    body_color = c;
  }
  
  void update()
  {
    float x = map(noise(noise_x), 0, 1, -200, 200);
    float y = map(noise(noise_y), 0, 1, -200, 200);
    float z = map(noise(noise_z), 0, 1, -200, 200);
    noise_x += noise_value;
    noise_y += noise_value;
    noise_z += noise_value;
  
    PVector direction = PVector.sub(new PVector(0, 0, 0), new PVector(x, y, z));
    direction.normalize();
    direction.mult(len);
  
    x = direction.x;
    y = direction.y;
    z = direction.z;
    
    location = new PVector(x, y, z);
  }
    
  void display()
  { 
    noStroke();
    fill(body_color, 32);
    
    pushMatrix();
    translate(location.x, location.y, location.z);
    for(int i = 1; i < 10; i++)
    {
      sphere(i * 1.2);
    }
    popMatrix();
  }
}