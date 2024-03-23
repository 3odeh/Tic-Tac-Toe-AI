import 'package:flutter/material.dart';
import 'package:project4/models/player_model.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';
import 'package:project4/widgets/Image.dart';

class PlayerCard extends StatelessWidget {
  final PlayerModel player;
  final bool isPlayerTurn;
  const PlayerCard({
    Key? key,
    required this.player,
    required this.isPlayerTurn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: (isPlayerTurn) ? MyColors.primaryColor : null,
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              ImageHandle(
                path: "assets/images/${(player.getIsXPlayer) ? 'x' : 'o'}.png",
                width: 100,
                height: 100,
                color: (player.getIsXPlayer)
                    ? MyColors.darkColor
                    : MyColors.oColor,
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      player.getName,
                      style: MyTextStyles.text_24D.copyWith(
                        fontWeight: FontWeight.bold,
                        color: (player.getIsXPlayer)
                            ? MyColors.darkColor
                            : MyColors.oColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Wins : ${player.getWin}",
                    style: MyTextStyles.text_24D.copyWith(
                      fontWeight: FontWeight.bold,
                      color: (player.getIsXPlayer)
                          ? MyColors.darkColor
                          : MyColors.oColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
