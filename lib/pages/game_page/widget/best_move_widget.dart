import 'package:flutter/material.dart';
import 'package:project4/models/best_move_model.dart';

class BestMoveWidget extends StatelessWidget {
  final BestMoveModel bestMove;
  const BestMoveWidget({
    Key? key,
    required this.bestMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text('Wins : ${bestMove.wins}'),
          Text('Loses : ${bestMove.lose}'),
          Text('Draw : ${bestMove.draw}'),
          Text('Score : ${bestMove.score}'),
        ],
      ),
    );
  }
}
