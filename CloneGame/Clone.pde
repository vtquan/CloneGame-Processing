class Clone{
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  final color STROKE = color(72,0,124);
  final color FILL = color(72,0,124);
  int frameOfCreation;  //frame that clone object is created on
  
  Clone(int posX,int posY,int objWidth,int objHeight, int frameOfCreation)
  {
    this.posX = posX;
    this.posY = posY;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.frameOfCreation = frameOfCreation;
  }
  
  void updateClone(HashMap<Integer,Integer> mousePosX, HashMap<Integer,Integer> mousePosY)
  {
    posX = mousePosX.get(frameCount - frameOfCreation);
    posY = mousePosY.get(frameCount - frameOfCreation);
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
