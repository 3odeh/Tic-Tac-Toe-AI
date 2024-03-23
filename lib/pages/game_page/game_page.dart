import 'package:flutter/material.dart';
import 'package:project4/game/game_controller.dart';
import 'package:project4/models/game_model.dart';
import 'package:project4/pages/game_page/widget/best_move_widget.dart';
import 'package:project4/pages/game_page/widget/finish_widget.dart';
import 'package:project4/pages/game_page/widget/player_card.dart';
import 'package:project4/pages/game_page/widget/statistic_card.dart';
import 'package:project4/pages/game_page/widget/xo_widget.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';
import 'package:project4/widgets/custom_button_widget.dart';

class GamePage extends StatefulWidget {
  final GameModel game;
  final bool isPlayer1PlayFirst;
  const GamePage({
    Key? key,
    required this.game,
    required this.isPlayer1PlayFirst,
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final GameController gameController;
  bool showBestMoveResult = false;

  @override
  void initState() {
    super.initState();
    gameController = GameController(
        game: widget.game, isPlayer1PlayFirst: widget.isPlayer1PlayFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Game",
          style: MyTextStyles.text_28L.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (MediaQuery.of(context).size.width > 1140 &&
                            gameController.bestMoveResult == null)
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 1140) / 2,
                          ),
                        PlayerCard(
                          player: gameController.getGame.getPlayer1,
                          isPlayerTurn: gameController.isPlayer1Turn,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        StatisticCard(
                          currentRound: gameController.getCurrentRound,
                          allRounds: gameController.getGame.getRounds,
                          draw: gameController.getNumberOfDraw,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        PlayerCard(
                          player: gameController.getGame.getPlayer2,
                          isPlayerTurn: !gameController.isPlayer1Turn,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: (gameController.bestMoveResult == null)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        if (gameController.bestMoveResult != null)
                          const SizedBox(
                            width: 460,
                          ),
                        if (MediaQuery.of(context).size.width > 1100 &&
                            gameController.bestMoveResult == null)
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 1100) / 2,
                          ),
                        Container(
                          color: MyColors.primaryColor,
                          height: 500,
                          width: 500,
                          child: GridView.builder(
                            itemCount: 9,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (c, index) => XoWidget(
                              value: gameController.getIndexGameData(index),
                              isXTurn: gameController.isXTurn(),
                              onClick: () {
                                setState(() {
                                  gameController.setIndexGameData(index);
                                });
                              },
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        ),
                        if (gameController.bestMoveResult != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                if (showBestMoveResult)
                                  Container(
                                    color: MyColors.primaryColor,
                                    height: 400,
                                    width: 400,
                                    child: GridView.builder(
                                      itemCount: 9,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                      ),
                                      itemBuilder: (_, index) => (gameController
                                                  .bestMoveResult!.$2[index] !=
                                              null)
                                          ? BestMoveWidget(
                                              bestMove: gameController
                                                  .bestMoveResult!.$2[index]!)
                                          : XoWidget(
                                              value: gameController
                                                  .getIndexGameData(index),
                                              isXTurn: gameController.isXTurn(),
                                              onClick: () {},
                                            ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                    ),
                                  )
                                else
                                  const SizedBox(
                                    width: 400,
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButtonWidget(
                                  text: (showBestMoveResult) ? "Hide" : "Show",
                                  onPressed: () {
                                    setState(() {
                                      showBestMoveResult = !showBestMoveResult;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          if (gameController.currentGameFinish())
            FinishWidget(
              gameController: gameController,
              c: gameController.isCheckContinue(),
              onPressed: () {
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
