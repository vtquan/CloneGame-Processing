class Tile {
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  final color STROKE;
  final color FILL;
  
  Tile()
  {
    STROKE = color(0);
    FILL = color(0);
    posX = 0;
    posY = 0;
    objWidth = 50;
    objHeight = 50;
  }
  
  checkCollision(Player player)
  {
    PGraphics pg = createGraphics(game.GAMEWIDTH,game.GAMEHEIGHT);
    boolean result = false;
    
    pg.beginDraw();
    pg.background(255);
    color c = color(0);
    
    drawMap(pg);
    
    //checking the 4 corner of the player to see if the pixel is not the same as background
    if(pg.get(player.posX - int(player.objWidth/2), player.posY - int(player.objHeight/2)) == getFill())  //check top left corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX - int(player.objWidth/2), player.posY + int(player.objHeight/2)) == getFill())  //check top right corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY - int(player.objHeight/2)) == getFill())  //check bottom left corner of player
    {
      result = true;
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY + int(player.objHeight/2)) == getFill())  //check bottom right corner of player
    {
      result = true;
    }
    pg.endDraw();
    return result;
  }
}
