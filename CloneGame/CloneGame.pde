void setup()
{
  size(400,300);
  player = new Player(10,10);
  frameRate(FRAMERATE);
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
    
    for(int i = 0; i < numClone; i++)
    {
      cloneMap.get(i).updateClone(playerPosX, playerPosY);
      cloneMap.get(i).drawClone();
    }
  }
  player.updatePlayer();
  player.drawPlayer();
}   


  
