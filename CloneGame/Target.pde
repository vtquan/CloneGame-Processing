class Target {
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  final color STROKE = color(255,199,0);
  final color FILL = color(255,199,0);
  
  Target()
  {
    SurfaceTile surfaceTile = new SurfaceTile();
    this.posX = int(random(width));
    this.posY = int(random(height));
    int col = posX / surfaceTile.objWidth;
    int row = posY / surfaceTile.objHeight;

    while(tileSheet.tileSheetVisual[row][col] != 0)  //prevent unreachable target
    {
      this.posX = int(random(width));
      this.posY = int(random(height));
      col = posX / surfaceTile.objWidth;
      row = posY / surfaceTile.objHeight;
    }
    this.objWidth = 10;
    this.objHeight = 10;
  }
  
  Target(int posX,int posY,int objWidth,int objHeight)
  {
    this.posX = posX;
    this.posY = posY;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void drawTarget()
  {
    rectMode(CENTER);
    stroke(STROKE);
    fill(FILL);
    rect(posX,posY,objWidth,objHeight);
  }
  
  void drawTarget(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.rectMode(CENTER);
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(posX,posY,objWidth,objHeight);
  }
  
  boolean detectCollision(Player player)
  {
    PGraphics pg = createGraphics(game.GAMEWIDTH,game.GAMEHEIGHT);
    boolean result = false;
    
    pg.beginDraw();
    pg.background(255);
    
    target.drawTarget(pg);
    
    //checking the 4 corner of the player to see if the pixel is not the same as background
    if(pg.get(player.posX - int(player.objWidth/2), player.posY - int(player.objHeight/2)) == FILL)  //check top left corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX - int(player.objWidth/2), player.posY + int(player.objHeight/2)) == FILL)  //check top right corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY - int(player.objHeight/2)) == FILL)  //check bottom left corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY + int(player.objHeight/2)) == FILL)  //check bottom right corner of player
    {
      result = true;
    }
    pg.endDraw();
    return result;
  }
}
