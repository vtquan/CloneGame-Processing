class Clone{
  int posX;
  int posY;
  int objWidth = 10;
  int objHeight = 10;
  final color STROKE = color(72,0,124);
  final color FILL = color(72,0,124);
  int frameOfCreation;  //frame that clone object is created on
  Player source;  //the player that the clone follow
  PImage[] img = new PImage[4];
  int currentFrame;
  float currentAngle;
  
  Clone()
  {
    posX = 0;
    posY = 0;
    this.frameOfCreation = frameCount;
  }
  
  Clone(Player source)
  {
    this.source = source;
    this.posX = 0;
    this.posY = 0;
    this.frameOfCreation = frameCount;
    img[0] = loadImage("Dino/dino1.png");
    img[1] = loadImage("Dino/dino2.png");
    img[2] = loadImage("Dino/dino3.png");
    img[3] = loadImage("Dino/dino4.png");
    currentFrame = int(random(0,4));
  }
  
  void updateClone()
  {
    posX = source.savedPosX.get(frameCount - frameOfCreation);
    posY = source.savedPosY.get(frameCount - frameOfCreation);
    if(source.savedPosX.get(frameCount+1 - frameOfCreation) - posX != 0 || source.savedPosY.get(frameCount+1 - frameOfCreation) - posY != 0)  //don't animate when staying still
    {
      if(frameCount % int(frameRate/4) == 0)  
        currentFrame = ++currentFrame % img.length;
    }    
    
    //change rotation
    if(!game.end)
    {
      if(source.savedPosX.get(frameCount+1 - frameOfCreation) - posX != 0 || source.savedPosY.get(frameCount+1 - frameOfCreation) - posY != 0)  //don't rotate when staying still
      {
        if(frameCount - frameOfCreation == 0)
          currentAngle = atan2(source.savedPosX.get(frameCount+1 - frameOfCreation) - posX, posY - source.savedPosY.get(frameCount+1 - frameOfCreation));
        else
          currentAngle = atan2(posX - source.savedPosX.get(frameCount-1 - frameOfCreation), source.savedPosY.get(frameCount-1 - frameOfCreation) - posY);
      }
    }
  }
  
  void drawClone()
  {    
    beginShape();
    pushMatrix();
    translate(posX,posY);
    rotate(currentAngle);
    image(img[currentFrame],0,0);
    popMatrix();
    endShape();    
  }
  
  void drawClone(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(posX,posY,objWidth,objHeight);
  }
}
