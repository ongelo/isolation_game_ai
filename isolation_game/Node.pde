// This node class is a abstract represantation of a board
class Node {
    Board nodeState;
    int value;
    ArrayList<Node> children = new ArrayList<Node>();

    Node(Board _board) {
      value = 0;
      nodeState = new Board(_board.getSteppedOn(), _board.knight1.knightX, _board.knight1.knightY, _board.knight2.knightX, _board.knight2.knightY);
    }
    
    void makeChildren(Knight currentKnight, int knightNo) {
      Board newState = new Board(nodeState.getSteppedOn(), nodeState.knight1.knightX, nodeState.knight1.knightY, nodeState.knight2.knightX, nodeState.knight2.knightY);
      currentKnight.setAvailForKnight();
      int[][] cur_availSpots = currentKnight.avail;
      
      // take the current unavailable board and ban the cKnight and oKnights locations as well
      //newState.steppedOn[newState.knight1.knightX][newState.knight1.knightY] = true;
      //newState.steppedOn[newState.knight2.knightX][newState.knight2.knightY] = true;
      
      //for(int i = 0; i < 7; i++) {
      //   for(int j = 0; j < 7; j++) {
      //      println("[" + i + "]" + "[" + j + "]: " + board.steppedOn[i][j]); 
      //   }
      //}
      
      for(int i = 0; i < 8; i++) {
        if(cur_availSpots[2][i] == 1) {
           int newX = cur_availSpots[0][i];
           int newY = cur_availSpots[1][i];
           
           if(knightNo == 1) {
             //println("Child for knight1 created!");
             newState.knight1.knightX = newX;
             newState.knight1.knightY = newY;
             children.add(new Node(newState));
           } else {
             //println("Child for knight2 created!");
             newState.knight2.knightX = newX;
             newState.knight2.knightY = newY;
             children.add(new Node(newState));
           }
        }
      }
    }
    
    private int calcKnightScore(int numOfAval, int x, int y) {
      int score = 0;
      
      score = numOfAval * 10;
      //score += board.weights[x][y];
      
      return score;
    }
    
    public int evaluate()
    {
        int numOfAval1 = nodeState.knight1.getNumOfAvail();
        int numOfAval2 = nodeState.knight2.getNumOfAvail();
        
        // Calculate knight 1's score
        int knight1Score = calcKnightScore(numOfAval1, nodeState.knight1.knightX, nodeState.knight1.knightY);
        
        // Calculate knight 2's score
        int knight2Score = calcKnightScore(numOfAval2, nodeState.knight2.knightX, nodeState.knight2.knightY);
        
        //println(numOfAval1, numOfAval2);
        
        if(nodeState.whoAI == 1) {
          value = knight1Score - knight2Score;
        } else {
          value = knight2Score - knight1Score; 
        }
        
        
        
        println("*SEF : " + value);

        return value;
    }
}
