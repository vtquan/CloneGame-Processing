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
    if(player.posX < this.posX && player.posY > this.posY - this.objHeight/2 && player.posY < this.posY + this.objHeight/2)  //player is left of tile
    {
      player.posX = this.posX - this.objWidth/2 - player.objWidth/2;
    }
    else if(player.posX > this.posX && player.posY > this.posY - this.objHeight/2 && player.posY < this.posY + this.objHeight/2)  //player is right of tile
    {
      player.posX = this.posX + this.objWidth/2 + player.objWidth/2;
    }
    else if(player.posY < this.posY && player.posX > this.posX - this.objWidth/2 && player.posX < this.posY + this.objWidth/2)  //player is top of tile
    {
      player.posY = this.posY - this.objHeight/2 - player.objHeight/2;
    }
    else if(player.posY > this.posY && player.posX > this.posX - this.objWidth/2 && player.posX < this.posY + this.objWidth/2)  //player is bottom of tile
    {
      player.posY = this.posY + this.objHeight/2 + player.objHeight/2;
    }
  }
}
