import '../day.dart';

class Day10 implements Day {
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;
  List<int> numbers;
  int oneJoltDiffCount = 0;
  int twoJoltDiffCount = 0;
  int threeJoltDiffCount = 0;
  int deviceJolt;

  @override
  int dayNumber = 10;

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    numbers = [];
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      numbers.add(int.parse(line));
    }
    numbers.add(0);
    numbers.sort();
    deviceJolt = numbers.last + 3;
    numbers.add(deviceJolt);
    print(numbers);

    for (int i = 0; i < numbers.length; i++) {
      if (i == 0) {
        continue;
      } else {
        if ((numbers[i] - numbers[i - 1]) == 1) {
          oneJoltDiffCount++;
        } else if ((numbers[i] - numbers[i - 1]) == 3) {
          threeJoltDiffCount++;
        } else if ((numbers[i] - numbers[i - 1]) == 2) {
          twoJoltDiffCount++;
        }
      }
    }

    partOneAnswer = (oneJoltDiffCount * threeJoltDiffCount).toString();

    print('$oneJoltDiffCount, $twoJoltDiffCount, $threeJoltDiffCount');
    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }

    List<int> possTable = [];
    possTable.add(1);
    possTable.add(1);
    possTable.add(2);
    possTable.add(4);

    for (int i = 4; i < 21; i++) {
      int nextPoss = 1 + (2 * possTable[i - 2]) + (2 * possTable[i - 3]);
      possTable.add(nextPoss);
    }

    print(possTable);

    print(numbers);

    int possibilities = 1;
    for (int i = 0; i < numbers.length - 1; i++) {
      int streak = 0;
      while ((numbers[i + streak] + 1) == (numbers[i + streak + 1])) {
        streak++;
      }
      print(streak);
      possibilities = possibilities * possTable[streak];

      i = i + streak;
    }

    partTwoAnswer = possibilities.toString();

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
