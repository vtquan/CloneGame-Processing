import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer groove;
AudioSample burn;
AudioSample explosion;
AudioSample thruster;
AudioSample pickup;

Game game;
SceneManager sceneManager;
TileSheet tileSheet;
Player player;
Target target;
KeyManager keyManager;
CloneMap cloneMap;
int highScore;  //highest score
int highSurvival; //highest survival time
PGraphics pg;

int ButtonPress;
