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
  PImage[] img = new PImage[4];
  int currentFrame;
  float currentAngle = PI;
  int prevX = -1;
  int prevY = -1;
  
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
    prevX = posX;
    prevY = posY;
    float deltaX = getDeltaX();
    float deltaY = getDeltaY();
    float delta = sqrt(sq(deltaX) + sq(deltaY));    
    
    if (delta >= SPEED)   
    {
        deltaX = (deltaX / delta) * SPEED;
        deltaY = (deltaY / delta) * SPEED;
    }
    
    posX += deltaX;
    posY += deltaY;

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
    
    //change rotation
    if(!game.end)
    {
      if(posX - prevX != 0 || prevY - posY != 0)  //don't rotate when staying still
      {
        currentAngle = atan2(posX - prevX, prevY - posY);
      }
    }
    
    currentFrame = int(random(0,img.length));
  }
  
  void drawPlayer()
  {
    beginShape();
    pushMatrix();
    translate(posX,posY);
    rotate(currentAngle);
    image(img[currentFrame],0,0);
    popMatrix();
    endShape();    
  }
  
  float getDeltaX()
  {
    float deltaX = 0;
    if(mousePressed)
    {
      deltaX = mouseX - posX;
    }
    if(keyPressed)
    {
      if(key == 'd' || key == 'D')
        deltaX += SPEED;
      if(key == 'a' || key == 'A')
        deltaX += -SPEED;
    }
    
    return deltaX;
  }
  
  float getDeltaY()
  {
    float deltaY = 0;
    if(mousePressed)
    {
      deltaY = mouseY - posY;
    }
    if(keyPressed)
    {
      if(key == 's' || key == 'S')
        deltaY += SPEED;
      if(key == 'w' || key == 'W')
        deltaY += -SPEED;
    }
    
    return deltaY;
  }
}
