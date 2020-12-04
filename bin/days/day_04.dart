import 'dart:convert';

import '../day.dart';

class Day04 implements Day {
  List<String> lines;

  @override
  int dayNumber = 4;

  @override
  String solvePartOne(String input) {
    String partOneAnswer = 'partOneAnswerPlaceHolder';

    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);
    // for (int i = 0; i < lines.length; i++) {
    // String line = lines[i];
    // }

    List<String> passports = input.split('\n\n');

    int validCount = 0;
    for (int i = 0; i < passports.length; i++) {
      String passport = passports[i];
      if (passport.contains('byr') &&
          passport.contains('iyr') &&
          passport.contains('eyr') &&
          passport.contains('hgt') &&
          passport.contains('hcl') &&
          passport.contains('ecl') &&
          passport.contains('pid')) {
        if (checkByr(passport) &&
            checkIyr(passport) &&
            checkEyr(passport) &&
            checkHgt(passport) &&
            checkHcl(passport) &&
            checkEcl(passport) &&
            checkPid(passport)) {
          validCount++;
        }
      }
    }

    print(validCount);

    partOneAnswer = validCount.toString();
    return partOneAnswer;
  }

  bool checkByr(String passport) {
    bool check = false;
    String byr = extract(passport, 'byr');
    if (byr.length == 4) {
      int year = int.parse(byr);
      if (year >= 1920 && year <= 2002) {
        check = true;
      }
    }
    return check;
  }

  bool checkIyr(String passport) {
    bool check = false;
    String iyr = extract(passport, 'iyr');
    if (iyr.length == 4) {
      int year = int.parse(iyr);
      if (year >= 2010 && year <= 2020) {
        check = true;
      }
    }
    return check;
  }

  bool checkEyr(String passport) {
    bool check = false;
    String eyr = extract(passport, 'eyr');
    if (eyr.length == 4) {
      int year = int.parse(eyr);
      if (year >= 2020 && year <= 2030) {
        check = true;
      }
    }
    return check;
  }

  bool checkHgt(String passport) {
    bool check = false;
    String hgt = extract(passport, 'hgt');
    if (hgt.contains('cm')) {
      String sub = hgt.split('cm')[0];
      int len = int.parse(sub);
      if (len >= 150 && len <= 193) {
        check = true;
      }
    } else if (hgt.contains('in')) {
      String sub = hgt.split('in')[0];
      int len = int.parse(sub);
      if (len >= 59 && len <= 76) {
        check = true;
      }
    }
    return check;
  }

  bool checkHcl(String passport) {
    RegExp validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    bool check = false;
    String hcl = extract(passport, 'hcl');
    if (hcl[0] == '#' && hcl.length == 7) {
      String sub = hcl.substring(1);
      if (validCharacters.hasMatch(sub)) {
        check = true;
      }
    }
    return check;
  }

  bool checkEcl(String passport) {
    bool check = false;
    String ecl = extract(passport, 'ecl');
    if (ecl == 'amb' || ecl == 'blu' || ecl == 'brn' || ecl == 'gry' || ecl == 'grn' || ecl == 'hzl' || ecl == 'oth') {
      check = true;
    }
    return check;
  }

  bool checkPid(String passport) {
    RegExp validCharacters = RegExp(r'^[0-9]+$');
    bool check = false;
    String pid = extract(passport, 'pid');
    if (pid.length == 9) {
      if (validCharacters.hasMatch(pid)) {
        check = true;
      }
    }
    return check;
  }

  String extract(String passport, String part) {
    String label = '$part:';
    //int startIndex = password.indexOf(label) + label.length;
    String sub = passport.split(label)[1];
    sub = sub.split('\n')[0];
    sub = sub.split(' ')[0];
    return sub;
  }

  @override
  String solvePartTwo(String input) {
    String partTwoAnswer = 'partTwoAnswerPlaceHolder';

    for (int i = 0; i < lines.length; i++) {
      //String line = lines[i];
    }

    return partTwoAnswer;
  }

  @override
  void setLines(List<String> lines) {
    this.lines = lines;
  }
}
