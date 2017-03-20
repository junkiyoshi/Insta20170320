ArrayList<Particle> particles;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  hint(DISABLE_DEPTH_TEST);
  blendMode(ADD);
  colorMode(HSB);
  
  particles = new ArrayList<Particle>();
}

void draw()
{
  background(0);
  translate(width / 2, height / 2, 0);
  
  float angle = frameCount % 360;
  float camera_x = 500 * cos(radians(angle));
  float camera_z = 500 * sin(radians(angle));   
  camera(camera_x, 0, camera_z, 
         0, 0, 0, 
         0, 1, 0);
  
  particles.add(new Particle(200, color(random(255), 255, 255)));
    
  for(Particle p : particles)
  {
    p.update();
    p.display();
  }
    
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}