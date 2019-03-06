import static javax.swing.JOptionPane.*;

int userX, userY;
Board board = new Board();
int whoseTurn = 1; // 1 is the knight1, 2 is the knight2
Minimax tree = new Minimax();
int theWinner;

// states
String input;
final int SELECT_PLAYER = 0;
final int PROMPT_USER_LOCATION = 1;
final int SELECT_LOCATION = 2;
final int LOCATE_AI = 3;
final int GAME_ON = 4;
final int GAME_OVER = 5;
int state = SELECT_PLAYER;

void setup()
{
  size(910,910);
  background(0);
}

void draw() {
  background(0);
  switch(state) {
    case SELECT_PLAYER:
      input = showInputDialog("ISOLATION GAME\nWhich player do you want to be? (Enter 1 or 2)");
      switch(input) {
        case "1":
        // Knight 1 is the user
        board.whoAI = 2;
        break;
      case "2":
        // Knight 2 is the user
        board.whoAI = 1;
        break;
      default:
        showMessageDialog(null, "INVALID INPUT. EXITING.");
        exit();
        break;
        }
      state = PROMPT_USER_LOCATION;
      break;
    case PROMPT_USER_LOCATION:
      int ok = showConfirmDialog(null, "Locate your player!" , null, OK_CANCEL_OPTION, INFORMATION_MESSAGE);
      if(ok == YES_OPTION) {
        board.makeBoard();
        state = SELECT_LOCATION;
      } else {
        exit(); 
      }
      break;
    case SELECT_LOCATION:
      board.makeBoard();
      drawUser();
      break;
    case LOCATE_AI:
      board.makeBoard();
      locateAI();
      drawUser();
      drawAI();
      break;
    case GAME_ON:
      board.makeBoard();
      redLine(board.steppedOn);
      drawUser();
      drawAI();
      drawAvailable();

      // if AI's turn
      if(board.whoAI == 1 && whoseTurn == 1) {
        playAI(board.knight1, 2);
      } else if(board.whoAI == 2 && whoseTurn == 2) {
        playAI(board.knight2, 1); 
      }
      if((board.whoAI == 1 && whoseTurn == 2) || (board.whoAI == 2 && whoseTurn == 1)) {
      }
      
      theWinner = board.checkOver();
      if(theWinner != -1) {
         state = GAME_OVER;
      }
      break;
    case GAME_OVER:
      showMessageDialog(null, "GAME OVER!\nThe winner is KNIGHT" + theWinner);  
      exit();
      break;
  }
}

void drawUser() {
  if(board.whoAI == 1) {
       board.knight2.printKnight(0, 0, 0);
  } else if(board.whoAI == 2) {
       board.knight1.printKnight(255, 255, 255); 
  }
}

void drawAI() {
  if(board.whoAI == 1) {
     board.knight1.printKnight(255, 255, 255);
  } else if(board.whoAI == 2) {
     board.knight2.printKnight(0, 0, 0);
  }
}

void locateAI() {
  if(board.whoAI == 1) {
     if(!board.steppedOn[4][4]) {
       board.knight1.knightX = 4;
       board.knight1.knightY = 4;
       board.steppedOn[4][4] = true;
     } else {
       board.knight1.knightX = 2;
       board.knight1.knightY = 2;
       board.steppedOn[4][4] = true;
     }
  } else if(board.whoAI == 2) {
     if(!board.steppedOn[4][4]) {
       board.knight2.knightX = 4;
       board.knight2.knightY = 4;
       board.steppedOn[4][4] = true;
     } else {
       board.knight2.knightX = 2;
       board.knight2.knightY = 2;
       board.steppedOn[4][4] = true;
     }
  }
  state = GAME_ON;
}

// when mouse clicked, user plays
void mouseClicked() {
  //loop();
  switch(state) {
    case SELECT_LOCATION:
      if(board.whoAI == 1) {
         board.knight2.knightX = mouseX / 130;
         board.knight2.knightY = mouseY / 130;
      } else if(board.whoAI == 2) {
         board.knight1.knightX = mouseX / 130;
         board.knight1.knightY = mouseY / 130;
      }
      board.steppedOn[mouseX/130][mouseY/130] = true;
      state = LOCATE_AI;
      break;     
    case GAME_ON:
      if(!board.isOver) {
        if(board.whoAI == 1 && whoseTurn == 2) {
            if(board.knight2.moveKnight(mouseX, mouseY)) { // play the user
              switchTurn(1);
            }
        } else if(board.whoAI == 2 && whoseTurn == 1) {
            if(board.knight1.moveKnight(mouseX, mouseY)) { // play the user
              switchTurn(2);
            }
        }
      }
  }
}

void playAI(Knight knight, int next) {
  int coordinates[] = new int[2];
  Board current_state = new Board(board.steppedOn, board.knight1.knightX, board.knight1.knightY, board.knight2.knightX, board.knight2.knightY);
  coordinates = tree.optimal(current_state);
  
  if(knight.moveKnight(coordinates[0] * 130, coordinates[1] * 130)) {
    switchTurn(next);
  }  
}


void switchTurn(int player) {
  whoseTurn = player;
}

void drawAvailable() {
  if(!board.isOver)
  {
    if(whoseTurn == 1) {
        board.printAvalBoxes(board.knight1);
    } else {
        board.printAvalBoxes(board.knight2); 
    }
  }
}

void redLine(boolean steppedOn[][]){
  for(int i = 0; i < 7; i++)
  {
    for(int k = 0; k < 7; k++)
    {
      if(steppedOn[i][k])
      {
        fill(242, 48, 27);
        rect(((i)*130),((k)*130), 130, 130);
      }
    }
  }
}
