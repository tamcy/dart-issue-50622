import 'package:bezier/bezier.dart';

class ProcessedContour {

  late final List<CubicBezier> beziers;

  ProcessedContour(this.beziers);

  bool overlaps(ProcessedContour instruction) {
    // print(3);
    for (var bezier1 in beziers) {
      // print(4);
      for (var bezier2 in instruction.beziers) {
        // print(5);
        if (bezier1.intersectionsWithCurve(bezier2).isNotEmpty) {
          return true;
        }
        // print(6);
      }
      // print(7);
    }
    // print(8);
    return false;
  }
}

List<int> findOverlappingContours(List<ProcessedContour> instructions) {
  print('findOverlappingContours entry');
  List<int> groupIndices = Iterable<int>.generate(instructions.length).toList();

  for (int i = 0; i < instructions.length - 1; i++) {
    for (int j = i + 1; j < instructions.length; j++) {
      // for (int i = instructions.length - 2; i >= 0; i--) {
      //   for (int j = instructions.length - 1; j >= i + 1; j--) {
      print("testing $i against $j");
      if (instructions[i].overlaps(instructions[j])) {
        print('Yes');
      }
    }
  }

  return groupIndices;
}
