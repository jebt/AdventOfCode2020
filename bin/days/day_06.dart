import 'dart:convert';

import '../day.dart';

class Day06 implements Day {
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;

  @override
  int dayNumber = 6;

  @override
  String solvePartOne(String input) {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';
    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);

    for (int i = 0; i < lines.length; i++) {
      // String line = lines[i];
      // print(line);
    }

    return partOneAnswer;
  }

  @override
  String solvePartTwo(String input) {
    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }
    return partTwoAnswer;
  }

  @override
  void setLines(List<String> lines) {
    this.lines = lines;
  }
}
