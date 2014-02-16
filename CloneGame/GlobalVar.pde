boolean crossed = false;
HashMap<Integer,Integer> mousePosX = new HashMap<Integer,Integer>();
HashMap<Integer,Integer> mousePosY = new HashMap<Integer,Integer>();
HashMap<Integer,Clone> cloneMap = new HashMap<Integer,Clone>();
Clone[] cloneList = new Clone[50];
Player player = new Player(10,10);
int numClone = 0;
int startingFrame;
int frameElapsed; //number of frame since startingFrame
int FRAMERATE = 60;   //framerate of game
int DELAY = 1;  //number of second between clone creation
