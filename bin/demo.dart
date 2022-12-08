import 'package:server/assets.dart';

void main(List<String> args) {
  print('program started');
  for (var i = 0; i < 500; i++) {
    print('===== LOOP ${i + 1} =====');

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
