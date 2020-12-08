import '../day.dart';

class Day08 implements Day {
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;
  int accumulator = 0;

  @override
  int dayNumber = 8;

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    accumulator = 0;
    List<bool> visited = [];
    for (int i = 0; i < lines.length; i++) {
      visited.add(false);
    }
    bool loopDetected = false;
    int i = 0;
    while (!loopDetected) {
      visited[i] = true;
      String line = lines[i];
      String instruction = line.split(' ')[0];
      String sign = line.split(' ')[1][0];
      String numberString = '';
      int number = 0;
      if (sign == '+') {
        numberString = line.split('+')[1].trim();
      } else if (sign == '-') {
        numberString = line.split('-')[1].trim();
      }
      number = int.parse(numberString);

      if (instruction == 'nop') {
        i++;
      } else if (instruction == 'acc') {
        if (sign == '-') {
          accumulator = accumulator - number;
        } else if (sign == '+') {
          accumulator = accumulator + number;
        }
        i++;
      } else if (instruction == 'jmp') {
        if (sign == '-') {
          i = i - number;
        } else if (sign == '+') {
          i = i + number;
        }
      }

      if (visited[i] == true) {
        loopDetected = true;
      }
    }

    partOneAnswer = accumulator.toString();
    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    bool reachedEnd = false;
    int nopJmpIteration = 0;
    while (!reachedEnd) {
      //print('nopJmpIteration: $nopJmpIteration');
      List<bool> visited = [];
      for (int i = 0; i < lines.length; i++) {
        visited.add(false);
      }
      bool loopDetected = false;
      int i = 0;
      int instructionNumber = 0;
      accumulator = 0;
      while (!loopDetected && !reachedEnd) {
        instructionNumber++;
        //print(i);
        visited[i] = true;
        String line = lines[i];
        String instruction = line.split(' ')[0];
        String sign = line.split(' ')[1][0];
        String numberString = '';
        int number = 0;
        if (sign == '+') {
          numberString = line.split('+')[1].trim();
        } else if (sign == '-') {
          numberString = line.split('-')[1].trim();
        }
        number = int.parse(numberString);

        if (instruction == 'nop') {
          if (nopJmpIteration == instructionNumber) {
            if (sign == '-') {
              i = i - number;
            } else if (sign == '+') {
              i = i + number;
            }
          } else {
            i++;
          }
        } else if (instruction == 'acc') {
          if (sign == '-') {
            accumulator = accumulator - number;
          } else if (sign == '+') {
            accumulator = accumulator + number;
          }
          i++;
        } else if (instruction == 'jmp') {
          if (nopJmpIteration == instructionNumber) {
            i++;
          } else {
            if (sign == '-') {
              i = i - number;
            } else if (sign == '+') {
              i = i + number;
            }
          }
        }
        if (i < lines.length) {
          if (visited[i] == true) {
            loopDetected = true;
          }
        }
        if (i > lines.length) {
          loopDetected = true;
        }
        if (i == lines.length) {
          reachedEnd = true;
          //print('REACHED END');
        }
      }
      nopJmpIteration++;
    }

    // 154106 is too high
    partTwoAnswer = accumulator.toString();
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
