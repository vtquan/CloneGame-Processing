class BlockTile extends Tile {  
  PImage img = loadImage("Block/block.png");
  int currentFrame;
  BlockTile()
  {
    super(color(255), color(128,128,128));
  }
  
  BlockTile(int xPos, int yPos, int objWidth, int objHeight)
  {
    super(color(128,128,128), color(128,128,128), xPos, yPos, objWidth, objHeight);
  }
  
  void display()
  {
    image(img,xPos,yPos,objWidth,objHeight);
  }
  
  void collisionAction()  //action to take when collided
  {
    player.xPos = player.savedXPos.get(game.frameElapsed - 1);
    player.yPos = player.savedYPos.get(game.frameElapsed - 1);
  }
}
