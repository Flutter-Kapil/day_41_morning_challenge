import 'day40.dart';
// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday
List<List> threeMovesToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (twoMoveToWin(allPossibleMoves[i])!=null) {
      return allPossibleMoves[i];
    }
  }
  return null;
}
// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)


// Stretch: Show all moves which lead to win, given a state.
main() {
  List<List> GameInstance0301 = [
    [2,1],
    [],
    [3,4]
  ];
  print(nMoveToWin(GameInstance0301, 3));
}
