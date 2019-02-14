class Board {
  private int tempx;
  private int tempy;
  
  public Board() {
    tempx = 0;
    tempy = 0;
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
        //println("k/2 ", (k/2), "   tempx ", tempx, "    tempy ", tempy, "   i ", i);
    }
  
    boardMade = true;
  }
}
