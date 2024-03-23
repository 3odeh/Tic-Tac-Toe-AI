import 'dart:math';

import 'package:project4/models/best_move_model.dart';

class BestMove {
  static (int, List<BestMoveModel?>) getBestMove(
    List<String> gameData,
    bool isXTurn,
  ) {
    List<BestMoveModel?> result = List.generate(9, (index) => null);

    int indexBestMove = -1;

    for (var i = 0; i < gameData.length; i++) {
      if (gameData[i] == '') {
        BestMoveModel tmpScore = BestMoveModel(currentIndex: i);
        tmpScore.score =
            _getBestMove(gameData, isXTurn, false, isXTurn, i, tmpScore);
        if (indexBestMove < 0 ||
            result[indexBestMove]!.score < tmpScore.score) {
          indexBestMove = i;
        }

        result[i] = tmpScore;
      }
    }
    return (indexBestMove, result);
  }

  static int _getBestMove(
    List<String> gameData,
    bool isRobotX, // this to know if the computer x or o
    bool isMaxmum,
    bool isXTurn,
    int p,
    BestMoveModel bestMoveModel,
  ) {
    // set value in p
    gameData[p] = (isXTurn) ? 'x' : 'o';

    // check end game
    int? finishGame = getFinishGame(gameData, isRobotX);

    if (finishGame != null) {
      // set result
      bestMoveModel.value = finishGame;

      // remove value
      gameData[p] = '';

      return finishGame;
    } else {
      // set inial value
      int bestScore = (isMaxmum) ? -2 : 2;

      // this loop to find the bestScore in another posible moves
      for (var i = 0; i < gameData.length; i++) {
        if (gameData[i] == '') {
          bestScore = maxOrMin(
            _getBestMove(
                gameData, isRobotX, !isMaxmum, !isXTurn, i, bestMoveModel),
            bestScore,
            isMaxmum,
          );
        }
      }
      // remove value
      gameData[p] = '';
      return bestScore;
    }
  }

  static void printData(
    List<String> gameData,
  ) {
    String res = '';
    for (var i = 1; i <= gameData.length; i++) {
      res += "${(gameData[i - 1] == '') ? "|" : gameData[i - 1]} ";
      if (i % 3 == 0) {
        print(res);
        res = '';
      }
    }
  }

  static int? getFinishGame(
    List<String> gameData,
    bool isXTurn, // this to know the win for who
  ) {
    // here check for win lose draw depend x or o turn and return 1 : win , 0 : draw , -1 : lose
    for (var i = 0; i < 3; i++) {
      // check horozontal *3 cuse it skip 3 index and return 1 when the (x turn and data equal x) or (o turn and data equal o)
      if (gameData[3 * i] != '' &&
          gameData[3 * i] == gameData[3 * i + 1] &&
          gameData[3 * i + 1] == gameData[3 * i + 2]) {
        return ((isXTurn && gameData[3 * i] == 'x') ||
                (!isXTurn && gameData[3 * i] == 'o'))
            ? 1
            : -1;
      }

      // check virtical and return 1 when the (x turn and data equal x) or (o turn and data equal o)
      if (gameData[i] != '' &&
          gameData[i] == gameData[i + 3] &&
          gameData[i + 3] == gameData[i + 6]) {
        return ((isXTurn && gameData[i] == 'x') ||
                (!isXTurn && gameData[i] == 'o'))
            ? 1
            : -1;
      }
    }

    // check diagonal left right , and right left
    if ((gameData[0] != '' &&
            gameData[0] == gameData[4] &&
            gameData[4] == gameData[8]) ||
        (gameData[2] != '' &&
            gameData[2] == gameData[4] &&
            gameData[4] == gameData[6])) {
      return ((isXTurn && gameData[4] == 'x') ||
              (!isXTurn && gameData[4] == 'o'))
          ? 1
          : -1;
    }

    // this mean its draw
    if (gameData.indexWhere((element) => element == '') == -1) {
      return 0;
    }

    return null;
  }
}

int maxOrMin(int value, int bestScore, bool isMaxmum) {
  if (isMaxmum) {
    return max(value, bestScore);
  } else {
    return min(value, bestScore);
  }
}
