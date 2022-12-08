import 'package:server/assets.dart';

void main(List<String> args) {
  print('program started');
  for (var i = 0; i < 100; i++) {
    print('===== LOOP $i =====');

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
