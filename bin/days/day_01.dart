import '../day.dart';

String answer = 'answer_placeholder';

class Day01 implements Day {
  @override
  int dayNumber = 1;
  String input;
  List<String> lines;

  String solvePartOne() {
    List<int> numbers = <int>[];
    for (int i = 0; i < lines.length; i++) {
      numbers.add(int.parse(lines[i]));
    }
    for (int i = 0; i < numbers.length; i++) {
      for (int j = 0; j < numbers.length; j++) {
        if (numbers[i] + numbers[j] == 2020) {
          answer = (numbers[i] * numbers[j]).toString();
        }
      }
    }
    return answer;
  }

  String solvePartTwo() {
    List<int> numbers = <int>[];
    for (int i = 0; i < lines.length; i++) {
      numbers.add(int.parse(lines[i]));
    }
    for (int i = 0; i < numbers.length; i++) {
      for (int j = 0; j < numbers.length; j++) {
        for (int k = 0; k < numbers.length; k++) {
          if (numbers[i] + numbers[j] + numbers[k] == 2020) {
            answer = (numbers[i] * numbers[j] * numbers[k]).toString();
          }
        }
      }
    }
    return answer;
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
