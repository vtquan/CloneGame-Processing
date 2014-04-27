class Button {
  int xPos;
  int yPos;
  int objWidth;
  int objHeight;
  final color STROKE = color(0);
  final color FILL = color(255,178,63);
  final color HOVERFILL = color(255,199,117);
  final int STROKEWEIGHT = 5;
  String txt = "";
  int TEXTSIZE = 24;
  color TEXTCOLOR = color(254);
  boolean hoverOn = false;
  
  Button(int xPos, int yPos, int objWidth, int objHeight, String txt)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.txt = txt;
  }
  
  void update()
  {
    if(mouseX > xPos - objWidth/2 && mouseX < xPos + objWidth/2 && mouseY > yPos - objHeight/2 && mouseY < yPos + objHeight/2)
    {
      hoverOn = true;    
      if(mousePressed)
      {
        sceneManager.currentScene = new GameScene();
      }
    }
    else
      hoverOn = false;
  }
  
  void display()
  {
    pushStyle();
    
    if(hoverOn)
    {
      fill(HOVERFILL);
    }
    else
    {
      fill(FILL);
    }
      
    stroke(STROKE);
    strokeWeight(STROKEWEIGHT);
    rect(xPos, yPos, objWidth, objHeight);
    
    textAlign(CENTER);
    textSize(TEXTSIZE);
    fill(0, 102, 153);
    text(txt, xPos, yPos+TEXTSIZE/2);
    
    popStyle();
  }
}
