void setup()
{
  game = new Game();
  sceneManager = new SceneManager();
  keyManager = new KeyManager();
  size(game.GAMEWIDTH,game.GAMEHEIGHT,P3D);
  frameRate(game.FRAMERATE);
  rectMode(CENTER);
  pg = createGraphics(game.GAMEWIDTH,game.GAMEHEIGHT);
  pg.rectMode(CENTER);
  imageMode(CENTER);
  minim = new Minim(this);
      
  groove = minim.loadFile("Music/Circumspection.mp3");
  burn = minim.loadSample("SoundEffects/Burn.wav");
  explosion = minim.loadSample("SoundEffects/Explosion.wav");
  thruster = minim.loadSample("SoundEffects/Thruster.wav");
  pickup = minim.loadSample("SoundEffects/Pickup.wav");
}

void draw()
{
  background(255);
  
  sceneManager.update();
  sceneManager.display();
    
 
  game.showScore();
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
    keyManager.right = true;
  if(key == 'a' || key == 'A')
    keyManager.left = true;
    
  if(key == 's' || key == 'S')
    keyManager.down = true;
  if(key == 'w' || key == 'W')
    keyManager.up = true;
}

void keyReleased()
{
  if(key == 'd' || key == 'D')
    keyManager.right = false;
  if(key == 'a' || key == 'A')
    keyManager.left = false;
    
  if(key == 's' || key == 'S')
    keyManager.down = false;
  if(key == 'w' || key == 'W')
    keyManager.up = false;
}



  
