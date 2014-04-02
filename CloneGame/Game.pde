class Game {
  boolean crossed = false;
  boolean end = false;
  int score = 0;
  int startFrame;  //frame number when game start
  int endFrame;  //frame number when game end
  int startingFrame;  //frame number when line is crossed
  int frameElapsed; //number of frame since startingFrame
  
  final int FRAMERATE = 30;   //framerate of game
  final int COUNTDOWN = 1;  //number of second before input is accepted when game start
  final int DELAY = 1;  //number of second between clone creation
  final int GAMEWIDTH = 600;  //width of game screen
  final int GAMEHEIGHT = 500;  //height of game screen
  
  Game()
  {
    startFrame = frameCount;
    endFrame = 0;
    crossed = false;
    score = 0;
  }
  
  void showScore()
  {
    textAlign(LEFT);
    fill(0, 102, 153);
    textSize(12);
    text("survival time: "+game.frameElapsed+" score: " +game.score, 10, 10); 
    
    textAlign(RIGHT);
    fill(0, 102, 153);
    textSize(12);
    text("highest survival time: "+highSurvival+" highest score: " +highScore, width - 10, 10); 
  }
  
  void reset()
  {
    if(score > highScore)
      highScore = score;
    if(frameElapsed > highSurvival)
      highSurvival = frameElapsed;
    startFrame = frameCount;
    endFrame = 0;
    crossed = false;
    score = 0;
    
    setup();
  }
}
    
