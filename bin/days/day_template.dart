import '../day.dart';

class Template00 implements Day {
  // todo: change class name
  @override
  int dayNumber = 0; // todo: set day number

  String input;
  List<String> lines;
  String partOneAnswer = 'partOneAnswerPlaceHolder';
  String partTwoAnswer = 'partTwoAnswerPlaceHolder';

  void useSampleInput() {
    input = 'sample_input';
    lines = ['sil1', 'sil2', 'sil3'];
  }

  @override
  String solvePartOne() {
    //useSampleInput();

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
