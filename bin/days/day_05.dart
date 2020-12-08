import '../day.dart';

class Day05 implements Day {
  String input;
  List<String> lines;

  @override
  int dayNumber = 5;

  @override
  String solvePartOne() {
    String partOneAnswer = 'partOneAnswerPlaceHolder';

    int highestSeatId = 0;
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      //String rowCode = line.substring(0, 7);
      //String columnCode = line.substring(7);
      int rowMin = 0;
      int rowMax = 127;
      int rowHalf = 63;
      int columnMin = 0;
      int columnMax = 7;
      int columnHalf = 3;
      int seatId = 0;
      for (int i = 0; i < line.length; i++) {
        String letter = line[i];
        if (letter == 'F') {
          rowMax = rowHalf;
        } else if (letter == 'B') {
          rowMin = rowHalf + 1;
        }
        rowHalf = (((rowMin + rowMax + 1) / 2) - 1).toInt();
        if (letter == 'L') {
          columnMax = columnHalf;
        } else if (letter == 'R') {
          columnMin = columnHalf + 1;
        }
        columnHalf = (((columnMin + columnMax + 1) / 2) - 1).toInt();
      }
      seatId = (rowMin * 8) + columnMin;
      if (seatId > highestSeatId) {
        highestSeatId = seatId;
      }
    }

    // 963 is too low
    // max gives 980, also too low
    partOneAnswer = highestSeatId.toString();
    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    String partTwoAnswer = 'partTwoAnswerPlaceHolder';

    List<bool> seats = List<bool>(1024);
    for (int i = 0; i < seats.length; i++) {
      seats[i] = false;
    }

    int highestSeatId = 0;
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      //String rowCode = line.substring(0, 7);
      //String columnCode = line.substring(7);
      int rowMin = 0;
      int rowMax = 127;
      int rowHalf = 63;
      int columnMin = 0;
      int columnMax = 7;
      int columnHalf = 3;
      int seatId = 0;
      for (int i = 0; i < line.length; i++) {
        String letter = line[i];
        if (letter == 'F') {
          rowMax = rowHalf;
        } else if (letter == 'B') {
          rowMin = rowHalf + 1;
        }
        rowHalf = (((rowMin + rowMax + 1) / 2) - 1).toInt();
        if (letter == 'L') {
          columnMax = columnHalf;
        } else if (letter == 'R') {
          columnMin = columnHalf + 1;
        }
        columnHalf = (((columnMin + columnMax + 1) / 2) - 1).toInt();
      }
      seatId = (rowMin * 8) + columnMin;
      seats[seatId] = true;
      if (seatId > highestSeatId) {
        highestSeatId = seatId;
      }
    }

    int mySeat = 0;
    for (int i = 1; i < ((seats.length) - 1); i++) {
      if (seats[i] == false && seats[i - 1] == true && seats[i + 1] == true) {
        mySeat = i;
      }
    }

    partTwoAnswer = mySeat.toString();
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
