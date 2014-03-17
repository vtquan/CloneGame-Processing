class TileSheet{
  int[][] tileSheetVisual = {   {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,1,0,0,0,0,0,1,0,0,0},
                                {0,0,1,0,0,0,0,0,1,0,0,0},
                                {0,0,1,0,0,0,0,0,1,0,0,0},
                                {0,0,1,0,0,0,0,0,1,0,0,0},
                                {0,0,1,0,3,3,3,0,1,0,0,0},
                                {0,0,0,0,0,0,0,0,1,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0}  };

  Tile[][] tileSheet;
  
  TileSheet()
  {
    tileSheet = new Tile[tileSheetVisual.length][tileSheetVisual[0].length];
    int objWidth = width/tileSheet[0].length;  
    int objHeight = height/tileSheet.length;
    int posX = objWidth/2;
    int posY = objHeight/2;
    for(int i = 0; i < tileSheet.length; i++)  //for each row
    {
      for(int j = 0; j < tileSheet[0].length; j++)  //for each columns
      {
        switch(tileSheetVisual[i][j]) {
        case 0: 
          tileSheet[i][j] = new SurfaceTile(posX+ (objWidth*j), posY + (objHeight*i), objWidth, objHeight);
          break;
        case 1: 
          tileSheet[i][j] = new BlockTile(posX+ (objWidth*j), posY + (objHeight*i), objWidth, objHeight);
          break;
        default:
          tileSheet[i][j] = new LavaTile(posX+ (objWidth*j), posY + (objHeight*i), objWidth, objHeight);
          break;
        } 
      }
    }
  }
  
  void display()
  {
    for(int i = 0; i < tileSheet.length; i++)  //for each row
    {
      for(int j = 0; j < tileSheet[0].length; j++)  //for each columns
      {
        tileSheet[i][j].display();
        println("x: "+tileSheet[i][j].posX+" y: "+tileSheet[i][j].posY);
      }
    }
  }
  
  void detectCollision()
  {
    for(int i = 0; i < tileSheet.length; i++)  //for each row
    {
      for(int j = 0; j < tileSheet[0].length; j++)  //for each columns
      {
        tileSheet[i][j].display();
        println("x: "+tileSheet[i][j].posX+" y: "+tileSheet[i][j].posY);
      }
    }
  }
}

