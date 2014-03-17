class BlockTile extends Tile {
  BlockTile()
  {
    super(color(255), color(128,128,128));
  }
  
  BlockTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(255), color(128,128,128), posX, posY, objWidth, objHeight);
  }
}
