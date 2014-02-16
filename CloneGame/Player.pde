class Player{
  int SPEED = 10;
  int posX = width/2;
  int posY = 10;
  int objWidth;
  int objHeight;
  
  Player(int objWidth, int objHeight) {
    this.objWidth = objWidth;
    this.objHeight = objHeight;
  }
  
  void updatePlayer()
  {
    if(mousePressed)
    {
      posX += getSpeedX(posX, posY);
      posY += getSpeedY(poxX, posY);
    }
  }
  
  void drawPlayer()
  {
    rectMode(CENTER);
    stroke(0);
    fill(255,0,0);
    rect(posX,posY,objWidth,objHeight);
  }
}
