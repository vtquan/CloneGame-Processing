class Tile {
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  final color STROKE;
  final color FILL;
  PImage[] img;
  
  Tile()
  {
    STROKE = color(0);
    FILL = color(0);
    posX = 0;
    posY = 0;
    objWidth = 50;
    objHeight = 50;
  }
  
  Tile(color stroke, color fill)
  {
    STROKE = stroke;
    FILL = fill;
    posX = 0;
    posY = 0;
    objWidth = 50;
    objHeight = 50;
  }
  
  Tile(color stroke, color fill, int posX, int posY, int objWidth, int objHeight)
  {
    STROKE = stroke;
    FILL = fill;
    this.posX = posX;
    this.posY = posY;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void display()
  {
    stroke(STROKE);
    fill(FILL);
    rect(posX,posY,objWidth,objHeight);
  }
  
  void display(PGraphics pg)
  {
    pg.stroke(FILL);
    pg.fill(STROKE);
    pg.rect(posX,posY,objWidth,objHeight);
  }
  
  void collisionAction()  //action to take when collided
  {
  }
  
//  boolean detectCollision(Player player)
//  {
//    
//  }
}
