List<List> hanoiPossibleMoves(List<List> towers) {
  List<List> towersPossibleOutput = [];
  //lets assume there are only 3 towers
  for (int i = 0; i < 3; i++) {
    if (towers[i].isEmpty) {
      continue;
    }
    int discToMove = towers[i].first;
    //  print(discToMove);//#debug
    for (int j = 0; j < 3; j++) {
      if (i == j) {
        continue;
      }
      if (towers[j].isEmpty || discToMove < towers[j].first) {
        towers[i].removeAt(0);
        towers[j].insert(0, discToMove); // x=5
//        print('towers $i: $towers'); //#debug
        towersPossibleOutput.add(copyList(towers));
        towers[j].removeAt(0);
        towers[i].insert(0, discToMove);
      }
    }
  }

  //--------------------
  return towersPossibleOutput;
}

// input: [[3,4],[1,2],[]]
List<List> copyList(List<List> copyFrom) {
  List<List> copyTo = [];
  for (List list in copyFrom) {
    List tempList = List.from(list);
    copyTo.add(tempList);
  }
  return copyTo;
}
// Challenge
// Find the best move given the state of Towers of Hanoi board
List<List> nMoveToWin(List<List> towers, int n) {

  if(n==0){
    return null;
  }
  n--;
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if(isThisWinningMove(allPossibleMoves[i])){
      print('n:$n');
      print(allPossibleMoves[i]);
      return null;
    }else
     {
//      print(allPossibleMoves[i]);
      nMoveToWin(allPossibleMoves[i], n);
//      return allPossibleMoves[i];
    }
//    else{
//
//      return oneMoveToWin(allPossibleMoves[i]);
//    }
  }
  return null;
}
List<List> fourMoveToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (threeMoveToWin(allPossibleMoves[i])!=null) {
      return allPossibleMoves[i];
    }
  }
  return null;
}
List<List> threeMoveToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (twoMoveToWin(allPossibleMoves[i])!=null) {
      return allPossibleMoves[i];
    }
  }
  return null;
}
//-------
List<List> twoMoveToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (oneMoveToWin(allPossibleMoves[i])!=null) {
      return allPossibleMoves[i];
    }
  }
  return null;
}
//-------------
List<List> oneMoveToWin(List<List> towers) {
  List<List> allPossibleMoves = hanoiPossibleMoves(towers);
  for (int i = 0; i < allPossibleMoves.length; i++) {
    if (isThisWinningMove(allPossibleMoves[i])) {
      return allPossibleMoves[i];
    }
  }
  return null;
}
//------------

bool isThisWinningMove(List possibleMov) {
  return (possibleMov[0].isEmpty && possibleMov[1].isEmpty);
}





//main() {
//  List<List> GameInstance0101 = [
//    [1],
//    [],
//    [2,3, 4]
//  ];
//  print(oneMoveToWin(GameInstance0101));
//
//  List<List> GameInstance0201 = [
//    [1],
//    [2],
//    [3, 4]
//  ];
//  print(twoMoveToWin(GameInstance0201));
//  List<List> GameInstance0301 = [
//    [1,2],
//    [],
//    [3, 4]
//  ];
//  print(threeMoveToWin(GameInstance0301));
//  print(fourMoveToWin([[1,2,3],[],[4]]));
//}
