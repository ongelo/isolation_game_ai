class Knight {
  int knightX = -1;
  int knightY = -1;
  int avail[][] = new int[3][8];
  int count;
  
  Knight() {
    count = 0;
    
    for(int i = 0; i < 3; i++)
    {
      for(int k = 0; k < 8; k++)
      {
        avail[i][k] = 0;
      }
    }
  }
  
  boolean printKnight(int r, int g, int b)
  {
    int centerx, centery;
    centerx = (knightX * 130) + 65;
    centery = (knightY * 130) + 65;
    fill(r, g, b);
    ellipse(centerx, centery, 65, 65);
    
    return true;
  }
  
  boolean moveKnight(int mx, int my) {
    boolean knightMoved = false;
    for(int i = 0; i < 8; i++)
    {
      if(avail[2][i] == 1)
      {
        count++;
        if((((avail[0][i] * 130) + 130) > mx && mx >= (avail[0][i] * 130)) &&
           ((avail[1][i] * 130) + 130) > my && my >= (avail[1][i] * 130))
        {
          knightX = avail[0][i];
          knightY = avail[1][i];
          board.steppedOn[avail[0][i]][avail[1][i]] = true;
          
          knightMoved = true;
        }
      }
    }
    
    if(count == 0){ //if there are no moves, its game over
      board.isOver = true;
    }
    
    for(int i = 0; i < 3; i++) {
        for(int k = 0; k < 8; k++) {
          avail[i][k] = 0;
        }
    } 
    
    return knightMoved;
  }
  
  void setAvailForKnight() {
    
    int tilex, tiley;
    tilex = knightX;
    tiley = knightY;
      
    if((tilex - 2) >= 0)
    {
      if((tiley - 1) >= 0 && !board.steppedOn[tilex-2][tiley-1])
      {
          avail[0][2] = (tilex-2); 
          avail[1][2] = (tiley-1);
          avail[2][2] = 1;
      }
      if((tiley + 1) <= 6 && !board.steppedOn[tilex -2][tiley + 1])
      {
        avail[0][4] = (tilex-2); 
        avail[1][4] = (tiley+1);
        avail[2][4] = 1;
      }
    }


    if((tilex - 1) >= 0)
    {
       if((tiley - 2) >= 0 && !board.steppedOn[tilex-1][tiley-2])
       {
           avail[0][0] = (tilex-1); 
           avail[1][0] = (tiley-2);
           avail[2][0] = 1;
       }
       if((tiley + 2) <= 6 && !board.steppedOn[tilex -1][tiley + 2])
       {
         avail[0][6] = (tilex-1); 
         avail[1][6] = (tiley+2);
         avail[2][6] = 1;
       }
    }

    if((tilex + 2) <= 6)
    {
       if((tiley - 1) >= 0 && !board.steppedOn[tilex+2][tiley-1])
       {
           avail[0][3] = (tilex+2); 
           avail[1][3] = (tiley-1);
           avail[2][3] = 1;
       }
       if((tiley + 1) <= 6 && !board.steppedOn[tilex +2][tiley + 1])
       {
         avail[0][5] = (tilex+2); 
         avail[1][5] = (tiley+1);
         avail[2][5] = 1;
       }
    }

    if((tilex + 1) <= 6)
    {
       if((tiley - 2) >= 0 && !board.steppedOn[tilex+1][tiley-2])
       {
           avail[0][1] = (tilex+1); 
           avail[1][1] = (tiley-2);
           avail[2][1] = 1;
       }
       if((tiley + 2) <= 6 && !board.steppedOn[tilex +1][tiley + 2])
       {
         avail[0][7] = (tilex+1); 
         avail[1][7] = (tiley+2);
         avail[2][7] = 1;
       }
     }
  }
  
  int getNumOfAvail() {
    setAvailForKnight();
    int total = 0;
    for(int i = 0; i < 8; i++) {
       if(avail[2][i] == 1) {
         total++;
       }
    }
    
    return total;
  }
}
