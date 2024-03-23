import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';

class StatisticCard extends StatelessWidget {
  final int currentRound;
  final int allRounds;

  final int draw;
  const StatisticCard({
    Key? key,
    required this.allRounds,
    required this.currentRound,
    required this.draw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Rounds : $allRounds",
                  style: MyTextStyles.text_16D,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: 2,
                    height: 20,
                    color: MyColors.primaryColor,
                  ),
                ),
                Text(
                  "Draws : $draw",
                  style: MyTextStyles.text_16D,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Round $currentRound",
              style: MyTextStyles.text_28D.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
