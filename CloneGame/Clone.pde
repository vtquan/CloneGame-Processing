class Clone{
  int posX;
  int posY;
  int objWidth = 10;
  int objHeight = 10;
  final color STROKE = color(72,0,124);
  final color FILL = color(72,0,124);
  int frameOfCreation;  //frame that clone object is created on
  Player source;  //the player that the clone follow
  
  Clone()
  {
    posX = 0;
    posY = 0;
    this.frameOfCreation = frameOfCreation;
  }
  
  Clone(Player source)
  {
    this.source = source;
    this.posX = 0;
    this.posY = 0;
    this.frameOfCreation = frameCount;
  }
  
  void updateClone()
  {
    posX = source.savedPosX.get(frameCount - frameOfCreation);
    posY = source.savedPosY.get(frameCount - frameOfCreation);
  }
  
  void drawClone()
  {
    rectMode(CENTER);
    stroke(STROKE);
    fill(FILL);
    rect(posX,posY,objWidth,objHeight);
  }
  
  void drawClone(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.rectMode(CENTER);
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(posX,posY,objWidth,objHeight);
  }
}
