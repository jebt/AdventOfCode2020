import '../day.dart';

class Point {
  Point(this.x, this.y);
  int x;
  int y;
}

class Day12 implements Day {
  
  
  String input;
  List<String> lines;
  String partOneAnswer;
  String partTwoAnswer;
  int lat = 0;
  int lon = 0;
  int dir  = 1;
  int val = 0;
  String ins = '';
  Point waypoint = Point(10, -1);
  
  


  @override
  int dayNumber = 12;

  void move(String ins, int val) {
    if (ins == 'F') {
      if (dir == 1) {
        move('E', val);
      } else if (dir == 2) {
        move('S', val);
      } else if (dir == 3) {
        move('W', val);
      } else if (dir == 0) {
        move('N', val);
      }
    } else if (ins == 'E') {
      lat = lat + val;
    } else if (ins == 'S') {
      lon = lon + val;
    } else if (ins == 'W') {
      lat = lat - val;
    } else if (ins == 'N') {
      lon = lon - val;
    }
  }

  void moveToWaypoint(int val) {
    for (int i = 0; i < val; i++) {
      lat = lat + waypoint.x;
      lon = lon + waypoint.y;
    }
  }

  void moveWaypoint(String ins, int val) {
    if (ins == 'F') {
      moveToWaypoint(val);
    } else if (ins == 'E') {
      waypoint.x = waypoint.x + val;
    } else if (ins == 'S') {
      waypoint.y = waypoint.y + val;
    } else if (ins == 'W') {
      waypoint.x = waypoint.x - val;
    } else if (ins == 'N') {
      waypoint.y = waypoint.y - val;
    }
  }

  void steerRight(int val) {
    dir = (dir + val) % 4;
  }

  void steerLeft(int val) {
    dir = ((dir - val) % 4).abs();
  }

  void turnWaypointRight(int q) {
    if (q == 0) {
      return;
    } else {
      for (int i = 0; i < q; i++) {
        int x = waypoint.x;
        waypoint.x = (waypoint.y) *-1;
        waypoint.y = x;
      }
    }
  }

  void turnWaypointLeft(int q) {
    if (q == 0) {
      return;
    } else {
      for (int i = 0; i < q; i++) {
        int y = waypoint.y;
        waypoint.y = (waypoint.x) *-1;
        waypoint.x = y;
      }
    }
  }

  @override
  String solvePartOne() {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      ins = line[0];
      val = int.parse(line.substring(1));

      if ((ins == 'E') | (ins == 'S') | (ins == 'W') | (ins == 'N') | (ins == 'F')) {
        move(ins, val);
      } else if ((ins == 'L') | (ins == 'R')) {
        int q = (val~/90)%4;
        if (ins == 'R') {
          steerRight(q);
        } else if (ins == 'L') {
          steerLeft(q);
        }
      }
    }

    partOneAnswer = (lat.abs() + lon.abs()).toString();

    return partOneAnswer;
  }

  @override
  String solvePartTwo() {

    lat = 0;
    lon = 0;

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      ins = line[0];
      val = int.parse(line.substring(1));

      if ((ins == 'E') | (ins == 'S') | (ins == 'W') | (ins == 'N') | (ins == 'F')) {
        moveWaypoint(ins, val);
      } else if ((ins == 'L') | (ins == 'R')) {
        int q = (val~/90)%4;
        if (ins == 'R') {
          turnWaypointRight(q);
        } else if (ins == 'L') {
          turnWaypointLeft(q);
        }
      }
    }

    partTwoAnswer = (lat.abs() + lon.abs()).toString();

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
