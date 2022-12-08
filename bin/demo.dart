import 'package:server/assets.dart';
import 'package:server/contour.dart';

void main(List<String> args) {
  print('program started');
  for (var i = 0; i < 20; i++) {
    print('===== LOOP ${i + 1} =====');
    final groupedContours = findOverlappingContours(loadData());
    print(groupedContours.length);
  }
  print('program finished successfully!');
}
