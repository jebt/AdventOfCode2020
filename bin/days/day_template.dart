import '../day.dart';

class Template00 implements Day {
  //todo: change class name
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;

  @override
  int dayNumber = 0; //todo: set day number

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
