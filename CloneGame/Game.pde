class Game {
  boolean started = false;
  boolean cloneStarted = false;  //is clone spawning?
  boolean end = false;
  int score = 0;
  int startFrame;  //frame number when game start
  int endFrame;  //frame number when game end
  int startingFrame;  //frame number when line is crossed
  int frameElapsed; //number of frame since startingFrame
  float cloneDelay = 6;  //number of second between clone spawns
  float cloneMinDelay = 2; //shortest amount of second between clone spawns
  float cloneDelayRate = -.2;  //number of second cloneDelay changes per clone creation
  int nextCloneSpawnFrame;  //frame when next clone will spawn
  
  final int FRAMERATE = 60;   //framerate of game
  final int COUNTDOWN = 1;  //number of second before input is accepted when game start
  final int GAMEWIDTH = 600;  //width of game screen
  final int GAMEHEIGHT = 500;  //height of game screen
  
  Game()
  {
    startFrame = frameCount;
    endFrame = 0;
    started = false;
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
    started = false;
    score = 0;
    
    setup();
  }
}
    
