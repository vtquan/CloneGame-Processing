class LavaTile extends Tile {
  LavaTile()
  {
    super(color(255), color(255,0,0));
  }
  
  LavaTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(255), color(255,0,0), posX, posY, objWidth, objHeight);
  }
}
