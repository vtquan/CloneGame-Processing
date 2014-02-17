void setup()
{
  size(GAMEWIDTH,GAMEHEIGHT);
  player = new Player(10,10);
  target = new Target(int(random(width)),int(random(height)),10,10);
  frameRate(60);
}

void draw()
{
  background(255);
  if(player.posY > 20 && crossed == false)
  {
    crossed = true;
    startingFrame = frameCount;
  }
  else if(player.posY < 20 && crossed == false)
  {
    line(0,20,width,20);  //start line for clone to appear
  }
  
  if(crossed)
  {
    frameElapsed = frameCount - startingFrame;
    playerPosX.put(frameElapsed, player.posX);
    playerPosY.put(frameElapsed, player.posY);
    
    //creating a clone every DELAY frame
    if((((frameElapsed) % 60) == 0) && frameCount >= (startingFrame+DELAY*FRAMERATE))
    {      
      cloneMap.put(numClone, new Clone(playerPosX.get(frameElapsed),playerPosX.get(frameElapsed),10,10,frameCount));
      numClone++;
    }
  }
    
  for(int i = 0; i < numClone; i++)
  {
    cloneMap.get(i).updateClone(playerPosX, playerPosY);
    cloneMap.get(i).drawClone();
  }
  
  target.drawTarget();
  player.updatePlayer();
  player.drawPlayer();
  
  if(checkTargetDetection())
  {
    score++;
    target = new Target(int(random(width)),int(random(height)),10,10);
  }
  
  if(checkCloneDetection())
  {
    println("survival time: "+frameElapsed+" score: " +score);
    resetGame();
  }
} 

void resetGame()
{
  player = new Player(10,10);
  crossed = false;
  playerPosX = new HashMap<Integer,Integer>();
  playerPosY = new HashMap<Integer,Integer>();
  cloneMap = new HashMap<Integer,Clone>();
  target = new Target(int(random(width)),int(random(height)),10,10);
  numClone = 0;
  score = 0;
}

boolean checkCloneDetection()
{
  if(numClone == 0)
    return false;
    
  PGraphics pg = createGraphics(GAMEWIDTH,GAMEHEIGHT);
  boolean result = false;
  
  pg.beginDraw();
  pg.background(255);
  color c = color(0);
  
  for(int i = 0; i < numClone; i++)
  {
    cloneMap.get(i).drawClone(pg);
  }
  
  //checking the 4 corner of the player to see if the pixel is not the same as background
  if(pg.get(player.posX - int(player.objWidth/2), player.posY - int(player.objHeight/2)) == cloneMap.get(0).FILL)  //check top left corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX - int(player.objWidth/2), player.posY + int(player.objHeight/2)) == cloneMap.get(0).FILL)  //check top right corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX + int(player.objWidth/2), player.posY - int(player.objHeight/2)) == cloneMap.get(0).FILL)  //check bottom left corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX + int(player.objWidth/2), player.posY + int(player.objHeight/2)) == cloneMap.get(0).FILL)  //check bottom right corner of player
  {
    result = true;
  }
  pg.endDraw();
  return result;
}

boolean checkTargetDetection()
{
  PGraphics pg = createGraphics(GAMEWIDTH,GAMEHEIGHT);
  boolean result = false;
  
  pg.beginDraw();
  pg.background(255);
  
  target.drawTarget(pg);
  
  //checking the 4 corner of the player to see if the pixel is not the same as background
  if(pg.get(player.posX - int(player.objWidth/2), player.posY - int(player.objHeight/2)) == target.FILL)  //check top left corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX - int(player.objWidth/2), player.posY + int(player.objHeight/2)) == target.FILL)  //check top right corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX + int(player.objWidth/2), player.posY - int(player.objHeight/2)) == target.FILL)  //check bottom left corner of player
  {
    result = true;
  }
  else if(pg.get(player.posX + int(player.objWidth/2), player.posY + int(player.objHeight/2)) == target.FILL)  //check bottom right corner of player
  {
    result = true;
  }
  pg.endDraw();
  return result;
}



  
