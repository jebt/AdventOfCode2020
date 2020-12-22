import 'dart:collection';

import '../day.dart';

class Day15 implements Day {
  @override
  int dayNumber = 15;

  String input;
  List<String> lines;
  String partOneAnswer = 'partOneAnswerPlaceHolder';
  String partTwoAnswer = 'partTwoAnswerPlaceHolder';

  void useSampleInput() {
    input = '0,3,6';
    lines = ['sil1', 'sil2', 'sil3'];
  }

  @override
  String solvePartOne() {
    //useSampleInput();
    List<String> numberStrings = input.split(',');
    List<int> numbers = [];
    for (String s in numberStrings) {
      numbers.add(int.parse(s));
    }

    //while (numbers.length < 2020) {
    while (numbers.length < 30000000) {
      if (numbers.length % 100000 == 0) {
        print(30000000 - numbers.length);
      }
      int last = numbers.last;
      bool found = false;
      for (int i = numbers.length - 2; i >= 0; i--) {
        int num = numbers[i];
        if (num == last) {
          int lastIndex = i;
          found = true;
          int age = (numbers.length - 1) - lastIndex;
          numbers.add(age);
          break;
        }
      }
      if (!found) {
        numbers.add(0);
      }
    }

    partOneAnswer = numbers[2020 - 1].toString();
    partTwoAnswer = numbers[30000000 - 1].toString();

    return partOneAnswer;
  }

  @override
  String solvePartTwo() {
    // List<String> numberStrings = input.split(',');
    // //List<int> numbers = [];
    // HashMap<int, int> numbers2 = HashMap();
    // for (int i = 0; i < numberStrings.length; i++) {
    //   String s = numberStrings[i];
    //   int num = int.parse(s);
    //   //numbers.add(num);
    //   numbers2[i] = (num);
    // }
    //
    // // maintain a list with when each number was seen last?
    //
    // while (numbers2.length < 30000000) {
    //   //while (numbers2.length < 2020) {
    //   if ((30000000 - numbers2.length) % 1000 == 0) {
    //     print(30000000 - numbers2.length);
    //   }
    //   int last = numbers2.values.last;
    //   numbers2.remove(numbers2.length - 1);
    //   if (!(numbers2.containsValue(last))) {
    //     numbers2[numbers2.length] = last;
    //     numbers2[numbers2.length] = 0;
    //     //numbers.add(0);
    //   } else {
    //     int lastIndex =
    //         numbers2.keys.lastWhere((element) => numbers2[element] == last);
    //     int age = (numbers2.length) - lastIndex;
    //     numbers2[numbers2.length] = last;
    //     numbers2[numbers2.length] = age;
    //     //numbers.add(age);
    //   }
    // }
    //
    // partTwoAnswer = numbers2.values.last.toString();
    // //print(numbers2);

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
