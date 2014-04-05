import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer groove;
AudioSample burn;

Game game;
TileSheet tileSheet;
Player player;
Target target;
CloneMap cloneMap;
int highScore;  //highest score
int highSurvival; //highest survival time
PGraphics pg;
