class BlockTile extends Tile {  
  BlockTile()
  {
    super(color(255), color(128,128,128));
  }
  
  BlockTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(128,128,128), color(128,128,128), posX, posY, objWidth, objHeight);
  }
  
  void collisionAction()  //action to take when collided
  {
    player.posX = player.savedPosX.get(game.frameElapsed - 1);
    player.posY = player.savedPosY.get(game.frameElapsed - 1);
  }
}
