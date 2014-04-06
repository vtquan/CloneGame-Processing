class BlockTile extends Tile {  
  BlockTile()
  {
    super(color(255), color(128,128,128));
  }
  
  BlockTile(int xPos, int yPos, int objWidth, int objHeight)
  {
    super(color(128,128,128), color(128,128,128), xPos, yPos, objWidth, objHeight);
  }
  
  void collisionAction()  //action to take when collided
  {
    player.xPos = player.savedxPos.get(game.frameElapsed - 1);
    player.yPos = player.savedyPos.get(game.frameElapsed - 1);
  }
}
