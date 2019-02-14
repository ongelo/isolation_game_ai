Knight knight = new Knight();
Board board = new Board();

int avail[][] = new int[3][8];
void setup()
{
  size(910,910);
  background(0);
  knight.knightX = 3;
  knight.knightY = 2;
  
  for(int i = 0; i < 3; i++)
  {
    for(int k = 0; k < 8; k++)
    {
      avail[i][k] =0;
    }
  }
  
}

int count = 0;
boolean boardMade = false;


void draw()
{
  background(0);
  //if(!boardMade)
  //{
    board.makeBoard();
  //}  
  
  knight.printKnight();
  knight.moveSpace();
}




void mouseClicked()
{
  int mx, my;
  mx = mouseX;
  my = mouseY;
  //int tempx, tempy;
  println(mx, "  ", my);
  for(int i = 0; i < 8; i++)
  {
    if(avail[2][i] == 1)
    {
      println(avail[0][i], " ", avail[1][i]);
      if((((avail[0][i] *130) + 130) > mx && mx > (avail[0][i] * 130)) &&
         ((avail[1][i] * 130) + 130) > my && my > (avail[1][i] *130))
      {
        knight.setKnightX(avail[0][i]);
        knight.setKnightY(avail[1][i]);
      }
    }
  }
  
  println("kx ", knight.getKnightX(), "  ky ", knight.getKnightY());
  for(int i = 0; i < 3; i++)
  {
    for(int k = 0; k < 8; k++)
    {
      avail[i][k] =0;
    }
  }
}
