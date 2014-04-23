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
    if(player.yPos < this.yPos + this.objHeight/2+1 && player.yPos > this.yPos - this.objHeight/2+1)  //player is left or right of block
      player.xPos = player.savedXPos.get(game.frameElapsed - 1);
      
    if(player.xPos < this.xPos + this.objWidth/2+1 && player.xPos > this.xPos - this.objWidth/2+1)  //player is top or bottom of block
      player.yPos = player.savedYPos.get(game.frameElapsed - 1);
  }
}
