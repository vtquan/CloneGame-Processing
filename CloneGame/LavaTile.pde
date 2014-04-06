class LavaTile extends Tile {
  PImage[] img = new PImage[45];
  PImage[] coolImg = new PImage[4];
  int currentFrame = int(random(0,45));
  int coolImageIndex = int(random(0,4));
  int currentAlpha = int(random(0,256));
  int coolFrame;
  boolean cool = false;
  boolean coolingState = true;
  float cooledTime = 2.5;  //how long lava remain cooled in second
  
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
        currentAlpha--;
        if(currentAlpha <= 30)
        {
          cool = true;
          coolFrame = frameCount;
        }
      }
      else
      {
        currentAlpha++;
        if(currentAlpha >= 254)
        {
          coolingState = true;
          coolImageIndex = int(random(0,coolImg.length));
        }
      }
    }
    else
    {
      if(frameCount > (coolFrame+(cooledTime * game.FRAMERATE)))  //lava remain cool for 2.5 seconds
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
}
