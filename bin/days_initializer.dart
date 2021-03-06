import 'dart:convert';
import 'dart:io';

import 'day.dart';

import 'days/day_01.dart';
import 'days/day_02.dart';
import 'days/day_03.dart';
import 'days/day_04.dart';
import 'days/day_05.dart';
import 'days/day_06.dart';
import 'days/day_07.dart';
import 'days/day_08.dart';
import 'days/day_09.dart';
import 'days/day_10.dart';
import 'days/day_11.dart';
import 'days/day_12.dart';
import 'days/day_13.dart';
import 'days/day_14.dart';
import 'days/day_15.dart';

Future<List<Day>> getDays() async {
  List<Day> days = <Day>[];
  days.add(Day01());
  days.add(Day02());
  days.add(Day03());
  days.add(Day04());
  days.add(Day05());
  days.add(Day06());
  days.add(Day07());
  days.add(Day08());
  days.add(Day09());
  days.add(Day10());
  days.add(Day11());
  days.add(Day12());
  days.add(Day13());
  days.add(Day14());
  days.add(Day15());

  for (Day day in days) {
    String input = await getInput(day.dayNumber);
    day.setInput(input);
    LineSplitter ls = LineSplitter();
    List<String> lines = ls.convert(input);
    day.setLines(lines);
  }

  return days;
}

Future<String> getInput(int dayNumber) async {
  String inputPath = 'bin/input/day$dayNumber.txt';
  File inputFile = File(inputPath);
  return inputFile.readAsString();
}
