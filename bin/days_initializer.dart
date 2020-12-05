import 'day.dart';

import 'days/day_01.dart';
import 'days/day_02.dart';
import 'days/day_03.dart';
import 'days/day_04.dart';
import 'days/day_05.dart';
import 'days/day_06.dart';

List<Day> getDays() {
  List<Day> days = <Day>[];
  days.add(Day01());
  days.add(Day02());
  days.add(Day03());
  days.add(Day04());
  days.add(Day05());
  days.add(Day06());
  return days;
}
