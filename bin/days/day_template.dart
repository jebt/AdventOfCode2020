import 'dart:convert';

import '../day.dart';

class Template00 implements Day {
  //todo: change class name
  List<String> lines;

  @override
  int dayNumber = 0; //todo: set day number

  @override
  String solvePartOne(String input) {
    String partOneAnswer = 'partOneAnswerPlaceHolder';
    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);

    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }

    return partOneAnswer;
  }

  @override
  String solvePartTwo(String input) {
    String partTwoAnswer = 'partTwoAnswerPlaceHolder';

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
