List<String> splitOnWhiteLine(String input) {
  List<String> units = input.split('\n\n');
  units = units[0].split('\r\n\r\n');
  return units;
}
