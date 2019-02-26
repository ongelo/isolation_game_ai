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
  
  void moveKnight(int mx, int my, int avail[][]) {
    for(int i = 0; i < 8; i++)
    {
      if(avail[2][i] == 1)
      {
        println(avail[0][i], " ", avail[1][i]);
        if((((avail[0][i] * 130) + 130) > mx && mx > (avail[0][i] * 130)) &&
           ((avail[1][i] * 130) + 130) > my && my > (avail[1][i] * 130))
        {
          setKnightX(avail[0][i]);
          setKnightY(avail[1][i]);
        }
      }
    }
    
    //  println("kx ", knight.getKnightX(), "  ky ", knight.getKnightY());
      for(int i = 0; i < 3; i++)
      {
        for(int k = 0; k < 8; k++)
        {
          avail[i][k] = 0;
        }
      }
  }
  
  //This is a mess, will work on commenting it soon, It has a lot of redunant cases
  //as well. What it does though is check for which spaces it can move to and highlighting
  //those tiles.
  
  // Centerx   Centery  are temp variables that holds the knights locations
  /* This Is The Initial Grid Set-Up That We Are Checking Around The Kight.
    0  1  2  3  4  <- X coordinate
 0 [ ][X][ ][X][ ]
 1 [X][ ][ ][ ][X]       X = Spots we are checking, if the knight can move there or not.
 2 [ ][ ][&][ ][ ]       &= Knight
 3 [X][ ][ ][ ][X]
 4 [ ][X][ ][X][ ]
 ^
 |- Y coordinate


 How this is numbered: ///////////////////////////////////////////////////////////////////////////////////////////////////////

    0  1  2  3  4  <- X coordinate
 0 [ ][0][ ][1][ ]
 1 [2][ ][ ][ ][3]       X = Spots we are checking, if the knight can move there or not.
 2 [ ][ ][&][ ][ ]       &= Knight
 3 [4][ ][ ][ ][5]
 4 [ ][6][ ][7][ ]
 ^
 |- Y coordinate
  */
  void moveSpace()
  {
    int tilex, tiley;
    int count = 0;
  
     tilex = knightX;
     tiley = knightY;
      
            //checking x


    /* The part of the grind we are checking in this If statement
         0  1  2    <- X coordinate
      0 [ ][X][ ]
      1 [X][ ][ ]      X = Spots we are checking, if the knight can move there or not.
      2 [ ][ ][&]      &= Knight
      3 [X][ ][ ]
      4 [ ][X][ ]
      ^
      |- Y coordinate
    */
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
    /* This Is The Coordinates We Are Checking Now.
        2  3  4  <- X coordinate
     0 [ ][X][ ]
     1 [ ][ ][X]       X = Spots we are checking, if the knight can move there or not.
     2 [&][ ][ ]       &= Knight
     3 [ ][ ][X]
     4 [ ][X][ ]
     ^
     |- Y coordinate
      */
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


      /*This If statement is checking these two loactions
          1  2   <- X coordinate
       0 [X][ ]
       1 [ ][ ]       X = Spots we are checking, if the knight can move there or not.
       2 [ ][&]       &= Knight
       3 [ ][ ]
       4 [X][ ]
       ^
       |- Y coordinate
        */
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
     /*
        2  3   <- X coordinate
     0 [ ][X]
     1 [ ][ ]       X = Spots we are checking, if the knight can move there or not.
     2 [&][ ]       &= Knight
     3 [ ][ ]
     4 [ ][X]
     ^
     |- Y coordinate
      */
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
