import '../day.dart';

class Day14 implements Day {
  @override
  int dayNumber = 14;

  String input;
  List<String> lines;
  String partOneAnswer = 'partOneAnswerPlaceHolder';
  String partTwoAnswer = 'partTwoAnswerPlaceHolder';

  @override
  String solvePartOne() {
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
