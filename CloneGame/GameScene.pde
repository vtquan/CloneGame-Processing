class GameScene extends Scene {
  
  GameScene()
  {
    tileSheet = new TileSheet();
    player = new Player(10,10);
    target = new Target();
    cloneMap = new CloneMap(player);
      
    groove = minim.loadFile("Music/Circumspection.mp3");
    burn = minim.loadSample("SoundEffects/Burn.wav");
    explosion = minim.loadSample("SoundEffects/Explosion.wav");
    thruster = minim.loadSample("SoundEffects/Thruster.wav");
    pickup = minim.loadSample("SoundEffects/Pickup.wav");
    groove.play();
  }
  
  void update()
  {
    if(game.end)
      game.reset();
    else
    {
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
        cloneMap.updateMap();
        
        player.updatePlayer();
        tileSheet.detectCollision();
        
        if(target.detectCollision(player))
        {
          if(game.started == false)
          {
            game.started = true;
            game.startingFrame = frameCount;
          }
            
          pickup.trigger();
          game.score++;
          target = new Target();
        }
        
        if(cloneMap.detectCollision(player) && game.end == false)
        {
          explosion.trigger();
          game.end = true;
          game.endFrame = frameCount;
        }
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
    }
  }
  
  void display()
  {
    tileSheet.display();
    if(player.yPos < 20 && game.started == false)
    {
      stroke(0);
      line(0,20,width,20);  //start line for clone to appear
    }
    
    cloneMap.drawMap();
    target.drawTarget();
    player.drawPlayer();
    showScore();
  }
  
  void showScore()
  {
    textAlign(LEFT);
    fill(255);
    textSize(14);
    text("survival time: "+game.frameElapsed+" score: " +game.score, 10, 10); 
  }
}
