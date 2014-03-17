class Player{
  int SPEED = 5;
  int posX = width/2;
  int posY = 10;
  int objWidth;
  int objHeight;
  final color STROKE = color(51,127,116);
  final color FILL = color(51,127,116);
  HashMap<Integer,Integer> savedPosX = new HashMap<Integer,Integer>();
  HashMap<Integer,Integer> savedPosY = new HashMap<Integer,Integer>();
  
  Player() {
    this.objWidth = 10;
    this.objHeight = 10;
  }
  
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

    // Check borders
    if (posX < objWidth/2)
    {
        posX = objWidth/2;
    }
    else if (posX >= width-1 - objWidth/2)
    {
        posX = width-1 - objWidth/2;
    }
    if (posY < objHeight/2)
    {
        posY = objHeight/2;
    }
    else if (posY >= height-1 - objHeight/2)
    {
        posY = height-1 - objHeight/2;
    }
  }
  
  void drawPlayer()
  {
    rectMode(CENTER);
    stroke(STROKE);
    fill(FILL);
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
