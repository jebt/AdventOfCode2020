import 'dart:convert';

import '../day.dart';

class Day03 extends Day {
  List<String> lines;

  @override
  int dayNumber = 3;

  @override
  String solvePartOne(String input) {
    //print(input);

    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);

    int x = 0;
    int trees = 0;
    for (int y = 0; y < lines.length; y++) {
      String row = lines[y];
      if (x > row.length - 1) {
        x = x - row.length;
      }
      if (row[x] == '#') {
        trees++;
      }
      x = x + 3;
    }

    return trees.toString();
  }

  @override
  String solvePartTwo(String input) {
    // 189371544 was too low

    int answer =
        numberOfTrees(1, 1) * numberOfTrees(3, 1) * numberOfTrees(5, 1) * numberOfTrees(7, 1) * numberOfTrees(1, 2);

    return answer.toString();
  }

  int numberOfTrees(int right, int down) {
    int trees = 0;
    int x = 0;
    for (int y = 0; y < lines.length; y = y + down) {
      String row = lines[y];
      if (x > row.length - 1) {
        x = x - row.length;
      }
      if (row[x] == '#') {
        trees++;
      }
      x = x + right;
    }

    return trees;
  }

  @override
  void setLines(List<String> lines) {
    this.lines = lines;
  }
}
