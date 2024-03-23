class PlayerModel {
  final String _name;
  final bool _isXPlayer;
  int _win = 0;

  PlayerModel({
    required String name,
    required bool isXPlayer,
  })  : _name = name,
        _isXPlayer = isXPlayer;

  String get getName => _name;
  bool get getIsXPlayer => _isXPlayer;
  int get getWin => _win;

  set setWin(int value) {
    _win = value;
  }

  void incrementWin() {
    _win++;
  }
}
