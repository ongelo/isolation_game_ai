class Minimax {
  ArrayList<Integer> allValues = new ArrayList<Integer>();
  ArrayList<Node> allNodes = new ArrayList<Node>();

  Minimax() {}
   
  int[] optimal(Board state) {

      Node node = new Node(state);
      
      minimax(node, 2, true);

      int indexOfTheMove = findLargestIndex(allValues);
      Node theMove = allNodes.get(indexOfTheMove);

      int bestCoordinates[] = new int[2];
      if(board.whoAI == 1) {
        bestCoordinates[0] = theMove.nodeState.knight1.knightX;
        bestCoordinates[1] = theMove.nodeState.knight1.knightY;
      } else {
        bestCoordinates[0] = theMove.nodeState.knight2.knightX;
        bestCoordinates[1] = theMove.nodeState.knight2.knightY;
      }
      
      
      println("best coordinates: " + bestCoordinates[0] + " " + bestCoordinates[1]);
      allNodes.clear();
      allValues.clear();
      return bestCoordinates;
  }
  
  int minimax(Node _node, int depth, boolean maximizingPlayer) {
       println("=======DEPTH: " + depth);
       println(_node.nodeState.checkOver());
       if(depth == 0 || _node.nodeState.checkOver() != -1) {
          allNodes.add(_node);
          int return_value = _node.evaluate();
          allValues.add(return_value);
          return return_value;
       }
       
       if (maximizingPlayer) {
         int value = Integer.MIN_VALUE;
         println("MAXIMIZING FOR AI");
         _node.makeChildren(_node.nodeState.knight2, 2);
         ArrayList<Node> children = _node.children;
         
         for(int i = 0; i < children.size(); i++) {
            int eval = minimax(children.get(i), depth - 1, false);
            value = max(value, eval);
         }
         
         return value;
       } else {
         int value = Integer.MAX_VALUE;
         println("MINIMIZING FOR USER");
         _node.makeChildren(_node.nodeState.knight1, 1);
         ArrayList<Node> children = _node.children;
         
         for(int i = 0; i < children.size(); i++) {
           int eval = minimax(children.get(i), depth - 1, true);
           value = min(value, eval);
         }
         
         return value;
       }
  }
  
  int findLargestIndex(ArrayList<Integer> arr) {

      int max = arr.get(0);
      int index = 0;

      for (int i = 0; i < arr.size(); i++) 
      {
          if (max < arr.get(i))
          {
              max = arr.get(i);
              index = i;
          }
      }
      return index;
  }
}
