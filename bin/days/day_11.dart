import '../day.dart';

typedef Scan = int Function(int ver, int hor);

class Day11 implements Day {
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;
  List<String> currentGen = [];
  List<String> nextGen = [];
  List<String> previousGen = [];
  List<String> currentGen2 = [];
  List<String> nextGen2 = [];
  List<String> previousGen2 = [];
  int length;
  int height;

  @override
  int dayNumber = 11;

  int scanNW(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while ((!((ver - dist) < 0)) && (!((hor - dist) < 0))) {
      if (currentGen2[ver-dist][hor-dist] == '#') {
        return 1;
      }
      if (currentGen2[ver-dist][hor-dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanN(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while (!(ver - dist < 0)) {
      if (currentGen2[ver-dist][hor] == '#') {
        return 1;
      }
      if (currentGen2[ver-dist][hor] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanNE(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while ((!((ver - dist) < 0)) && (!((hor + dist) > length-1))) {
      if (currentGen2[ver-dist][hor+dist] == '#') {
        return 1;
      }
      if (currentGen2[ver-dist][hor+dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanW(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while (!((hor - dist) < 0)) {
      if (currentGen2[ver][hor-dist] == '#') {
        return 1;
      }
      if (currentGen2[ver][hor-dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanE(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while (!((hor + dist) > length-1)) {
      if (currentGen2[ver][hor+dist] == '#') {
        return 1;
      }
      if (currentGen2[ver][hor+dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanSW(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while ((!((ver + dist) > height-1)) && (!((hor - dist) < 0))) {
      if (currentGen2[ver+dist][hor-dist] == '#') {
        return 1;
      }
      if (currentGen2[ver+dist][hor-dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanS(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while ((!((ver + dist) > height-1))) {
      if (currentGen2[ver+dist][hor] == '#') {
        return 1;
      }
      if (currentGen2[ver+dist][hor] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }
  int scanSE(int ver, int hor) {
    int found = 0;
    int dist = 1;
    while ((!((ver + dist) > height-1)) && (!((hor + dist) > length-1))) {
      if (currentGen2[ver+dist][hor+dist] == '#') {
        return 1;
      }
      if (currentGen2[ver+dist][hor+dist] == 'L') {
        return 0;
      }
      dist++;
    }
    return found;
  }



  int scanCountNeighbours(int ver, int hor) {
    int count = 0;

    List<Scan> dirs = [];
    dirs.add(scanNW);
    dirs.add(scanN);
    dirs.add(scanNE);
    dirs.add(scanW);
    dirs.add(scanE);
    dirs.add(scanSW);
    dirs.add(scanS);
    dirs.add(scanSE);

    for (Scan dir in dirs) {
      count = count + dir(ver, hor);
    }

    //print(count);
    return count;
  }

  int countOccupiedNeighbours(int ver, int hor) {
    int count = 0;
    if (!(ver == 0)) {
      String top = currentGen[ver-1];
      if (!(hor == 0)) {
        int left = hor-1;
        if (top[left] == '#') {
          count++;
        }
      }
      if (top[hor] == '#') {
        count++;
      }
      if (!(hor == length-1)) {
        int right = hor + 1;
        if (top[right] == '#') {
          count++;
        }
      }
    }
    if (!(hor == 0)) {
      if (currentGen[ver][hor-1] == '#') {
        count++;
      }
    }
    if (!(hor == length-1)) {
      if(currentGen[ver][hor+1] == '#') {
        count++;
      }
    }
    if (!(ver == height-1)) {
      String bot = currentGen[ver+1];
      if (!(hor == 0)) {
        int left = hor-1;
        if (bot[left] == '#') {
          count++;
        }
      }
      if (bot[hor] == '#') {
        count++;
      }
      if (!(hor == length-1)) {
        int right = hor+1;
        if (bot[right] == '#') {
          count++;
        }
      }
    }
    return count;
  }

  void proceedGen() {
    nextGen = [];
    for (int i = 0; i < currentGen.length; i++) {
      String currentLine = currentGen[i];
      String nextGenLine = '';
      for (int j = 0; j < currentLine.length; j++) {
        String char = currentLine[j];
        if (char == 'L' && countOccupiedNeighbours(i, j) == 0) {
          nextGenLine = '$nextGenLine#';
        }
        else if (char == '#' && countOccupiedNeighbours(i, j) >= 4) {
          nextGenLine = '$nextGenLine' 'L';
        } else {
          nextGenLine = '$nextGenLine$char';
        }
      }
      nextGen.add(nextGenLine);
    }
    previousGen = List.from(currentGen);
    currentGen = List.from(nextGen);
  }

  void proceedGen2() {
    nextGen2 = [];
    for (int i = 0; i < currentGen2.length; i++) {
      String currentLine = currentGen2[i];
      String nextGenLine = '';
      for (int j = 0; j < currentLine.length; j++) {
        String char = currentLine[j];
        if (char == 'L' && scanCountNeighbours(i, j) == 0) {
          nextGenLine = '$nextGenLine#';
        }
        else if (char == '#' && scanCountNeighbours(i, j) >= 5) {
          nextGenLine = '$nextGenLine' 'L';
        } else {
          nextGenLine = '$nextGenLine$char';
        }
      }
      nextGen2.add(nextGenLine);
    }
    previousGen2 = List.from(currentGen2);
    currentGen2 = List.from(nextGen2);
  }

  bool stale() {
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < length; j++) {
        if (! (currentGen[i][j] == previousGen[i][j])) {
          return false;
        }
      }
    }
      return true;
  }

  bool stale2() {
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < length; j++) {
        if ( (currentGen2[i][j] != previousGen2[i][j])) {
          return false;
        }
      }
    }
    return true;
  }

  int countOccupiedSeats(List<String> boat) {
    int os = 0;
    for (int i = 0; i < height; i++) {
      for (int j = 0; j < length; j++) {
        if ((boat[i][j] == '#')) {
          os++;
        }
      }
    }
    return os;
  }

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    length = lines[0].length;
    height = lines.length;

    currentGen = List.from(lines);

    proceedGen();
    while (!stale()) {
      proceedGen();
    }

    partOneAnswer = countOccupiedSeats(currentGen).toString();

    // 3924 is too high;
    return partOneAnswer;
  }

  @override
  String solvePartTwo() {

    currentGen2 = List.from(lines);

    proceedGen2();
    while (!stale2()) {
      proceedGen2();
    }

    partTwoAnswer = countOccupiedSeats(currentGen2).toString();

    // 122 is too low
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
