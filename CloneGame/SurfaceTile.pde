class SurfaceTile extends Tile {
  SurfaceTile()
  {
    super(color(255), color(255));
  }
  
  SurfaceTile(int xPos, int yPos, int objWidth, int objHeight)
  {
    super(color(255), color(255), xPos, yPos, objWidth, objHeight);
  }
  
  void collisionAction()
  {
  }
}
