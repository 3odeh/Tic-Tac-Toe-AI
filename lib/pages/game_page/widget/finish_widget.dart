import 'package:flutter/material.dart';
import 'package:project4/game/game_controller.dart';
import 'package:project4/models/player_model.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';
import 'package:project4/widgets/Image.dart';
import 'package:project4/widgets/custom_button_widget.dart';

class FinishWidget extends StatelessWidget {
  final GameController gameController;
  final Function() onPressed;
  final PlayerModel? c;
  const FinishWidget({
    Key? key,
    required this.gameController,
    required this.onPressed,
    this.c,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.backgroundWhiteBlueColor.withOpacity(0.5),
      child: Center(
        child: Card(
          color: MyColors.backgroundWhiteBlueColor.withOpacity(0.8),
          child: SizedBox(
            height: 300,
            width: 500,
            child: (gameController.isAllRoundsFinish())
                ? finishAllRounds(context)
                : finishGame(context),
          ),
        ),
      ),
    );
  }

  Widget finishAllRounds(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Finish Game",
            style: MyTextStyles.text_24D.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    ImageHandle(
                      path:
                          "assets/images/${(gameController.getGame.getPlayer1.getIsXPlayer) ? 'x' : 'o'}.png",
                      width: 50,
                      height: 50,
                      color: (gameController.getGame.getPlayer1.getIsXPlayer)
                          ? MyColors.darkColor
                          : MyColors.oColor,
                    ),
                    Text(
                      gameController.getGame.getPlayer1.getName,
                      style: MyTextStyles.text_18D.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (gameController.getGame.getPlayer1.getIsXPlayer)
                            ? MyColors.darkColor
                            : MyColors.oColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                gameController.getGame.getResultGame(),
                style: MyTextStyles.text_28D.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    ImageHandle(
                      path:
                          "assets/images/${(gameController.getGame.getPlayer2.getIsXPlayer) ? 'x' : 'o'}.png",
                      width: 50,
                      height: 50,
                      color: (gameController.getGame.getPlayer2.getIsXPlayer)
                          ? MyColors.darkColor
                          : MyColors.oColor,
                    ),
                    Text(
                      gameController.getGame.getPlayer2.getName,
                      style: MyTextStyles.text_18D.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (gameController.getGame.getPlayer2.getIsXPlayer)
                            ? MyColors.darkColor
                            : MyColors.oColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            gameController.getGame.getWinnerName(),
            style: MyTextStyles.text_18D.copyWith(
              fontWeight: FontWeight.bold,
              color: (gameController.getGame.isWinnerX() == null ||
                      gameController.getGame.isWinnerX()!)
                  ? MyColors.darkColor
                  : MyColors.oColor,
            ),
          ),
          CustomButtonWidget(
            text: "Back",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );

  Widget finishGame(context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            gameController.winPlayer().$2 == null
                ? "Draw"
                : "${gameController.winPlayer().$1!.getName} win round ${gameController.getCurrentRound}",
            style: MyTextStyles.text_24D.copyWith(
              fontWeight: FontWeight.bold,
              color: (gameController.winPlayer().$2 == null ||
                      gameController.winPlayer().$1!.getIsXPlayer)
                  ? MyColors.darkColor
                  : MyColors.oColor,
            ),
          ),
          if (gameController.winPlayer().$2 != null)
            ImageHandle(
              path:
                  "assets/images/${(gameController.winPlayer().$1!.getIsXPlayer) ? 'x' : 'o'}.png",
              width: 100,
              height: 100,
              color: (gameController.winPlayer().$1!.getIsXPlayer)
                  ? MyColors.darkColor
                  : MyColors.oColor,
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageHandle(
                  path: "assets/images/x.png",
                  width: 100,
                  height: 100,
                  color: MyColors.darkColor,
                ),
                ImageHandle(
                  path: "assets/images/o.png",
                  width: 100,
                  height: 100,
                  color: MyColors.oColor,
                ),
              ],
            ),
          if (c != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "${c!.getName} win ${c!.getWin} / ${gameController.getGame.getRounds} coutinue?",
                    style: MyTextStyles.text_24D.copyWith(
                      fontWeight: FontWeight.bold,
                      color: (gameController.winPlayer().$2 == null ||
                              gameController.winPlayer().$1!.getIsXPlayer)
                          ? MyColors.darkColor
                          : MyColors.oColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonWidget(
                    text: "Back",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          CustomButtonWidget(
            text: "Next Round",
            onPressed: () {
              gameController.goNextRound();
              onPressed();
            },
          ),
        ],
      );
}
