class Game {
  boolean crossed = false;
  int score = 0;
  int startFrame;  //frame number when line is crossed
  int startingFrame;  //frame number when line is crossed
  int frameElapsed; //number of frame since startingFrame
  final int FRAMERATE = 60;   //framerate of game
  final int COUNTDOWN = 1;  //number of second before input is accepted when game start
  final int DELAY = 1;  //number of second between clone creation
  final int GAMEWIDTH = 400;  //width of game screen
  final int GAMEHEIGHT = 300;  //height of game screen
  
  Game()
  {
    crossed = false;
    score = 0;
  }
  
  void reset()
  {
    crossed = false;
    score = 0;
    
    setup();
  }
}
    
