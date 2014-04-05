class CloneMap{
  HashMap<Integer,Clone> cloneMap;
  Player source;
  int numClone;
  
  CloneMap(Player source)
  {
    this.source = source;
    cloneMap = new HashMap<Integer,Clone>();
    numClone = 0;
  }
  
  void addClone()
  {
    cloneMap.put(numClone, new Clone(source));
    numClone++;
  }
  
  void updateMap(HashMap<Integer,Integer> savedPosX, HashMap<Integer,Integer> savedPosY)
  {
    for (int i = 0; i < numClone; i++)
    {
      cloneMap.get(i).updateClone();
    }
  }
  
  void drawMap()
  {
    for (int i = 0; i < numClone; i++)
    {
      cloneMap.get(i).drawClone();
    }
  }
  
  void drawMap(PGraphics pg)
  {
    pg.background(255);
    for (int i = 0; i < numClone; i++)
    {
      cloneMap.get(i).drawClone(pg);
    }
  }
  
  color getFill()
  {
    Clone clone = new Clone();
    return clone.FILL;
  }
  
  int getNumClone()
  {
    return numClone;
  }
  
  boolean detectCollision(Player player)  //detect collision with player
  {
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
  
  boolean detectCollision()  //detect collision with lava
  {
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
