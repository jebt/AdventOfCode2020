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

    int answerCount = 0;
    int partTwoAnswerCount = 0;
    List<String> reports = input.split('\n\n');
    for (String report in reports) {
      String allAnsweredYes = '';
      String aggregatedLetters = '';
      List<String> subs = report.split('\n');
      for (int j = 0; j < subs.length; j++) {
        String compareString = '';
        String sub = subs[j];
        sub = sub.trim();
        if (sub.isEmpty) {
          continue;
        }
        if (j == 0) {
          allAnsweredYes = sub;
        }
        for (int i = 0; i < sub.length; i++) {
          String letter = sub[i];
          if (allAnsweredYes.contains(letter) && !compareString.contains(letter)) {
            compareString = compareString + letter;
          }
          if (!aggregatedLetters.contains(letter)) {
            aggregatedLetters = aggregatedLetters + letter;
          }
        }
        allAnsweredYes = compareString;
      }
      answerCount = answerCount + aggregatedLetters.length;
      partTwoAnswerCount = partTwoAnswerCount + allAnsweredYes.length;
    }

    partOneAnswer = answerCount.toString();
    partTwoAnswer = partTwoAnswerCount.toString();

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
