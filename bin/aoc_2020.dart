import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

import 'day.dart';
import 'days_initializer.dart';

const int dayNumber = 7;

String input;
List<Day> days;
AnsiPen pen;

void main(List<String> arguments) async {
  ansiColorDisabled = false;
  pen = AnsiPen()..green(bold: true);
  input = await getInput(dayNumber);
  //print(input);
  days = getDays();
  for (int i = 0; i < days.length; i++) {
    //await printDay(days[i]);
  }
  printDay(days[dayNumber - 1]);
  //days[dayNumber - 1].solvePartOne(input);
}

Future<void> printDay(Day day) async {
  String input = await getInput(day.dayNumber);
  print('day ${day.dayNumber}:');
  print('${pen('answer to part one: ')}${'${day.solvePartOne(input)}'}');
  print('answer to part two: ${day.solvePartTwo(input)}');
  print('');
}

Future<String> getInput(int dayNumber) async {
  String inputPath = 'bin/input/day$dayNumber.txt';
  File inputFile = File(inputPath);
  return inputFile.readAsString();

  // String inputUrl = 'https://adventofcode.com/2020/day/$day/input';
  // var response = await http.get(inputUrl);
  // return(response.body);
}
