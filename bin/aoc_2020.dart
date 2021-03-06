import 'package:ansicolor/ansicolor.dart';

import 'day.dart';
import 'days_initializer.dart';

const int dayNumber = 15;

String input;
List<Day> days;
AnsiPen pen;

void main(List<String> arguments) async {
  ansiColorDisabled = false;
  pen = AnsiPen()..green(bold: true);
  input = await getInput(dayNumber);

  days = await getDays();
  for (int i = 0; i < days.length; i++) {
    //await printDay(days[i]);
  }
  //print(input);
  printDay(days[dayNumber - 1]);
  //days[dayNumber - 1].solvePartOne();
  //days[dayNumber - 1].solvePartTwo();
  //print(days[dayNumber - 1].solvePartOne());
  //print(days[dayNumber - 1].solvePartTwo());
}

Future<void> printDay(Day day) async {
  pen = AnsiPen()..magenta(bold: true);
  print('day ${pen(day.dayNumber)}:');
  pen = AnsiPen()..cyan(bold: true);
  print('answer to part one: ${'${pen(day.solvePartOne())}'}');
  print('answer to part two: ${pen(day.solvePartTwo())}');
  print('');
}
