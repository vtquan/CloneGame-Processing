Game game;
Player player;
Target target;
CloneMap cloneMap;

void setup()
{
  game = new Game();
  size(game.GAMEWIDTH,game.GAMEHEIGHT);
  player = new Player(10,10);
  target = new Target();
  cloneMap = new CloneMap();
  frameRate(game.FRAMERATE);
}

void draw()
{
  background(255);
  if(player.posY > 20 && game.crossed == false)
  {
    game.crossed = true;
    game.startingFrame = frameCount;
  }
  else if(player.posY < 20 && game.crossed == false)
  {
    line(0,20,width,20);  //start line for clone to appear
  }
  
  if(game.crossed)
  {
    game.frameElapsed = frameCount - game.startingFrame;
    player.savedPosX.put(game.frameElapsed, player.posX);
    player.savedPosY.put(game.frameElapsed, player.posY);
    
    //creating a clone every DELAY frame
    if((((game.frameElapsed) % 60) == 0) && frameCount >= (game.startingFrame+game.DELAY*game.FRAMERATE))
    {      
      cloneMap.addClone(frameCount);
    }
  }
    
  cloneMap.updateMap(player.savedPosX, player.savedPosY);
  cloneMap.drawMap();
  
  target.drawTarget();
  player.updatePlayer();
  player.drawPlayer();
  
  if(target.checkDetection(player))
  {
    game.score++;
    target = new Target(int(random(width)),int(random(height)),10,10);
  }
  
  if(cloneMap.checkDetection(player))
  {
    println("survival time: "+game.frameElapsed+" score: " +game.score);
    game.reset();
  }
}





  
