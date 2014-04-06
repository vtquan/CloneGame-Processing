class TileSheet{
  int tileWidth;
  int tileHeight;
  int[][] tileSheetVisual = {   {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,1,1,1,1,0,0,0,0,0,0,0},
                                {0,1,1,1,1,0,0,0,1,0,0,0},
                                {0,0,1,3,0,0,3,3,0,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,1,0,3,3,0,0,0,0,0,0},
                                {0,0,0,0,0,0,0,0,1,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0},
                                {0,0,0,0,0,0,0,0,0,0,0,0}  };

  Tile[][] tileSheet;
  
  TileSheet()
  {
    tileSheet = new Tile[tileSheetVisual.length][tileSheetVisual[0].length];
    tileWidth = width/tileSheet[0].length;  
    tileHeight = height/tileSheet.length;
    int xPos = tileWidth/2;
    int yPos = tileHeight/2;
    for(int i = 0; i < tileSheet.length; i++)  //for each row
    {
      for(int j = 0; j < tileSheet[0].length; j++)  //for each columns
      {
        switch(tileSheetVisual[i][j]) {
        case 0: 
          tileSheet[i][j] = new SurfaceTile(xPos + (tileWidth*j), yPos + (tileHeight*i), tileWidth, tileHeight);
          break;
        case 1: 
          tileSheet[i][j] = new BlockTile(xPos + (tileWidth*j), yPos + (tileHeight*i), tileWidth, tileHeight);
          break;
        default:
          tileSheet[i][j] = new LavaTile(xPos + (tileWidth*j), yPos + (tileHeight*i), tileWidth, tileHeight);
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
  
  int checkCurrentTilePositionType(int x, int y)  //find the type of the tile that the object is on
  {
    int cCol = int(map(x / tileWidth, 0, tileSheet[0].length, 1, tileSheet[0].length-1));
    int cRow = int(map(y / tileHeight, 0, tileSheet.length, 1, tileSheet.length-1));
    
    return tileSheetVisual[cRow][cCol];
  }
  
  boolean detectCollision()
  {
    boolean result = false;
    SurfaceTile surfaceTile = new SurfaceTile();
    
    pg.beginDraw();
    pg.background(255);
    
    //find current tile position
    int cxPos = player.xPos;
    int cyPos = player.yPos;
    int cCol = int(map(cxPos / tileWidth, 0, tileSheet[0].length, 1, tileSheet[0].length-1));
    int cRow = int(map(cyPos / tileHeight, 0, tileSheet.length, 1, tileSheet.length-1));
    
    //display surrounding tiles
    for(int i = cRow-1; i < cRow+2; i++)  //for each row
    {
      for(int j = cCol-1; j < cCol+2; j++)  //for each columns
      {
        tileSheet[i][j].display(pg);
      }
    }
        
    //checking the 4 corner of the player to see if the pixel is not the same as SurfaceTile
    if(pg.get(player.xPos - int(player.objWidth/2), player.yPos - int(player.objHeight/2)) != surfaceTile.FILL)  //check top left corner of player
    {
      //find current tile position
      int xPos = player.xPos - int(player.objWidth/2); 
      int yPos = player.yPos - int(player.objHeight/2);
      int col = xPos / surfaceTile.objWidth;
      int row = yPos / surfaceTile.objHeight;
      
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.xPos - int(player.objWidth/2), player.yPos + int(player.objHeight/2)) != surfaceTile.FILL)  //check top right corner of player
    {
      //find current tile position
      int xPos = player.xPos - int(player.objWidth/2); 
      int yPos = player.yPos + int(player.objHeight/2);
      int col = xPos / surfaceTile.objWidth;
      int row = yPos / surfaceTile.objHeight;
      
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.xPos + int(player.objWidth/2), player.yPos - int(player.objHeight/2)) != surfaceTile.FILL)  //check bottom left corner of player
    {
      //find current tile position
      int xPos = player.xPos + int(player.objWidth/2); 
      int yPos = player.yPos - int(player.objHeight/2);
      int col = xPos / surfaceTile.objWidth;
      int row = yPos / surfaceTile.objHeight;
      
      tileSheet[row][col].collisionAction();
    }
    else if(pg.get(player.xPos + int(player.objWidth/2), player.yPos + int(player.objHeight/2)) != surfaceTile.FILL)  //check bottom right corner of player
    {
      //find current tile position
      int xPos = player.xPos + int(player.objWidth/2); 
      int yPos = player.yPos + int(player.objHeight/2);
      int col = xPos / surfaceTile.objWidth;
      int row = yPos / surfaceTile.objHeight;
      
      tileSheet[row][col].collisionAction();
    }
    
    pg.endDraw();
    
    return result;
  }
  
  boolean detectCloneLavaCollision(Clone clone)  //check if clone collide with lava
  {
    boolean result = false;
    LavaTile lavaTile = new LavaTile();
    
    pg.beginDraw();
    pg.background(255);
    
    //find current tile position
    int cCol = int(map(clone.xPos / tileWidth, 0, tileSheet[0].length, 1, tileSheet[0].length-1));
    int cRow = int(map(clone.yPos / tileHeight, 0, tileSheet.length, 1, tileSheet.length-1));
    
    //display surrounding tiles
    for(int i = cRow-1; i < cRow+2; i++)  //for each row
    {
      for(int j = cCol-1; j < cCol+2; j++)  //for each columns
      {
        tileSheet[i][j].display(pg);
      }
    }
        
    //checking the 4 corner of the player to see if the pixel is not the same as SurfaceTile
    if(pg.get(clone.xPos - int(clone.objWidth/2), clone.yPos - int(clone.objHeight/2)) == lavaTile.FILL)  //check top left corner of player
    {
      //find current tile position
      int xPos = clone.xPos - int(clone.objWidth/2); 
      int yPos = clone.yPos - int(clone.objHeight/2);
      int col = xPos / lavaTile.objWidth;
      int row = yPos / lavaTile.objHeight;
      
      tileSheet[row][col].cloneCollisionAction(clone);
    }
    else if(pg.get(clone.xPos - int(clone.objWidth/2), clone.yPos + int(clone.objHeight/2)) == lavaTile.FILL)  //check top right corner of player
    {
      //find current tile position
      int xPos = clone.xPos - int(clone.objWidth/2); 
      int yPos = clone.yPos + int(clone.objHeight/2);
      int col = xPos / lavaTile.objWidth;
      int row = yPos / lavaTile.objHeight;
      
      tileSheet[row][col].cloneCollisionAction(clone);
    }
    else if(pg.get(clone.xPos + int(clone.objWidth/2), clone.yPos - int(clone.objHeight/2)) == lavaTile.FILL)  //check bottom left corner of player
    {
      //find current tile position
      int xPos = clone.xPos + int(clone.objWidth/2); 
      int yPos = clone.yPos - int(clone.objHeight/2);
      int col = xPos / lavaTile.objWidth;
      int row = yPos / lavaTile.objHeight;
      
      tileSheet[row][col].cloneCollisionAction(clone);
    }
    else if(pg.get(clone.xPos + int(clone.objWidth/2), clone.yPos + int(clone.objHeight/2)) == lavaTile.FILL)  //check bottom right corner of player
    {
      //find current tile position
      int xPos = clone.xPos + int(clone.objWidth/2); 
      int yPos = clone.yPos + int(clone.objHeight/2);
      int col = xPos / lavaTile.objWidth;
      int row = yPos / lavaTile.objHeight;
      
      tileSheet[row][col].cloneCollisionAction(clone);
    }
    
    pg.endDraw();
    
    return result;
  }
  
  
}

