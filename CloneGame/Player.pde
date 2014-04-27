class Player{
  int SPEED = 4;
  int xPos = width/2;
  int yPos = 10;
  int objWidth;
  int objHeight;
  final color STROKE = color(51,127,116);
  final color FILL = color(51,127,116);
  HashMap<Integer,Integer> savedXPos = new HashMap<Integer,Integer>();
  HashMap<Integer,Integer> savedYPos = new HashMap<Integer,Integer>();
  PImage[] img = new PImage[4];
  int currentFrame;
  float currentAngle = PI;
  int xPrev = -1;
  int yPrev = -1;
  
  Player() {
    this.objWidth = 10;
    this.objHeight = 10;
  }
  
  Player(int objWidth, int objHeight) {
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    img[0] = loadImage("Ship/ship1.png");
    img[1] = loadImage("Ship/ship2.png");
    img[2] = loadImage("Ship/ship3.png");
    img[3] = loadImage("Ship/ship4.png");
    currentFrame = int(random(0,4));
  }
  
  void updatePlayer()
  {
    xPrev = xPos;
    yPrev = yPos;
    float deltaX = getDeltaX();
    float deltaY = getDeltaY();
    float delta = sqrt(sq(deltaX) + sq(deltaY));    
    
    if (delta >= SPEED)   
    {
        deltaX = (deltaX / delta) * SPEED;
        deltaY = (deltaY / delta) * SPEED;
    }
    
    xPos += deltaX;
    yPos += deltaY;
    
    // Check borders
    if (xPos < objWidth/2)
    {
        xPos = objWidth/2;
    }
    else if (xPos >= width-1 - objWidth/2)
    {
        xPos = width-1 - objWidth/2;
    }
    if (yPos < objHeight/2)
    {
        yPos = objHeight/2;
    }
    else if (yPos >= height-1 - objHeight/2)
    {
        yPos = height-1 - objHeight/2;
    }
    
    //change rotation
    if(!game.end)
    {
      if(xPos - xPrev != 0 || yPrev - yPos != 0)  //don't rotate when staying still
      {
        currentAngle = atan2(xPos - xPrev, yPrev - yPos);
      }
    }
    
    currentFrame = int(random(0,img.length));
  }
  
  void drawPlayer()
  {
    pushMatrix();
    translate(xPos,yPos);
    rotate(currentAngle);
    image(img[currentFrame],0,0);
    popMatrix(); 
  }
  
  float getDeltaX()
  {
    float deltaX = 0;
    if(mousePressed)
    {
      deltaX = mouseX - xPos;
    }
    if(keyPressed)
    {
      if(keyManager.right)
        deltaX += SPEED;
      if(keyManager.left)
        deltaX += -SPEED;
    }
    
    return deltaX;
  }
  
  float getDeltaY()
  {
    float deltaY = 0;
    if(mousePressed)
    {
      deltaY = mouseY - yPos;
    }
    if(keyPressed)
    {
      if(keyManager.down)
        deltaY += SPEED;
      if(keyManager.up)
        deltaY += -SPEED;
    }
    
    return deltaY;
  }
}
