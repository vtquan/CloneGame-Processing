class BlockTile extends Tile {
  BlockTile()
  {
    super(color(255), color(128,128,128));
  }
  
  BlockTile(int posX, int posY, int objWidth, int objHeight)
  {
    super(color(128,128,128), color(128,128,128), posX, posY, objWidth, objHeight);
  }
  
  void collisionAction()
  {
    int posX = player.posX;
    int posY = player.posY;
    
    if(posX < this.posX && posY > this.posY - this.objHeight/2 && posY < this.posY + this.objHeight/2)
    {
      player.posX = this.posX - this.objWidth/2 - player.objWidth/2;
    }
    else if(posX > this.posX && posY > this.posY - this.objHeight/2 && posY < this.posY + this.objHeight/2)
    {
      player.posX = this.posX + this.objWidth/2 + player.objWidth/2;
    }
 
    posX = player.posX;
    posY = player.posY;

    if(posY < this.posY && posX > this.posX - this.objWidth/2 && posX < this.posX + this.objWidth/2)
    {
      player.posY = this.posY - this.objHeight/2 - player.objHeight/2;
    }
    else if(posY > this.posY && posX > this.posX - this.objWidth/2 && posX < this.posX + this.objWidth/2)
    {
      player.posY = this.posY + this.objHeight/2 + player.objHeight/2;
    }
  }
}
