class FocusIndicator extends Object //focus indicator
{
  float size;
  
  public FocusIndicator(float size)
  {
    this.size = size;
  }
  
  void show()
  {
    if(thirdPerson)
    {
      world.pushMatrix();
      
      pos = camFocusPos;
      world.translate(pos.x, pos.y, pos.z);
      
      world.rotateX(rX);
      world.rotateY(rY);
      
      world.fill(255);
      
      world.sphere(thirdPerson ? size / 2 : size / 44);
  
      
      //DOESN'T WORK, for some odd reason
      
      //noStroke();
      //scale(size);
      
      ////top
      //beginShape(QUADS);
      //texture(diamondImg);
      
      //vertex(0, 0, 0, 0, 0);
      //vertex(1, 0, 0, 1, 0);
      //vertex(1, 0, 1, 1, 1);
      //vertex(0, 0, 1, 0, 1);
      
      ////bottom
      //vertex(0, 1, 0, 0, 0);
      //vertex(1, 1, 0, 1, 0);
      //vertex(1, 1, 1, 1, 1);
      //vertex(0, 1, 1, 0, 1);
      
      ////front
      //vertex(0, 0, 1, 0, 0);
      //vertex(1, 0, 1, 1, 0);
      //vertex(1, 1, 1, 1, 1);
      //vertex(0, 1, 1, 0, 1);
      
      ////back
      //vertex(0, 0, 0, 0, 0);
      //vertex(1, 0, 0, 1, 0);
      //vertex(1, 1, 0, 1, 1);
      //vertex(0, 1, 0, 0, 1);
      
      ////left
      //vertex(0, 0, 0, 0, 0);
      //vertex(0, 0, 1, 1, 0);
      //vertex(0, 1, 1, 1, 1);
      //vertex(0, 1, 0, 0, 1);
      
      ////right
      //vertex(1, 0, 0, 0, 0);
      //vertex(1, 0, 1, 1, 0);
      //vertex(1, 1, 1, 1, 1);
      //vertex(1, 1, 0, 0, 1);
      
      world.popMatrix();
    }
  }
}
