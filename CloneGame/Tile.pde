class Tile {
  int xPos;
  int yPos;
  int objWidth;
  int objHeight;
  final color STROKE;
  final color FILL;
  PImage[] img;
  
  Tile()
  {
    STROKE = color(0);
    FILL = color(0);
    xPos = 0;
    yPos = 0;
    objWidth = 50;
    objHeight = 50;
  }
  
  Tile(color stroke, color fill)
  {
    STROKE = stroke;
    FILL = fill;
    xPos = 0;
    yPos = 0;
    objWidth = 50;
    objHeight = 50;
  }
  
  Tile(color stroke, color fill, int xPos, int yPos, int objWidth, int objHeight)
  {
    STROKE = stroke;
    FILL = fill;
    this.xPos = xPos;
    this.yPos = yPos;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void display()
  {
    stroke(STROKE);
    fill(FILL);
    rect(xPos,yPos,objWidth,objHeight);
  }
  
  void display(PGraphics pg)
  {
    pg.stroke(STROKE);
    pg.fill(FILL);
    pg.rect(xPos,yPos,objWidth,objHeight);
  }
  
  void collisionAction()  //action to take when collided
  {
  }
}
