import 'package:project4/models/player_model.dart';

class GameModel {
  final PlayerModel _player1;
  final PlayerModel _player2;
  final int _rounds;
  final int
      _gameType; //0 => Person Vs Person , 1 Person Vs Robot-Medium , 2 Person Vs Robot-Impossible

  GameModel({
    required PlayerModel player1,
    required PlayerModel player2,
    required int rounds,
    required int gameType,
  })  : _player1 = player1,
        _player2 = player2,
        _rounds = rounds,
        _gameType = gameType;

  PlayerModel get getPlayer1 => _player1;
  PlayerModel get getPlayer2 => _player2;
  int get getRounds => _rounds;
  int get getGameType => _gameType;

  PlayerModel getPlayer(String value) {
    if (value == 'x') {
      if (_player1.getIsXPlayer) {
        return _player1;
      } else {
        return _player2;
      }
    } else {
      if (!_player1.getIsXPlayer) {
        return _player1;
      } else {
        return _player2;
      }
    }
  }

  String getResultGame() => "${getPlayer1.getWin}/${getPlayer2.getWin}";

  String getWinnerName() {
    if (getPlayer1.getWin > getPlayer2.getWin) {
      return "${getPlayer1.getName} Winner";
    } else if (getPlayer1.getWin < getPlayer2.getWin) {
      return "${getPlayer2.getName} Winner";
    } else {
      return "Draw";
    }
  }

  bool? isWinnerX() {
    if (getPlayer1.getWin > getPlayer2.getWin) {
      return getPlayer1.getIsXPlayer;
    } else if (getPlayer1.getWin < getPlayer2.getWin) {
      return getPlayer2.getIsXPlayer;
    } else {
      return null;
    }
  }
}
