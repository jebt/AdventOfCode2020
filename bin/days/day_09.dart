import '../day.dart';

class Day09 implements Day {
  static const int invalidNumber = 41682220;
  bool foundAnswer;
  String input;
  List<String> lines;
  List<int> numbers;
  String partOneAnswer;
  String partTwoAnswer;
  List<int> answerRange;

  @override
  int dayNumber = 9;

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    numbers = [];

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      numbers.add(int.parse(line));
    }

    OUTER:
    for (int i = 25; i < numbers.length; i++) {
      int numberI = numbers[i];
      COMPARE:
      for (int j = i - 25; j < i; j++) {
        int numberJ = numbers[j];
        for (int k = i - 25; k < i; k++) {
          int numberK = numbers[k];
          //print('$i($numberI) $j($numberJ) $k($numberK)');
          if ((j == (i - 1)) && (k == (i - 1))) {
            partOneAnswer = numberI.toString();
            break OUTER;
          }
          if (numberJ == numberK) {
            continue;
          } else if ((numberJ + numberK) == numberI) {
            break COMPARE;
          } else {}
        }
      }
    }

    // 53281600069018 is too high
    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    foundAnswer = false;

    for (int i = 0; i < numbers.length; i++) {
      if (foundAnswer) {
        break;
      }
      addNextAndCompare(i, i, numbers[i]);
    }

    answerRange.sort();
    partTwoAnswer = (answerRange.first + answerRange.last).toString();

    // 4717383 is too low
    return partTwoAnswer;
  }

  void addNextAndCompare(int lowestIndex, int highestIndex, int total) {
    if (foundAnswer) {
      return;
    }
    highestIndex++;
    total = total + numbers[highestIndex];
    if (total == invalidNumber) {
      answerRange = [];
      for (int i = lowestIndex; i <= highestIndex; i++) {
        answerRange.add(numbers[i]);
      }
      foundAnswer = true;
      return;
    } else if (total > invalidNumber) {
      return;
    }
    addNextAndCompare(lowestIndex, highestIndex, total);
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
