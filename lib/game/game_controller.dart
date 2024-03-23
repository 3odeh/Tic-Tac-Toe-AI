import 'dart:math';

import 'package:project4/game/best_move.dart';
import 'package:project4/models/best_move_model.dart';
import 'package:project4/models/game_model.dart';
import 'package:project4/models/player_model.dart';

class GameController {
  final GameModel _game;
  final List<String> _gameData = List.generate(9, (index) => '');
  final bool _isPlayer1PlayFirstGame;
  int _currentRound = 1;
  int _numberOfDraw = 0;
  (int, List<BestMoveModel?>)? bestMoveResult;

  bool _isPlayer1Turn;
  // bool when its is null that mean its draw
  (PlayerModel?, bool?)? _finishGame;

  GameController({
    required GameModel game,
    required bool isPlayer1PlayFirst,
  })  : _game = game,
        _isPlayer1PlayFirstGame = isPlayer1PlayFirst,
        _isPlayer1Turn = isPlayer1PlayFirst {
    _randomPlayer2Play();
    _bestPlayer2Play();
  }

  int get getCurrentRound => _currentRound;
  GameModel get getGame => _game;
  bool get isPlayer1Turn => _isPlayer1Turn;
  int get getNumberOfDraw => _numberOfDraw;
  String getIndexGameData(int index) => _gameData[index];
  bool isAllRoundsFinish() => _currentRound == _game.getRounds;
  bool isXTurn() {
    if (_isPlayer1Turn) {
      return _game.getPlayer1.getIsXPlayer;
    } else {
      return _game.getPlayer2.getIsXPlayer;
    }
  }

  // this method return if the game finish
  bool currentGameFinish() => _finishGame != null;

  // this method return the name of win player
  (PlayerModel?, bool?) winPlayer() => _finishGame!;

  void setIndexGameData(int index) {
    _gameData[index] = isXTurn() ? "x" : "o";

    if (!_checkGameFinish()) {
      _nextPlay();
    }
  }

  void goNextRound() {
    // reset the game
    for (var i = 0; i < _gameData.length; i++) {
      _gameData[i] = '';
    }

    // increment round
    _incrementRound();

    // put who is first
    _isPlayer1Turn = (_currentRound.isOdd)
        ? _isPlayer1PlayFirstGame
        : !_isPlayer1PlayFirstGame;

    // reset finish game variable
    _finishGame = null;

    // start if player2 is robot
    _randomPlayer2Play();
    _bestPlayer2Play();
  }

  void _nextPlay() {
    _isPlayer1Turn = !_isPlayer1Turn;
    if (_game.getGameType == 1) {
      _randomPlayer2Play();
    } else {
      if (!isPlayer1Turn) {
        _bestPlayer2Play();
      }
    }
  }

  // This method to play random move
  void _randomPlayer2Play() {
    if (isPlayer1Turn || _game.getGameType != 1) {
      return;
    }
    List<int> tmpAvilablePlaces = [];

    for (var i = 0; i < _gameData.length; i++) {
      if (_gameData[i] == '') {
        tmpAvilablePlaces.add(i);
      }
    }

    int randomIndex = Random().nextInt(tmpAvilablePlaces.length);
    _gameData[tmpAvilablePlaces[randomIndex]] =
        _game.getPlayer2.getIsXPlayer ? 'x' : 'o';

    _checkGameFinish();
    _isPlayer1Turn = !_isPlayer1Turn;
  }

  // This method to play best move useing MinMaxAlogorithm
  void _bestPlayer2Play() {
    if (isPlayer1Turn || _game.getGameType != 2) {
      return;
    }

    // set result of best
    (int, List<BestMoveModel?>) result =
        BestMove.getBestMove(_gameData, _game.getPlayer2.getIsXPlayer);

    _gameData[result.$2[result.$1]!.currentIndex] =
        _game.getPlayer2.getIsXPlayer ? 'x' : 'o';

    bestMoveResult = result;

    // check the result
    _checkGameFinish();

    // next play
    _isPlayer1Turn = !_isPlayer1Turn;
  }

  bool continueWinGame = false;
  PlayerModel? isCheckContinue() {
    if (continueWinGame || _game.getGameType == 2) {
      return null;
    }
    int player1 = _game.getPlayer1.getWin;
    int player2 = _game.getPlayer2.getWin;
    if (player1 > (_game.getRounds / 2)) {
      return _game.getPlayer1;
    }
    if (player2 > (_game.getRounds / 2)) {
      return _game.getPlayer2;
    }
    return null;
  }

  // This method to check if the game finish or not and set the values
  bool _checkGameFinish() {
    // here check for win lose draw and set values

    for (var i = 0; i < 3; i++) {
      // check horozontal *3 cuse it skip 3 index
      if (_gameData[3 * i] != '' &&
          _gameData[3 * i] == _gameData[3 * i + 1] &&
          _gameData[3 * i + 1] == _gameData[3 * i + 2]) {
        PlayerModel tmpPlayer = _game.getPlayer(_gameData[3 * i]);
        _finishGame = (tmpPlayer, tmpPlayer.getIsXPlayer);
        tmpPlayer.incrementWin();
        return true;
      }

      // check virtical
      if (_gameData[i] != '' &&
          _gameData[i] == _gameData[i + 3] &&
          _gameData[i + 3] == _gameData[i + 6]) {
        PlayerModel tmpPlayer = _game.getPlayer(_gameData[i]);
        _finishGame = (tmpPlayer, tmpPlayer.getIsXPlayer);
        tmpPlayer.incrementWin();
        return true;
      }
    }

    // check diagonal left right , and right left
    if ((_gameData[0] != '' &&
            _gameData[0] == _gameData[4] &&
            _gameData[4] == _gameData[8]) ||
        (_gameData[2] != '' &&
            _gameData[2] == _gameData[4] &&
            _gameData[4] == _gameData[6])) {
      PlayerModel tmpPlayer = _game.getPlayer(_gameData[4]);
      _finishGame = (tmpPlayer, tmpPlayer.getIsXPlayer);
      tmpPlayer.incrementWin();
      return true;
    }
    if (_gameData.indexWhere((element) => element == '') == -1) {
      _finishGame = (null, null);
      _incrementDraw();
      return true;
    }

    return false;
  }

  void _incrementRound() {
    _currentRound++;
  }

  void _incrementDraw() {
    _numberOfDraw++;
  }
}
