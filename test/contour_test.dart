import 'package:server/assets.dart';
import 'package:server/contour.dart';
import 'package:test/test.dart';

void main() {
  test('Find overlap contours', () async {
    for (var i = 0; i < 20; i++) {
      expect(2, findOverlappingContours(loadData()).length);
    }
  });
}
