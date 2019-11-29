import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('n move to win', () {
    expect(nMoveToWin([[1],[],[2,3, 4]],1), [[], [], [1, 2, 3, 4]]);//requires 1 move to win
    expect(nMoveToWin([[1],[2],[3, 4]],2), [[1], [], [2, 3, 4]]);// 2 moves
    expect(nMoveToWin([[1,2],[],[3, 4]],3), [[2], [1], [3, 4]]);//3 moves to win
    expect(nMoveToWin([[1,2,3,4],[],[]],15), [[2, 3, 4], [1], []]);//15 moves to win
    expect(nMoveToWin([[1,2,3,4],[],[]],14), null);// 15 moves to win, passing 14 which will result in null
  });
}