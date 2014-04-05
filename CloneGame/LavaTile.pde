class LavaTile extends Tile {
  PImage[] img = new PImage[45];
  int currentFrame = int(random(0,45));
  int currentTint = int(random(0,256));
  int coolFrame;
  boolean cool = false;
  boolean coolingState = true;
  
  LavaTile()
  {
    super(color(255), color(255,0,0));
  }
  
  LavaTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(255), color(255,0,0), posX, posY, objWidth, objHeight);
    
    for(int i = 0; i < 45; i++)
    {
      img[i] = loadImage("Lava/fire_00"+trim(nfs(i, 2))+".jpg");
    }
    currentFrame = int(random(0,45));
  }
  
  void display()  //override Tile display 
  {
    
    tint(currentTint);
    image(img[currentFrame],posX,posY,objWidth,objHeight);
    currentFrame = ++currentFrame % img.length;
    if(!cool)
    {
      tint(currentTint);
      image(img[currentFrame],posX,posY,objWidth,objHeight);
      currentFrame = ++currentFrame % img.length;
      if(coolingState)
      {
        currentTint--;
        if(currentTint == 30)
        {
          cool = true;
          coolFrame = frameCount;
        }
      }
      else
      {
        currentTint++;
        if(currentTint == 254)
        {
          coolingState = true;
        }
      }
    }
    else
    {
      stroke(0,0,255);
      fill(0,0,255);
      rect(posX,posY,objWidth,objHeight);
      if(frameCount > (coolFrame+100))
      {
        cool = false;
        coolingState = false;
      }
    }
  }
  
  void collisionAction()
  {
    if(!cool)
    {
      burn.trigger();
      game.end = true;
      game.endFrame = frameCount;
    }
  }
}
