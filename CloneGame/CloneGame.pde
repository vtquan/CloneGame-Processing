void setup()
{
  game = new Game();
  size(game.GAMEWIDTH,game.GAMEHEIGHT,P3D);
  tileSheet = new TileSheet();
  player = new Player(10,10);
  target = new Target();
  cloneMap = new CloneMap(player);
  frameRate(game.FRAMERATE);
  rectMode(CENTER);
  pg = createGraphics(game.GAMEWIDTH,game.GAMEHEIGHT);
  pg.rectMode(CENTER);
  imageMode(CENTER);
    
  minim = new Minim(this);
  groove = minim.loadFile("Music/Circumspection.mp3");
  burn = minim.loadSample("SoundEffects/Burn.wav");
  explosion = minim.loadSample("SoundEffects/Explosion.wav");
  thruster = minim.loadSample("SoundEffects/Thruster.wav");
  pickup = minim.loadSample("SoundEffects/Pickup.wav");
  groove.play();
}

void draw()
{
  background(255);
  tileSheet.display();
//  if(player.yPos > 20 && game.crossed == false)
//  {
//    game.crossed = true;
//    game.startingFrame = frameCount;
//  }
//  else if(player.yPos < 20 && game.started == false)
//  {
//    stroke(0);
//    line(0,20,width,20);  //start line for clone to appear
//  }
    
  if((frameCount > (game.startFrame + 60) && !game.end) || (game.end && frameCount > (game.endFrame + 60)))
  {
    if(game.end)
      game.reset();
    cloneMap.updateMap();
    cloneMap.drawMap();
    
    target.drawTarget();
    player.updatePlayer();
    tileSheet.detectCollision();
    player.drawPlayer();
    
    if(target.detectCollision(player))
    {
      if(game.started == false)
      {
        game.started = true;
        game.startingFrame = frameCount;
      }
      else
        cloneMap.addClone();  //don't create the clone upon picking up the first target
        
      pickup.trigger();
      game.score++;
      target = new Target();
    }
    
    if(cloneMap.detectCollision(player))
    {
      explosion.trigger();
      game.end = true;
      game.endFrame = frameCount;
    }
  }
  else  //draw everything when game end but do not update them
  {
    player.drawPlayer();
    target.drawTarget();
    cloneMap.drawMap();
  }
  
  if(game.started && !game.end)
  {
    game.frameElapsed = frameCount - game.startingFrame;
    player.savedxPos.put(game.frameElapsed, player.xPos);
    player.savedyPos.put(game.frameElapsed, player.yPos);
    
//    //creating a clone every DELAY frame
//    if((((game.frameElapsed) % 60) == 0) && frameCount >= (game.startingFrame+game.DELAY*game.FRAMERATE))
//    {      
//      cloneMap.addClone();
//    }
  }
  
  game.showScore();
}





  
