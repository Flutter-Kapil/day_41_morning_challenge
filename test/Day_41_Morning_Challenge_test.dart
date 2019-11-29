import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('3 move to win', () {
    expect(threeMovesToWin([
      [1,2],
      [],
      [3, 4]
    ]), [[2], [1], [3, 4]]);//requires 3 move to win

  });
}