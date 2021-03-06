class RPrism extends Object //generic rectangular prism
{
  float w, h, d;
  PImage topImg, botImg, frontImg, backImg, leftImg, rightImg;
  
  public RPrism() {} //hmmm
  public RPrism(PVector pos, float size, color colour) //untextured cube
  {
    super();
    
    this.pos = pos;
    w = h = d = size;
    this.colour = colour;
    textured = false;
  }
  public RPrism(PVector pos, float size, PImage texture) //textured cube (same textures on all faces)
  {
    super();
    
    this.pos = pos;
    w = h = d = size;
    this.topImg = this.botImg = this.frontImg = this.backImg = this.leftImg = this.rightImg = texture;
    textured = true;
  }
  public RPrism(PVector pos, float size, PImage topImg, PImage botImg, PImage frontImg, PImage backImg, PImage leftImg, PImage rightImg) //textured cube (different textures on faces)
  {
    super();
    
    this.pos = pos;
    w = h = d = size;
    this.topImg = topImg;
    this.botImg = botImg;
    this.frontImg = frontImg;
    this.backImg = backImg;
    this.leftImg = leftImg;
    this.rightImg = rightImg;
    textured = true;
  }
  public RPrism(PVector pos, float w, float h, float d, color colour) //untextured rectangular prism
  {
    super();
    
    this.pos = pos;
    this.w = w;
    this.h = h;
    this.d = d;
    this.colour = colour;
    textured = false;
  }
  public RPrism(PVector pos, float w, float h, float d, PImage texture) //textured rectangular prism (same texture on all faces)
  {
    super();
    
    this.pos = pos;
    this.w = w;
    this.h = h;
    this.d = d;
    this.topImg = this.botImg = this.frontImg = this.backImg = this.leftImg = this.rightImg = texture;
    textured = true;
  }
  
  void show()
  {
    world.fill(colour);
    
    world.pushMatrix();
    
    world.translate(pos.x, pos.y, pos.z);
    world.rotateX(rX);
    world.rotateY(rY);
    
    if(textured)
    {    
      world.noStroke();
      
      float wi = w / 2, he = h / 2, de = d / 2;
      
      //top    
      world.beginShape(QUADS);
      world.texture(topImg);
      world.vertex(-wi, -he, -de, 0, 0);
      world.vertex(wi, -he, -de, 1, 0);
      world.vertex(wi, -he, de, 1, 1);
      world.vertex(-wi, -he, de, 0, 1);
      world.endShape();
      
      //bottom
      world.beginShape(QUADS);
      world.texture(botImg);
      world.vertex(-wi, he, -de, 0, 0);
      world.vertex(wi, he, -de, 1, 0);
      world.vertex(wi, he, de, 1, 1);
      world.vertex(-wi, he, de, 0, 1);
      world.endShape();
      
      //front
      world.beginShape(QUADS);
      world.texture(frontImg);
      world.vertex(-wi, -he, de, 0, 0);
      world.vertex(wi, -he, de, 1, 0);
      world.vertex(wi, he, de, 1, 1);
      world.vertex(-wi, he, de, 0, 1);
      world.endShape();
      
      //back
      world.beginShape(QUADS);
      world.texture(backImg);
      world.vertex(-wi, -he, -de, 0, 0);
      world.vertex(wi, -he, -de, 1, 0);
      world.vertex(wi, he, -de, 1, 1);
      world.vertex(-wi, he, -de, 0, 1);
      world.endShape();
      
      //left
      world.beginShape(QUADS);
      world.texture(leftImg);
      world.vertex(-wi, -he, -de, 0, 0);
      world.vertex(-wi, -he, de, 1, 0);
      world.vertex(-wi, he, de, 1, 1);
      world.vertex(-wi, he, -de, 0, 1);
      world.endShape();
      
      //right
      world.beginShape(QUADS);
      world.texture(rightImg);
      world.vertex(wi, -he, -de, 0, 0);
      world.vertex(wi, -he, de, 1, 0);
      world.vertex(wi, he, de, 1, 1);
      world.vertex(wi, he, -de, 0, 1);
      world.endShape();
    }
    else
    {
      world.stroke(0);
      world.strokeWeight(2);
      
      world.box(w, h, d);
    }
    
    world.popMatrix();
  }
}
