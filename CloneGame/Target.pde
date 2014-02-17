class Target{
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  final color STROKE = color(255,199,0);
  final color FILL = color(255,199,0);
  
  Target(int posX,int posY,int objWidth,int objHeight)
  {
    this.posX = posX;
    this.posY = posY;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void drawTarget()
  {
    rectMode(CENTER);
    stroke(STROKE);
    fill(FILL);
    rect(posX,posY,objWidth,objHeight);
  }
  
  void drawTarget(PGraphics pg)  //draw clone to an offscreen image buffer
  {
    pg.rectMode(CENTER);
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(posX,posY,objWidth,objHeight);
  }
}
