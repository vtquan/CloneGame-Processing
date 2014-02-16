boolean crossed = false;
HashMap<Integer,Integer> playerPosX = new HashMap<Integer,Integer>();
HashMap<Integer,Integer> playerPosY = new HashMap<Integer,Integer>();
HashMap<Integer,Clone> cloneMap = new HashMap<Integer,Clone>();
Player player;
int numClone = 0;
int startingFrame;
int frameElapsed; //number of frame since startingFrame
int FRAMERATE = 60;   //framerate of game
int DELAY = 1;  //number of second between clone creation
int GAMEWIDTH = 400;  //width of game screen
int GAMEHEIGHT = 300;  //height of game screen
