import 'package:app/structs/stack.dart';
import 'package:flutter/cupertino.dart';

enum YesNoStack { yes, no }

class GameProvider with ChangeNotifier {
  var tally = 0;

  final constants = {
    1: {
      "increaseAmount": 1,
      "values": [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]
    },
    2: {
      "increaseAmount": 2,
      "values": [2, 3, 6, 7, 10, 11, 14, 15, 16, 19, 22, 23, 16, 27, 30]
    },
    3: {
      "increaseAmount": 4,
      "values": [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30]
    },
    4: {
      "increaseAmount": 8,
      "values": [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30]
    },
    5: {
      "increaseAmount": 16,
      "values": [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    }
  };

  final yesNoStack = StructStack<YesNoStack>();

  increaseTally(int by) {
    tally += by;
    notifyListeners();
  }

  decreaseTally(int by) {
    tally -= by;
    notifyListeners();
  }

  clear() {
    tally = 0;
    yesNoStack.clear();
    notifyListeners();
  }
}
