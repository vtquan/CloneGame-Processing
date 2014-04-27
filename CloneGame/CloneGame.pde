void setup()
{
  game = new Game();
  size(game.GAMEWIDTH,game.GAMEHEIGHT,P3D);
  tileSheet = new TileSheet();
  player = new Player(10,10);
  target = new Target();
  cloneMap = new CloneMap(player);
  keyManager = new KeyManager();
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
  if(player.yPos > 20 && game.started == false)
  {
    game.started = true;
    game.startingFrame = frameCount;
    game.nextCloneSpawnFrame = frameCount + int(game.cloneDelay * game.FRAMERATE);
  }
  else if(player.yPos < 20 && game.started == false)
  {
    stroke(0);
    line(0,20,width,20);  //start line for clone to appear
  }
    
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
//      else
//        cloneMap.addClone();  //don't create the clone upon picking up the first target
        
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
    player.savedXPos.put(game.frameElapsed, player.xPos);
    player.savedYPos.put(game.frameElapsed, player.yPos);
    
    //creating a clone every DELAY frame
    if(frameCount == game.nextCloneSpawnFrame)
    {              
      cloneMap.addClone();
      
      game.nextCloneSpawnFrame = frameCount + int(game.cloneDelay * game.FRAMERATE);
    }
  }
  
    Button button = new Button(width/2, height/2, 200, 50, "Hello");
    button.display();
  game.showScore();
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
    keyManager.right = true;
  if(key == 'a' || key == 'A')
    keyManager.left = true;
    
  if(key == 's' || key == 'S')
    keyManager.down = true;
  if(key == 'w' || key == 'W')
    keyManager.up = true;
}

void keyReleased()
{
  if(key == 'd' || key == 'D')
    keyManager.right = false;
  if(key == 'a' || key == 'A')
    keyManager.left = false;
    
  if(key == 's' || key == 'S')
    keyManager.down = false;
  if(key == 'w' || key == 'W')
    keyManager.up = false;
}



  
