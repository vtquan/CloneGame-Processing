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
    int mouseDeltaX = 0;
    int mouseDeltaY = 0;
    PVector mouseVector = new PVector(0,0);
    if(mousePressed)
    {
      mouseDeltaX += getMouseDeltaX();
      mouseDeltaY += getMouseDeltaY();
      mouseVector = new PVector(mouseDeltaX, mouseDeltaY);
    }
    
    int keyDeltaX = 0;
    int keyDeltaY = 0;
    PVector keyVector = new PVector(0,0);
    if(keyPressed)
    {
      
      keyDeltaX += getKeyDeltaX();
      keyDeltaY += getKeyDeltaY();
      keyVector = new PVector(keyDeltaX, keyDeltaY);
    }
    
    PVector deltaVector = PVector.add(mouseVector, keyVector);
    
    int speedX = 0;
    int speedY = 0;
    if (deltaVector.mag() >= SPEED)   
    {
        speedX = int((deltaVector.x / deltaVector.mag()) * SPEED);
        speedY = int((deltaVector.y / deltaVector.mag()) * SPEED);
    }
    else if (deltaVector.mag() < SPEED) //for stabilization when player is near touch point
    {
        speedX = int(deltaVector.x);
        speedY = int(deltaVector.y);
    }
    
    posX += speedX;
    posY += speedY;

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
  
  int getMouseDeltaX()
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
  
  int getMouseDeltaY()
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
  
  int getKeyDeltaX()
  {
    int speedX = 0;
    if(key == CODED)
    {
      if(keyCode == RIGHT)
        speedX = SPEED;
      else if(keyCode == LEFT)
        speedX = -SPEED;
    }
    else
    {
      if(key == 'd' || key == 'D')
        speedX = SPEED;
      else if(key == 'a' || key == 'A')
        speedX = -SPEED;
    }
    return speedX;
  }
  
  int getKeyDeltaY()
  {
    int speedY = 0;
    if(key == CODED)
    {
      if(keyCode == DOWN)
        speedY = SPEED;
      else if(keyCode == UP)
        speedY = -SPEED;
    }
    else
    {
      if(key == 's' || key == 'S')
        speedY = SPEED;
      else if(key == 'w' || key == 'W')
        speedY = -SPEED;
    }
    return speedY;
  }
}
