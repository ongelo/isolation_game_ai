Knight knight1 = new Knight();
Knight knight2 = new Knight();
Board board = new Board();
int whoseTurn = 1; // 1 is the first player, 2 is the second player

int avail[][] = new int[3][8];
void setup()
{
  size(910,910);
  background(0);
  knight1.setKnightX(3);
  knight1.setKnightY(2);
  
  knight2.setKnightX(5);
  knight2.setKnightY(4);
  
  for(int i = 0; i < 3; i++)
  {
    for(int k = 0; k < 8; k++)
    {
      avail[i][k] = 0;
    }
  }
}

int count = 0;
boolean boardMade = false;


void draw()
{
  background(0);

  board.makeBoard();
  
  knight1.printKnight();
  knight2.printKnight();
  if(whoseTurn == 1) {
    knight1.moveSpace();
  } else {
    knight2.moveSpace();
  }
}

void switchTurn(int player) {
  whoseTurn = player;
}

void mouseClicked() {
  if(whoseTurn == 1) {
    knight1.moveKnight(mouseX, mouseY, avail); 
    switchTurn(2);
  } else {
    knight2.moveKnight(mouseX, mouseY, avail); 
    switchTurn(1);
  }
}
