import 'dart:convert';

import '../day.dart';

class Template00 implements Day {
  //todo: change class name
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;

  @override
  int dayNumber = 0; //todo: set day number

  @override
  String solvePartOne(String input) {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';
    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);

    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
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
