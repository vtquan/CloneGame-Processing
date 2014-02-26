class Clone{
  int posX;
  int posY;
  int objWidth = 10;
  int objHeight = 10;
  final color STROKE = color(72,0,124);
  final color FILL = color(72,0,124);
  int frameOfCreation;  //frame that clone object is created on
  
  Clone(int frameOfCreation)
  {
    posX = 0;
    posY = 0;
    this.frameOfCreation = frameOfCreation;
  }
  
  Clone(int posX,int posY, int frameOfCreation)
  {
    this.posX = posX;
    this.posY = posY;
    this.frameOfCreation = frameOfCreation;
  }
  
  void updateClone(HashMap<Integer,Integer> savedPosX, HashMap<Integer,Integer> savedPosY)
  {
    posX = savedPosX.get(frameCount - frameOfCreation);
    posY = savedPosY.get(frameCount - frameOfCreation);
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
