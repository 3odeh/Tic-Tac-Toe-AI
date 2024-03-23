class BestMoveModel {
  int _wins = 0;
  int _lose = 0;
  int _draw = 0;
  int _score = -2;
  final int currentIndex;

  BestMoveModel({
    required this.currentIndex,
  });

  int get wins => _wins;
  int get lose => _lose;
  int get score => _score;
  int get draw => _draw;

  set wins(int value) {
    _wins = value;
  }

  set lose(int value) {
    _lose = value;
  }

  set draw(int value) {
    _draw = value;
  }

  set score(int value) {
    _score = value;
  }

  set value(int data) {
    switch (data) {
      case 0:
        _draw++;
        break;
      case 1:
        _wins++;
        break;
      case -1:
        _lose++;
        break;
    }
  }

  @override
  String toString() {
    return 'BestMoveModel $currentIndex (wins: $_wins, losses: $_lose, draws: $_draw, score: $_score)';
  }
}
