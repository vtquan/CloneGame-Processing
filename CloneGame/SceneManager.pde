class SceneManager {
  Scene currentScene;
  
  SceneManager()
  {
    currentScene = new MenuScene();
  }
  
  void update()
  {
    currentScene.update();
  }
  
  void display()
  {
    currentScene.display();
  }
}
  
