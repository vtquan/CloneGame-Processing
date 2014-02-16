class Clone{
  int posX;
  int posY;
  int objWidth;
  int objHeight;
  int frameOfCreation;  //frame that clone object is created on
  
  Clone(int posX,int posY,int objWidth,int objHeight, int frameOfCreation)
  {
    this.posX = posX;
    this.posY = posY;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.frameOfCreation = frameOfCreation;
  }
  
  void updateClone(HashMap<Integer,Integer> mousePosX, HashMap<Integer,Integer> mousePosY)
  {
    this.posX = mousePosX.get(frameCount - frameOfCreation);
    this.posY = mousePosY.get(frameCount - frameOfCreation);
  }
  
  void drawClone()
  {
    rectMode(CENTER);
    stroke(0);
    fill(0);
    rect(posX,posY,objWidth,objHeight);
  }
  
  boolean checkDetection()
  {
    if(posX + objWidth/2 >= mouseX && posX - objWidth/2 <= mouseX) {
      if(posY + objHeight/2 >= mouseY && posY - objHeight/2 <= mouseY) {
        return true;
      }
    }
    return false;   
  }
}
