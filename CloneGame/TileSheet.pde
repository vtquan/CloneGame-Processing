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
      }
    }
  }
  
  boolean detectCollision()
  {
    PGraphics pg = createGraphics(game.GAMEWIDTH,game.GAMEHEIGHT);
    boolean result = false;
    SurfaceTile surfaceTile = new SurfaceTile();
    
    pg.beginDraw();
    pg.background(255);
    color c = color(0);
    
    for(int i = 0; i < tileSheet.length; i++)  //for each row
    {
      for(int j = 0; j < tileSheet[0].length; j++)  //for each columns
      {
        tileSheet[i][j].display(pg);
      }
    }
        
    //checking the 4 corner of the player to see if the pixel is not the same as background
    if(pg.get(player.posX - int(player.objWidth/2), player.posY - int(player.objHeight/2)) != surfaceTile.FILL)  //check top left corner of player
    {
      //find current tile position
      int posX = player.posX - int(player.objWidth/2); 
      int posY = player.posY - int(player.objHeight/2);
      int col = posX / surfaceTile.objWidth;
      int row = posY / surfaceTile.objHeight;
      
      println("row: "+row+" col: "+row);
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.posX - int(player.objWidth/2), player.posY + int(player.objHeight/2)) != surfaceTile.FILL)  //check top right corner of player
    {
      //find current tile position
      int posX = player.posX - int(player.objWidth/2); 
      int posY = player.posY + int(player.objHeight/2);
      int col = posX / surfaceTile.objWidth;
      int row = posY / surfaceTile.objHeight;
      
      println("row: "+row+" col: "+row);
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY - int(player.objHeight/2)) != surfaceTile.FILL)  //check bottom left corner of player
    {
      //find current tile position
      int posX = player.posX + int(player.objWidth/2); 
      int posY = player.posY - int(player.objHeight/2);
      int col = posX / surfaceTile.objWidth;
      int row = posY / surfaceTile.objHeight;
      
      println("row: "+row+" col: "+row);
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.posX + int(player.objWidth/2), player.posY + int(player.objHeight/2)) != surfaceTile.FILL)  //check bottom right corner of player
    {
      //find current tile position
      int posX = player.posX + int(player.objWidth/2); 
      int posY = player.posY + int(player.objHeight/2);
      int col = posX / surfaceTile.objWidth;
      int row = posY / surfaceTile.objHeight;
      
      println("row: "+row+" col: "+row);
      tileSheet[row][col].collisionAction();
    }
    
    pg.endDraw();
    
    return result;
  }
}

