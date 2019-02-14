class Knight {
  private int knightX;
  private int knightY;
  
  public Knight() {
    
  }
  
  public void setKnightX(int value) {
    knightX = value;  
  }
  
  public void setKnightY(int value) {
    knightY = value;  
  }
  
  public int getKnightX() {
    return knightX;
  }
  
  public int getKnightY() {
    return knightY;  
  }
  
  void printKnight()
  {
    int centerx, centery;
    centerx = (knightX * 130) + 65;
    centery = (knightY * 130) + 65;
    fill(0,0,255);
    ellipse(centerx, centery, 65, 65);
  }
  
  //This is a mess, will work on commenting it soon, It has a lot of redunant cases
  //as well. What it does though is check for which spaces it can move to and highlighting
  //those tiles.
  void moveSpace()
  {
    int tilex, tiley;
    int count = 0;
  
     tilex = knightX;
     tiley = knightY;
      
      //checking x
     if((tilex-2) >= 0)
     {
       if((tiley-2) >= 0)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley-1)*130), 130, 130);
         avail[0][2] = (tilex-2); avail[1][2] = (tiley-1);
         avail[2][2] = 1;
         
         rect(((tilex-1)*130),((tiley-2)*130),130,130);
         avail[0][0] = (tilex-1); avail[1][0] = (tiley-2);
         avail[2][0] = 1;
       }
       else if((tiley-1) >=0)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley-1)*130), 130, 130);
         avail[0][2] = (tilex-2); avail[1][2] = (tiley-1);
         avail[2][2] = 1;
       }
       
       if((tiley+2) <= 6)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley+1)*130), 130, 130);
         avail[0][4] = (tilex-2); avail[1][4] = (tiley+1);
         avail[2][4] = 1;
  
         rect(((tilex-1)*130),((tiley+2)*130), 130, 130);
         avail[0][6] = (tilex-1); avail[1][6] = (tiley+2);
         avail[2][6] = 1;
         
       }
       else if((tiley+1) <= 6)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley+1)*130), 130, 130);
         avail[0][4] = (tilex-2); avail[1][4] = (tiley+1);
         avail[2][4] = 1;
       }
     }
     
  //////////////////////////////////////////////////////////////
    if((tilex+2) >= 0)
     {
       if((tiley-2) >= 0)
       {
         fill(0,255,0);
         rect(((tilex+2)*130),((tiley-1)*130), 130, 130);
         avail[0][3] = (tilex+2); avail[1][3] = (tiley-1);
         avail[2][3] = 1;
         
         rect(((tilex+1)*130),((tiley-2)*130),130,130);
         avail[0][1] = (tilex+1); avail[1][1] = (tiley-2);
         avail[2][1] = 1;
         
       }
       else if((tiley-1) >=0)
       {
         fill(0,255,0);
         rect(((tilex+2)*130),((tiley-1)*130), 130, 130);
         avail[0][3] = (tilex+2); avail[1][3] = (tiley-1);
         avail[2][3] = 1;
       }
       
       if((tiley+2) <= 6)
       {
         fill(0,255,0);
         rect(((tilex+2)*130),((tiley+1)*130), 130, 130);
         avail[0][5] = (tilex+2); avail[1][5] = (tiley+1);
         avail[2][5] = 1;
  
         rect(((tilex+1)*130),((tiley+2)*130), 130, 130);
         avail[0][7] = (tilex+1); avail[1][7] = (tiley+2);
         avail[2][7] = 1;
         
       }
       else if((tiley+1) <= 6)
       {
         fill(0,255,0);
         rect(((tilex+2)*130),((tiley+1)*130), 130, 130);
         avail[0][5] = (tilex+2); avail[1][5] = (tiley+1);
         avail[2][5] = 1;
       }
     }
    ///////////////////////////////////////////////////////////// 
     if((tilex-1) >= 0)
     {
       if((tiley-2) >= 0)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley-1)*130), 130, 130);
         avail[0][2] = (tilex-2); avail[1][2] = (tiley-1);
         avail[2][2] = 1;
         
         rect(((tilex-1)*130),((tiley-2)*130),130,130);
         avail[0][0] = (tilex-1); avail[1][0] = (tiley-2);
         avail[2][0] = 1;
       }  
       if((tiley+2) <= 6)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley+1)*130), 130, 130);
         avail[0][4] = (tilex-2); avail[1][4] = (tiley+1);
         avail[2][4] = 1;
  
         rect(((tilex-1)*130),((tiley+2)*130), 130, 130);
         avail[0][1] = (tilex-1); avail[1][1] = (tiley+2);
         avail[2][1] = 1;
         
       }
     }
   //////////////////////////////////////////////////////
   if((tilex+1) >= 0)
     {
       if((tiley-2) >= 0)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley-1)*130), 130, 130);
         avail[0][2] = (tilex-2); avail[1][2] = (tiley-1);
         avail[2][2] = 1;
         
         rect(((tilex-1)*130),((tiley-2)*130),130,130);
         avail[0][0] = (tilex-1); avail[1][0] = (tiley-2);
         avail[2][0] = 1;
       }    
       if((tiley+2) <= 6)
       {
         fill(0,255,0);
         rect(((tilex-2)*130),((tiley+1)*130), 130, 130);
         avail[0][4] = (tilex-2); avail[1][4] = (tiley+1);
         avail[2][4] = 1;
  
         rect(((tilex-1)*130),((tiley+2)*130), 130, 130);
         avail[0][6] = (tilex-1); avail[1][6] = (tiley+2) ;
         avail[2][6] = 1;
         
       }
     }
     //////////////////////////////////////////////////////////
  }
}
