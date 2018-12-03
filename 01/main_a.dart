import 'dart:io';

main() {
  var result = new File('data')
    .readAsLinesSync()
    .map((x) => int.parse(x))
    .reduce((a, b) => a + b);
 
  print(result);
}