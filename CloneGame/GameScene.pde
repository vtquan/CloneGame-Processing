class MenuScene extends Scene {
  Button startB = new Button(width/2, height/2, 100, 40, "Start");
  
  void update()
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
    sceneManager.update();
    sceneManager.display();
    game.showScore();
  }
  
  void display()
  {
    startB.display();
  }
}
