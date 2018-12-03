import 'dart:io';

main() {
  var data = new File('data')
    .readAsLinesSync()
    .map((x) => int.parse(x))
    .toList();
 
  var pastFrequencies = [0];

  while(true) {
    for (var item in data) {
      var newFrequency = pastFrequencies.last + item;
      if (pastFrequencies.contains(newFrequency)) {
        print(newFrequency);
        return;
      }

      pastFrequencies.add(newFrequency);
    }
  }
}