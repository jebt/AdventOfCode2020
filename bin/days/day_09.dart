import '../day.dart';

class Day09 implements Day {
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;

  @override
  int dayNumber = 9;

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }

    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }

    return partTwoAnswer;
  }

  @override
  void setLines(List<String> lines) {
    this.lines = lines;
  }

  @override
  void setInput(String input) {
    this.input = input;
  }
}
