class LavaTile extends Tile {
  PImage[] img = new PImage[45];
  PImage[] coolImg = new PImage[4];
  int currentFrame = int(random(0,45));
  int coolImageIndex = int(random(0,4));
  int currentAlpha = int(random(0,256));
  int coolFrame;
  boolean cool = false;
  boolean coolingState = true;
  float coolDuration = .5;  //how long lava remain cooled in second
  float hotDuration = 2;  //how long between cooled period 
  int transMinPoint = 30;  //point of transparency where lava is cool
  int transMaxPoint = 250;  //point of transparency where lava is cooling
  
  LavaTile()
  {
    super(color(255), color(255,0,0));
  }
  
  LavaTile(int xPos, int yPos, int objWidth, int objHeight)
  {
    super(color(255), color(255,0,0), xPos, yPos, objWidth, objHeight);
    
    for(int i = 0; i < 45; i++)
    {
      img[i] = loadImage("Lava/fire_00"+trim(nfs(i, 2))+".jpg");
    }
    currentFrame = int(random(0,45));
    
    coolImg[0] = loadImage("LavaCooled/cooled1.jpg");
    coolImg[1] = loadImage("LavaCooled/cooled2.jpg");
    coolImg[2] = loadImage("LavaCooled/cooled3.jpg");
    coolImg[3] = loadImage("LavaCooled/cooled4.jpg");
  }
  
  void display()  //override Tile display 
  {
    image(coolImg[coolImageIndex],xPos,yPos,objWidth,objHeight);
    if(!cool)
    {
      tint(255,currentAlpha);
      image(img[currentFrame],xPos,yPos,objWidth,objHeight);
      currentFrame = ++currentFrame % img.length;
      if(coolingState)
      {
        currentAlpha -= ((transMaxPoint - transMinPoint)/((hotDuration / 2)*game.FRAMERATE));
        if(currentAlpha <= transMinPoint)  //Hard to tell the difference in transparency pass 30
        {
          cool = true;
          coolFrame = frameCount;
        }
      }
      else
      {
        currentAlpha += ((transMaxPoint - transMinPoint)/((hotDuration / 2)*game.FRAMERATE));
        if(currentAlpha >= transMaxPoint)
        {
          coolingState = true;
          coolImageIndex = int(random(0,coolImg.length));
        }
      }
    }
    else
    {
      if(frameCount > (coolFrame+(coolDuration * game.FRAMERATE)))  //lava remain cool for cooledDuration seconds
      {
        cool = false;
        coolingState = false;
      }
    }
    tint(255,255);
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
  
  void cloneCollisionAction(Clone clone)  //action to take when clone collided
  {
    if(!cool)
    {
      burn.trigger();
      clone.dead = true;
      coolDuration += .5;
    }
  }
}
