class SurfaceTile extends Tile {
  SurfaceTile()
  {
    super(color(255), color(255));
  }
  
  SurfaceTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(255), color(255), posX, posY, objWidth, objHeight);
  }
  
  void collisionAction()
  {
  }
}
