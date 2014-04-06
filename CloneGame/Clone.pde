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
  float currentAngle;
  
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
    xPos = source.savedxPos.get(frameCount - frameOfCreation);
    yPos = source.savedyPos.get(frameCount - frameOfCreation);
    if(source.savedxPos.get(frameCount+1 - frameOfCreation) - xPos != 0 || source.savedyPos.get(frameCount+1 - frameOfCreation) - yPos != 0)  //don't animate when staying still
    {
      if(frameCount % int(frameRate/4) == 0)  
        currentFrame = ++currentFrame % img.length;
    }    
    
    //change rotation
    if(!game.end)
    {
      if(source.savedxPos.get(frameCount+1 - frameOfCreation) - xPos != 0 || source.savedyPos.get(frameCount+1 - frameOfCreation) - yPos != 0)  //don't rotate when staying still
      {
        if(frameCount - frameOfCreation == 0)
          currentAngle = atan2(source.savedxPos.get(frameCount+1 - frameOfCreation) - xPos, yPos - source.savedyPos.get(frameCount+1 - frameOfCreation));
        else
          currentAngle = atan2(xPos - source.savedxPos.get(frameCount-1 - frameOfCreation), source.savedyPos.get(frameCount-1 - frameOfCreation) - yPos);
      }
    }
  }
  
  void drawClone()
  {    
    beginShape();
    pushMatrix();
    translate(xPos,yPos);
    rotate(currentAngle);
    image(img[currentFrame],0,0);
    popMatrix();
    endShape();    
  }
  
  void drawClone(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(xPos,yPos,objWidth,objHeight);
  }
}
