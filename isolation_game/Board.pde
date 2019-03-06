class Board {
  boolean steppedOn[][] = new boolean[7][7];
  Knight knight1 = new Knight();
  Knight knight2 = new Knight();
  int whoAI = -1; // 1 for knight1 and 2 for knight2
  int tempx, tempy;
  boolean isBoardMade;
  boolean isOver;
  
  int[][] weights = {
      {-10, -7, -7, -7, -7, -7, -10}, 
      {-7, 0, 5, 5, 5, 0, -7}, 
      {-7, 5, 7, 7, 7, 5, -7}, 
      {-7, 5, 7, 10, 7, 5, -7}, 
      {-7, 5, 7, 7, 7, 5, -7}, 
      {-7, 0, 5, 5, 5, 0, -7}, 
      {-10, -7, -7, -7, -7, -7, -10}
  };
  
  Board() {
    for(int j = 0; j < 7; j++) {
      for(int h = 0; h < 7; h++) {
        steppedOn[j][h] = false;
      }
    }
    
    isOver = false;
  }

  Board(boolean[][] _steppedOn, int _oneX, int _oneY, int _twoX, int _twoY) {
    steppedOn = _steppedOn;
    
    knight1.knightX = _oneX;
    knight1.knightY = _oneY;
    knight2.knightX = _twoX;
    knight2.knightY = _twoY;
    
    isOver = false;
  } 
  
  boolean[][] getSteppedOn() {
    boolean cpy_array[][] = new boolean[7][7];
    arrayCopy(steppedOn, cpy_array);
    return cpy_array; 
  }
 
  
  void makeBoard()
  {
    float k = 0;
    for(int i = 0; i < 50; i++)
    {
        k = i;
        if((k%2)==0)
        {
            
            tempx = (i%7);
            tempy = (i/7);
            fill(255);
            rect((130*tempx), (130*tempy), 130, 130);
        }
    }
    isBoardMade = true;
  }
  
  int checkOver() {
    int winner = -1;
    knight1.setAvailForKnight();
    knight2.setAvailForKnight();
    int totalAvalK1 = 0;
    int totalAvalK2 = 0;
    
    for(int i = 0; i < 8; i++) {
      if(knight1.avail[2][i] == 1) {
        totalAvalK1++;
      }
    }
    
    for(int i = 0; i < 8; i++) {
      if(knight2.avail[2][i] == 1) {
        totalAvalK2++; 
      }
    }
    
    if(totalAvalK1 == 0) {
      winner = 2;
    } else if(totalAvalK2 == 0) {
      winner = 1;
    }
    
    return winner;
  }

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


  /*
  When we are checking the move space, if we pass the if statements, we store it in the 'avail' array
  avail[R][T]  T = the tile number (look above for refrence to each tile's index)
              R = The section where the X, Y, and Available int is stored
                    0 = X tile value on the board
                    1 = Y tile value on the board
                    2 = Availabule int value ( 0 = not available  1 = available)
  */
  void printAvalBoxes(Knight knight)
  {
    int tilex, tiley;
    Knight newKnight = knight;
    tilex = newKnight.knightX;
    tiley = newKnight.knightY;
      
    if((tilex - 2) >= 0)
    {
      if((tiley - 1) >= 0 && !steppedOn[tilex-2][tiley-1])
      {
          fill(64, 231, 60);
          rect(((tilex-2)*130),((tiley-1)*130), 130, 130);
          knight.avail[0][2] = (tilex-2); 
          knight.avail[1][2] = (tiley-1);
          knight.avail[2][2] = 1;
      }
      if((tiley + 1) <= 6 && !steppedOn[tilex -2][tiley + 1])
      {
        fill(64, 231, 60);
        rect(((tilex-2)*130),((tiley+1)*130), 130, 130);
        knight.avail[0][4] = (tilex-2); 
        knight.avail[1][4] = (tiley+1);
        knight.avail[2][4] = 1;
      }
    }


    if((tilex - 1) >= 0)
    {
       if((tiley - 2) >= 0 && !steppedOn[tilex-1][tiley-2])
       {
           fill(64, 231, 60);
           rect(((tilex-1)*130),((tiley-2)*130),130,130);
           knight.avail[0][0] = (tilex-1); 
           knight.avail[1][0] = (tiley-2);
           knight.avail[2][0] = 1;
       }
       if((tiley + 2) <= 6 && !steppedOn[tilex -1][tiley + 2])
       {
         fill(64, 231, 60);
         rect(((tilex-1)*130),((tiley+2)*130), 130, 130);
         knight.avail[0][6] = (tilex-1); 
         knight.avail[1][6] = (tiley+2);
         knight.avail[2][6] = 1;
       }
    }

    if((tilex + 2) <= 6)
    {
       if((tiley - 1) >= 0 && !steppedOn[tilex+2][tiley-1])
       {
           fill(64, 231, 60);
           rect(((tilex+2)*130),((tiley-1)*130), 130, 130);
           knight.avail[0][3] = (tilex+2); 
           knight.avail[1][3] = (tiley-1);
           knight.avail[2][3] = 1;
       }
       if((tiley + 1) <= 6 && !steppedOn[tilex +2][tiley + 1])
       {
         fill(64, 231, 60);
         rect(((tilex+2)*130),((tiley+1)*130), 130, 130);
         knight.avail[0][5] = (tilex+2); 
         knight.avail[1][5] = (tiley+1);
         knight.avail[2][5] = 1;
       }
    }

    if((tilex + 1) <= 6)
    {
       if((tiley - 2) >= 0 && !steppedOn[tilex+1][tiley-2])
       {
           fill(64, 231, 60);
           rect(((tilex+1)*130),((tiley-2)*130),130,130);
           knight.avail[0][1] = (tilex+1); 
           knight.avail[1][1] = (tiley-2);
           knight.avail[2][1] = 1;
       }
       if((tiley + 2) <= 6 && !steppedOn[tilex +1][tiley + 2])
       {
         fill(64, 231, 60);
         rect(((tilex+1)*130),((tiley+2)*130), 130, 130);
         knight.avail[0][7] = (tilex+1); 
         knight.avail[1][7] = (tiley+2);
         knight.avail[2][7] = 1;
       }
     }
  }
}
