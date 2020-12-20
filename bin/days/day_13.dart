import '../day.dart';

class Day13 implements Day {
  String input;
  List<String> lines;
  String partOneAnswer = 'partOneAnswerPlaceHolder';
  String partTwoAnswer = 'partTwoAnswerPlaceHolder';
  int earliestDepartTime;
  List<int> possibleTimes = [];
  int bestTime;
  int bestBusId;
  List<String> busIds;

  @override
  int dayNumber = 13;

  @override
  String solvePartOne() {
    List<int> busses = [];
    earliestDepartTime = int.parse(lines[0]);
    busIds = lines[1].split(',');
    for (int i = 0; i < busIds.length; i++) {
      String busId = busIds[i];
      if (busId == 'x') {
        continue;
      } else {
        int bus = int.parse(busId);
        busses.add(bus);
        int firstAfterEarliest = findFirstAfterEarliestTime(bus);
        possibleTimes.add(firstAfterEarliest);
      }
    }

    bestTime = possibleTimes[0];
    for (int i = 0; i < possibleTimes.length; i++) {
      int possibleTime = possibleTimes[i];
      if (possibleTime < bestTime) {
        bestTime = possibleTime;
        bestBusId = busses[i];
      }
    }

    int wait = bestTime - earliestDepartTime;
    partOneAnswer = (wait * bestBusId).toString();

    return partOneAnswer;
  }

  int findFirstAfterEarliestTime(int bus) {
    int time = bus;
    while (time < earliestDepartTime) {
      time = time + bus;
    }
    return time;
  }

  @override
  String solvePartTwo() {
    // bigger than 100.000.000.000.000
    int answer = 0;
    bool answerFound = false;
    int baseBus = int.parse(busIds[0]);
    int baseTime = baseBus;

    //92000000000000 through 312110000000000 no cigar
    //775230782877242 would have taken about 10 days of brute force

    int highestSequential = 0;
    int baseBusIncrement = baseBus;
    int firstTimeSeqBase = 0;
    int secondTimeSeqBase = 0;
    bool firstTimeSeq = true;
    bool secondTimeSeqSet = false;
    int whileIteration = 0;
    while (!answerFound) {
      whileIteration++;
      if ((whileIteration % 100) == 0) {
        //print('$whileIteration, $baseTime, $baseBusIncrement');
      }
      BASE_MULTIPLIER:
      for (int i = 0; i < busIds.length; i++) {
        String busId = busIds[i];
        if (busId != 'x') {
          int busInt = int.parse(busId);
          if (!((baseTime + i) % busInt == 0)) {
            baseTime = baseTime + baseBusIncrement;
            break BASE_MULTIPLIER;
          } else if (i == busIds.length - 1) {
            answer = baseTime;
            answerFound = true;
          } else if (highestSequential <= i) {
            if (highestSequential < i) {
              firstTimeSeq = true;
              secondTimeSeqSet = false;
              highestSequential = i;
              // print('highestSequential: $highestSequential/${busIds.length}. '
              //     'baseTime: $baseTime. baseBusIncrement: $baseBusIncrement');
            }
            if (firstTimeSeq) {
              firstTimeSeqBase = baseTime;
              firstTimeSeq = false;
            } else if (!secondTimeSeqSet) {
              secondTimeSeqBase = baseTime;
              baseBusIncrement = secondTimeSeqBase - firstTimeSeqBase;
              secondTimeSeqSet = true;
            }
          }
        }
      }
    }
    partTwoAnswer = answer.toString();
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
