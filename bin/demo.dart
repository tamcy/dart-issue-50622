import 'package:bezier/bezier.dart';
import 'package:vector_math/vector_math.dart';

void main(List<String> args) {
  print('program started');

  List<CubicBezier> beziers = [
    CubicBezier([Vector2(419.0, 509.0), Vector2(419.0, 509.0), Vector2(419.0, 479.0), Vector2(419.0, 479.0)]),
    CubicBezier([Vector2(419.0, 479.0), Vector2(419.0, 479.0), Vector2(684.0, 479.0), Vector2(684.0, 479.0)]),
    CubicBezier([Vector2(419.0, 121.0), Vector2(419.0, 121.0), Vector2(714.0, 121.0), Vector2(714.0, 121.0)]),
    CubicBezier([Vector2(714.0, 121.0), Vector2(714.0, 121.0), Vector2(714.0, 509.0), Vector2(714.0, 509.0)]),
    CubicBezier([Vector2(789.0, -65.0), Vector2(819.0, -65.0), Vector2(837.0, -59.0), Vector2(854.0, -38.0)]),
  ];

  for (int l = 0; l < 100; l++) {
    print('===== LOOP $l =====');

    for (int i = 0; i < beziers.length - 1; i++) {
      for (int j = i + 1; j < beziers.length; j++) {
        // print("  >> testing $i against $j");
        if (beziers[i].intersectionsWithCurve(beziers[j]).isNotEmpty) {
          print('  >>> Intersection detected for $i, $j');
        }
      }
    }
  }

  print('program finished successfully!');
}
