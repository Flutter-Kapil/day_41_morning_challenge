import 'day40.dart';

// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday
List<List> threeMovesToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (twoMoveToWin(allPossibleMoves[i]) != null) {
      return allPossibleMoves[i];
    }
  }
  return null;
}

// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)
List<List> nMoveToWin(List<List> towers, int n) {
  if (n == 1) {
    return oneMoveToWin(towers);
  }
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (nMoveToWin(allPossibleMoves[i], n - 1) != null) {
      return allPossibleMoves[i];
    }
  }

  return null;
}


List<List> nextMove4BestWin(List<List> towers) {
  int n = 1;
  do {
    if (nMoveToWin(towers, n) != null) {
      return nMoveToWin(towers, n);
    }
    n++;
  }while(nMoveToWin(towers, n-1) == null);
  return null;
}
int numberOfMovesForBestWin(List<List> towers) {
  int n = 1;
  do {
    if (nMoveToWin(towers, n) != null) {
      return n;
    }
    n++;
  }while(nMoveToWin(towers, n-1) == null);
  return null;
}
allMovesToWin(List<List> towers) {
  int n=numberOfMovesForBestWin(towers);
  while(n>=1){
    List<List> nextMove = nextMove4BestWin(towers);
    print('next Move : $nextMove');
    towers = nextMove;
    n--;
  }
}
// Stretch: Show all moves which lead to win, given a state.
main() {

  allMovesToWin([
    [1,2,3,4,5],
    [],
    []
  ]);

}
