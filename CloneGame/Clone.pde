class Clone{
  int xPos;
  int yPos;
  int objWidth = 10;
  int objHeight = 10;
  final color STROKE = color(72,0,124);
  final color FILL = color(72,0,124);
  int frameOfCreation;  //frame that clone object is created on
  Player source;  //the player that the clone follow
  PImage[] img = new PImage[4];
  int currentFrame;
  boolean dead = false;
  float currentAngle = PI;
  int xPrev = -1;
  int yPrev = -1;
  
  Clone()
  {
    xPos = 0;
    yPos = 0;
    this.frameOfCreation = frameCount;
  }
  
  Clone(Player source)
  {
    this.source = source;
    this.xPos = 0;
    this.yPos = 0;
    this.frameOfCreation = frameCount;
    img[0] = loadImage("Dino/dino1.png");
    img[1] = loadImage("Dino/dino2.png");
    img[2] = loadImage("Dino/dino3.png");
    img[3] = loadImage("Dino/dino4.png");
    currentFrame = int(random(0,4));
  }
  
  void updateClone()
  {
    if(!dead)
    {
      xPrev = xPos;
      yPrev = yPos;
      
      xPos = source.savedXPos.get(frameCount - frameOfCreation);
      yPos = source.savedYPos.get(frameCount - frameOfCreation);
      if(source.savedXPos.get(frameCount+1 - frameOfCreation) - xPos != 0 || source.savedYPos.get(frameCount+1 - frameOfCreation) - yPos != 0)  //don't animate when staying still
      {
        if(frameCount % int(frameRate/3) == 0)  
          currentFrame = ++currentFrame % img.length;
      }    
      
      //change rotation
      if(!game.end)
      {
        if(xPos - xPrev != 0 || yPrev - yPos != 0)  //don't rotate when staying still
        {
          currentAngle = atan2(xPos - xPrev, yPrev - yPos);
        }
      }
      if(tileSheet.detectCloneLavaCollision(this))
        dead = true;
    }
  }
  
  void drawClone()
  {    
    if(!dead)
    {
      pushMatrix();
      translate(xPos,yPos);
      rotate(currentAngle);
      image(img[currentFrame],0,0);
      popMatrix();
    }  
  }
  
  void drawClone(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    if(!dead)
    {
      pg.stroke(STROKE);
      pg.fill(FILL);
      pg.rect(xPos,yPos,objWidth,objHeight);
    }
  }
}
