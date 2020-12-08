import '../day.dart';

class Day02 implements Day {
  String input;
  List<String> lines;

  @override
  int dayNumber = 2;

  int partTwoValidCount = 0;

  @override
  String solvePartOne() {
    int validCount = 0;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      String range;
      int spaceIndex;
      spaceIndex = line.indexOf(' ');
      range = line.substring(0, spaceIndex);
      int dashIndex = range.indexOf('-');
      int min = int.parse(range.substring(0, dashIndex));
      int max = int.parse(range.substring(dashIndex + 1));
      String letter = line.substring(spaceIndex + 1, spaceIndex + 2);
      int colonIndex = line.indexOf(':');
      String password = line.substring(colonIndex + 2);
      int letterCount = 0;
      for (int j = 0; j < password.length; j++) {
        if (password[j] == letter) {
          letterCount++;
        }
      }

      if (letterCount >= min && letterCount <= max) {
        validCount++;
      }

      //part two
      int posIsLetter = 0;
      password = '$password                                        ';
      String firstPosLetter = password.substring(min - 1, min);
      String secondPosLetter = password.substring(max - 1, max);

      if (letter == firstPosLetter) {
        posIsLetter++;
      }

      if (letter == secondPosLetter) {
        posIsLetter++;
      }

      if (posIsLetter == 1) {
        partTwoValidCount++;
      }
    }

    return validCount.toString();
  }

  @override
  String solvePartTwo() {
    return partTwoValidCount.toString();
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
