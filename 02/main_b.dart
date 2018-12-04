import 'dart:io';

main() {
  var items = new File('data')
    .readAsLinesSync()
    .toList();

  for (var x in items) {
    for (var y in items) {
      if (x == y) continue;

      var xItems = x.split('');
      var yItems = y.split('');

      var diverging = 0;
      var divergingAt = 0;
      for (var i = 0; i < xItems.length; i++) {
        if (xItems[i] != yItems[i]) { 
          diverging++;
          divergingAt = i;
        }

        if (diverging > 1) break;
      }

      if (diverging == 1) {
        var cleanedList = xItems.toList()..removeAt(divergingAt);
        print(cleanedList.join());
        return;
      }
    }
  }
}
