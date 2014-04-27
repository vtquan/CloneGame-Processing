class Target {
  int xPos;
  int yPos;
  int objWidth;
  int objHeight;
  final color STROKE = color(255,199,0);
  final color FILL = color(186, 47, 184);
  
  Target()
  {
    SurfaceTile surfaceTile = new SurfaceTile();
    this.xPos = int(random(width));
    this.yPos = int(random(height));
    int col = xPos / tileSheet.tileSheet[0][0].objWidth;
    int row = yPos / tileSheet.tileSheet[0][0].objHeight;

    while(tileSheet.tileSheetVisual[row][col] != 0)  //prevent unreachable target
    {
      this.xPos = int(random(width));
      this.yPos = int(random(height));
      col = xPos / surfaceTile.objWidth;
      row = yPos / surfaceTile.objHeight;
    }
    this.objWidth = 15;
    this.objHeight = 15;
  }
  
  Target(int xPos,int yPos,int objWidth,int objHeight)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void drawTarget()
  {
    stroke(STROKE);
    fill(FILL);
    rect(xPos,yPos,objWidth,objHeight);
  }
  
  void drawTarget(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.rectMode(CENTER);
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(xPos,yPos,objWidth,objHeight);
  }
  
  boolean detectCollision(Player player)
  {
    boolean result = false;
    
    pg.beginDraw();
    pg.background(255);
    
    target.drawTarget(pg);
    
    //checking the 4 corner of the player to see if the pixel is not the same as background
    if(pg.get(player.xPos - int(player.objWidth/2), player.yPos - int(player.objHeight/2)) == FILL)  //check top left corner of player
    {
      result = true;
    }
    else if(pg.get(player.xPos - int(player.objWidth/2), player.yPos + int(player.objHeight/2)) == FILL)  //check top right corner of player
    {
      result = true;
    }
    else if(pg.get(player.xPos + int(player.objWidth/2), player.yPos - int(player.objHeight/2)) == FILL)  //check bottom left corner of player
    {
      result = true;
    }
    else if(pg.get(player.xPos + int(player.objWidth/2), player.yPos + int(player.objHeight/2)) == FILL)  //check bottom right corner of player
    {
      result = true;
    }
    pg.endDraw();
    return result;
  }
}
