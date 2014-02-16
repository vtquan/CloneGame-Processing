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
    line(0,20,width,20);
  }
  
  if(crossed)
  {
  frameElapsed = frameCount - startingFrame;
    mousePosX.put(frameElapsed, mouseX);
    mousePosY.put(frameElapsed, mouseY);
    
    //creating a clone every DELAY frame
    if((((frameElapsed) % 60) == 0) && frameCount >= (startingFrame+DELAY*FRAMERATE))
    {      
      if(numClone < 10) {
        cloneMap.put(numClone, new Clone(mousePosX.get(frameElapsed),mousePosX.get(frameElapsed),10,10,frameCount));
        numClone++;
      }
    }
    
    for(int i = 0; i < numClone; i++)
    {
      cloneMap.get(i).updateClone(mousePosX, mousePosY);
      cloneMap.get(i).drawClone();
    }
  }
  player.updatePlayer();
  println(player.posX);
  player.drawPlayer();
}   


  
