class Clone{
  int posX;
  int posY;
  int objWidth;
  int objHeight;
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
    stroke(0);
    fill(0);
    rect(posX,posY,objWidth,objHeight);
  }
  
  void drawClone(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.rectMode(CENTER);
    pg.stroke(0);
    pg.fill(0);
    pg.rect(posX,posY,objWidth,objHeight);
  }
}
