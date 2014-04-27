class MenuScene extends Scene {
  Button startB = new Button(width/2, height/2, 100, 40, "Start");
  PImage img = loadImage("TitleScreen.jpg");
  
  MenuScene()
  {
    groove = minim.loadFile("Music/Circumspection.mp3");
    groove.play();
  }
  
  void update()
  {
    startB.update();
  }
  
  void display()
  {
    image(img, width/2, height/2, width, height);
    
    pushStyle();
    
    textAlign(CENTER);
    textSize(100);
    fill(186, 47, 184);
    text("Delayed", width/2, 100);
    
    popStyle();
    startB.display();
  }
}
