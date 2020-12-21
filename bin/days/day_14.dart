import 'package:binary/binary.dart';

import '../day.dart';

class Day14 implements Day {
  @override
  int dayNumber = 14;

  String input;
  List<String> lines;
  String partOneAnswer = 'partOneAnswerPlaceHolder';
  String partTwoAnswer = 'partTwoAnswerPlaceHolder';

  int applyMask(int preMaskValue, String mask) {
    String preBin = preMaskValue.toBinaryPadded(36);
    String postBin = '';
    for (int i = 0; i < mask.length; i++) {
      String maskBit = mask[i];
      if (maskBit == 'X') {
        postBin = postBin + preBin[i];
      } else {
        postBin = postBin + maskBit;
      }
    }
    int postMaskValue = postBin.bits;
    return postMaskValue;
  }

  @override
  String solvePartOne() {
    final memRegexp = RegExp(r'(?<=\[)(.*)(?=\])');

    Map<int, int> memMap = {};
    String mask;
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      if (line.contains('mask')) {
        mask = line.split(' = ').last;
      } else {
        RegExpMatch memMatch = memRegexp.firstMatch(line);
        int mem = int.parse(memMatch.group(0));
        int preMaskValue = int.parse(line.split(' = ').last);
        int postMaskValue = applyMask(preMaskValue, mask);
        memMap[mem] = postMaskValue;
      }
    }

    int total = 0;
    for (int val in memMap.values) {
      total += val;
    }

    partOneAnswer = total.toString();
    return partOneAnswer;
  }

  List<int> applyMask2(int mem, String mask) {
    List<int> mems = [];
    List<String> memBinsNextGen = [];
    String preBin = mem.toBinaryPadded(36);
    String postBin = '';
    for (int i = 0; i < mask.length; i++) {
      String maskBit = mask[i];
      if (maskBit == '0') {
        postBin = postBin + preBin[i];
      } else {
        postBin = postBin + maskBit;
      }
    }

    List<String> memBins = [postBin];
    while (memBins[0].contains('X')) {
      int xIndex = memBins[0].indexOf('X');
      for (String memBin in memBins) {
        String toAdd1 = '';
        String toAdd2 = '';
        for (int i = 0; i < memBin.length; i++) {
          if (i == xIndex) {
            toAdd1 = '$toAdd1' '0';
            toAdd2 = '$toAdd2' '1';
          } else {
            toAdd1 = '$toAdd1${memBin[i]}';
            toAdd2 = '$toAdd2${memBin[i]}';
          }
        }
        memBinsNextGen.add(toAdd1);
        memBinsNextGen.add(toAdd2);
      }
      memBins = memBinsNextGen;
      memBinsNextGen = [];
    }

    for (String memBin in memBins) {
      mems.add(memBin.bits);
    }

    return mems;
  }

  @override
  String solvePartTwo() {
    final memRegexp = RegExp(r'(?<=\[)(.*)(?=\])');

    Map<int, int> memMap = {};
    String mask;
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      if (line.contains('mask')) {
        mask = line.split(' = ').last;
      } else {
        RegExpMatch memMatch = memRegexp.firstMatch(line);
        int mem = int.parse(memMatch.group(0));
        int preMaskValue = int.parse(line.split(' = ').last);
        List<int> postMaskMems = applyMask2(mem, mask);
        for (int mem in postMaskMems) {
          memMap[mem] = preMaskValue;
        }
      }
    }

    int total = 0;
    for (int val in memMap.values) {
      total += val;
    }

    partTwoAnswer = total.toString();
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
