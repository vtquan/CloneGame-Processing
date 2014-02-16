class Player{
  int SPEED = 10;
  int posX = 100;
  int posY = 100;
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
      posY += getSpeedY(posX, posY);
    }
  }
  
  void drawPlayer()
  {
    rectMode(CENTER);
    stroke(0);
    fill(255,0,0);
    rect(posX,posY,objWidth,objHeight);
  }
  
  int getSpeedX(int posX, int posY)
  {
    float xDelta = mouseX - posX;
    float yDelta = mouseY - posY;
    float delta = sqrt(sq(xDelta) + sq(yDelta));
    int speedX = 0;
    if (delta >= SPEED)   
        speedX = int((xDelta / delta) * SPEED);
    else if (delta < SPEED) //for stabilization when player is near touch point
        speedX = int(xDelta);
    return speedX;
  }
  
  int getSpeedY(int posX, int posY)
  {
    float xDelta = mouseX - posX;
    float yDelta = mouseY - posY;
    float delta = sqrt(sq(xDelta) + sq(yDelta));
    int speedY = 0;
    if (delta >= SPEED)   
        speedY = int((yDelta / delta) * SPEED);
    else if (delta < SPEED) //for stabilization when player is near touch point
        speedY = int(yDelta);
    return speedY;
  }
}