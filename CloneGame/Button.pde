class Button {
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  final color STROKE = color(0);
  final color FILL = color(255,178,63);
  final int STROKEWEIGHT = 5;
  String txt = "";
  int TEXTSIZE = 24;
  color TEXTCOLOR = color(254);
  
  Button(float xPos, float yPos, float objWidth, float objHeight, String txt)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.objWidth = objWidth;
    this.objHeight = objHeight;
    this.txt = txt;
  }
  
  void display()
  {
    pushStyle();
    textAlign(CENTER);
    fill(FILL);
    stroke(STROKE);
    strokeWeight(STROKEWEIGHT);
    rect(xPos, yPos, objWidth, objHeight);
    textSize(TEXTSIZE);
    fill(0, 102, 153);
    text(txt, xPos, yPos+TEXTSIZE/2);
    popStyle();
  }
}
