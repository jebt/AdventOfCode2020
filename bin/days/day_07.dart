import 'dart:convert';
import 'package:directed_graph/directed_graph.dart';

import '../day.dart';

class Day07 implements Day {
  List<String> lines;
  DirectedGraph<String> graph;
  Vertex<String> shinyGoldVertex;
  String partOneAnswer;
  String partTwoAnswer;
  int bagCount = 0;

  @override
  int dayNumber = 7;

  @override
  String solvePartOne(String input) {
    partOneAnswer = 'partOneAnswerPlaceHolder';
    partTwoAnswer = 'partTwoAnswerPlaceHolder';
    LineSplitter ls = LineSplitter();
    lines = ls.convert(input);

    Map<String, List<String>> graphData = {};
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
      String parrentBag = line.split(' bags')[0];
      graphData.putIfAbsent(parrentBag, () => []);
      List<String> graphList = graphData[parrentBag];
      String containsString = line.split('contain ')[1];
      List<String> containsList = containsString.split(', ');
      for (int j = 0; j < containsList.length; j++) {
        String itemWithCount = containsList[j].split(' bag')[0];
        if (itemWithCount[0] == 'n') {
          continue;
        }
        int count = int.parse(itemWithCount.split(' ')[0]);
        int spaceIndex = itemWithCount.indexOf(' ');
        String item = itemWithCount.substring(spaceIndex + 1);
        for (int k = 0; k < count; k++) {
          graphList.add(item);
        }
      }
    }
    //print(graphData);

    graph = DirectedGraph<String>.fromData(graphData);

    //print(graph.isAcyclic);

    shinyGoldVertex =
        graph.firstWhere((dynamic element) => (element as Vertex<String>).data == 'shiny gold') as Vertex<String>;

    int possiblePathCount = 0;
    for (int i = 0; i < graph.length; i++) {
      Vertex<String> vertex = graph.elementAt(i) as Vertex<String>;
      if (vertex.data == 'shiny gold') {
        continue;
      }
      dynamic shortestPath = graph.shortestPath(vertex, shinyGoldVertex);
      if (shortestPath != null) {
        possiblePathCount++;
      }
    }
    partOneAnswer = possiblePathCount.toString();

    return partOneAnswer;
  }

  @override
  String solvePartTwo(String input) {
    //print(graph.displayStructure);
    //print(graph.edges(shinyGoldVertex));

    countBags(shinyGoldVertex);
    partTwoAnswer = bagCount.toString();

    return partTwoAnswer;
  }

  void countBags(Vertex<String> vertex) {
    //Vertex<String> vertex = graph.where((dynamic element) => (element as Vertex<String>).id == id) as Vertex<String>;
    int edgeCount = graph.edges(vertex).length;
    bagCount = bagCount + edgeCount;
    for (int i = 0; i < edgeCount; i++) {
      countBags(graph.edges(vertex)[i]);
    }
  }

  @override
  void setLines(List<String> lines) {
    this.lines = lines;
  }
}
