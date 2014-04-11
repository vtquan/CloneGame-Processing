class SurfaceTile extends Tile {
  PImage img = loadImage("Surface/surface1.jpg");
  SurfaceTile()
  {
    super(color(255), color(255));
  }
  
  SurfaceTile(int xPos, int yPos, int objWidth, int objHeight)
  {
    super(color(255), color(255), xPos, yPos, objWidth, objHeight);
  }
  
  void display()
  {
    image(img,xPos,yPos,objWidth,objHeight);
  }
  
  void collisionAction()
  {
  }
}
