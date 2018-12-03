import 'dart:io';

main() {
  var result = new File('data')
    .readAsLinesSync()
    .map((x) => x.split(''))
    .map(countOccurences)
    .reduce((a, b) => Occurences.fromResult(a.twos + b.twos, a.threes + b.threes));
 
  print(result.twos * result.threes);
}

class Occurences {
  int twos = 0;
  int threes = 0;

  Occurences.fromExistance(bool hasTwo, bool hasThree) {
    if (hasTwo) twos = 1;
    if (hasThree) threes = 1;
  }

  Occurences.fromResult(this.twos, this.threes);

  @override
    String toString() {
      return '[$twos, $threes]';
    }
}

Occurences countOccurences(Iterable<String> data) {
  final map = new Map<String, int>();
  data.forEach((i) => map[i] = (map[i] ?? 0) + 1);

  return Occurences.fromExistance(
    map.values.any((x) => x == 2), 
    map.values.any((x) => x == 3));
}