void hudDraw()
{
  hud.beginDraw();
  hud.clear();
  hud.textFont(mcRegular);
  
  if(!thirdPerson) drawCrosshair();
  drawMinimap();
  drawExtraInfo();
  
  //damage indicator
  hud.noStroke();
  hud.fill(255, 55, 55, dmgAlpha);
  hud.rect(0, 0, width, height);
  if(dmgAlpha > 0) dmgAlpha -= 15;
  
  hud.endDraw();
}

void drawCrosshair()
{
  hud.stroke(white);
  hud.strokeWeight(3.5);
  
  hud.line(width / 2 - 10, height / 2, width / 2 + 10, height / 2);
  hud.line(width / 2, height / 2 - 10, width / 2, height / 2 + 10);
}

void drawMinimap()
{
  hud.noFill();
  hud.stroke(black);
  hud.strokeWeight(10);
  hud.rect(50, 50, 200, 200);
  
  hud.image(wallMap, 50, 50, 200, 200);
  
  int mapX = int((thirdPerson ? camFocusPos.x : camPos.x) + (blockSize * blockSize) / 2) / blockSize;
  int mapY = int((thirdPerson ? camFocusPos.z : camPos.z) + (blockSize * blockSize) / 2) / blockSize;
  
  hud.textSize(64);
  hud.fill(white);
  hud.text("(" + mapX + ", " + mapY + ")", 50, 300); //coordinates
  
  hud.stroke(255, 55, 55);
  hud.strokeWeight(4);
  hud.fill(255, 55, 55);
  hud.rect(50 + mapX * 2, 50 + mapY * 2, 2, 2);
}

void drawExtraInfo()
{
  hud.textSize(64);
  hud.fill(white);
  
  hud.text("fps: " + String.valueOf(frameRate).substring(0, String.valueOf(frameRate).indexOf('.')), 50, 350); //fps counter
  hud.text("lives: " + pLives, 50, 400);
}

void pDamage()
{
  pLives--;
  dmgAlpha = 200;
  
  if(pLives <= 0)
  {
    dmgAlpha = 128;
    gameOverSetup();
    mode = GAMEOVER;
  }
}
