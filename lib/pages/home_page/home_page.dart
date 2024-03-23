import 'dart:math';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project4/models/game_model.dart';
import 'package:project4/models/player_model.dart';
import 'package:project4/pages/game_page/game_page.dart';
import 'package:project4/pages/home_page/widget/first_drop_down_widget.dart';
import 'package:project4/pages/home_page/widget/name_text_field_widget%20copy.dart';
import 'package:project4/pages/home_page/widget/number_text_field_widget.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';
import 'package:project4/widgets/Image.dart';
import 'package:project4/widgets/custom_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController player1NameTF = TextEditingController();
  final TextEditingController player2NameTF = TextEditingController();
  final TextEditingController roundNumberTF = TextEditingController(text: "1");
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  int gameType = 0;
  int startFirst = 1;
  bool isXPlayer1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Form(
            key: key,
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 1070)
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - 1070) / 2,
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageHandle(
                          path: "assets/images/x.png",
                          width: 180,
                          height: 180,
                          color: MyColors.primaryColor,
                        ),
                        ImageHandle(
                          path: "assets/images/o.png",
                          width: 180,
                          height: 180,
                          color: MyColors.primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: gameType,
                          groupValue: 0,
                          onChanged: (v) {
                            setState(() {
                              gameType = 0;
                              player2NameTF.text = "";
                            });
                          },
                        ),
                        Text(
                          "Person Vs Person",
                          style: MyTextStyles.text_18D,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Radio(
                          value: gameType,
                          groupValue: 1,
                          onChanged: (v) {
                            setState(() {
                              gameType = 1;
                              player2NameTF.text = "Robot-Easy";
                            });
                          },
                        ),
                        Text(
                          "Person Vs Robot-Easy",
                          style: MyTextStyles.text_18D,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Radio(
                          value: gameType,
                          groupValue: 2,
                          onChanged: (v) {
                            setState(() {
                              gameType = 2;
                              player2NameTF.text = "Robot-Impossible";
                            });
                          },
                        ),
                        Text(
                          "Person Vs Robot-Impossible",
                          style: MyTextStyles.text_18D,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              children: [
                                ImageHandle(
                                  path:
                                      "assets/images/${(isXPlayer1) ? 'x' : 'o'}.png",
                                  width: 100,
                                  height: 100,
                                  color: (isXPlayer1)
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
                                    Text(
                                      "Player1",
                                      style: MyTextStyles.text_24D.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: (isXPlayer1)
                                            ? MyColors.darkColor
                                            : MyColors.oColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: NameTextFieldWidget(
                                        numberTF: player1NameTF,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              disabledBackgroundColor: MyColors.unselectedColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isXPlayer1 = !isXPlayer1;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Swap X and O",
                                style: MyTextStyles.text_18L,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              children: [
                                ImageHandle(
                                  path:
                                      "assets/images/${(!isXPlayer1) ? 'x' : 'o'}.png",
                                  width: 100,
                                  height: 100,
                                  color: (!isXPlayer1)
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
                                    Text(
                                      "Player2",
                                      style: MyTextStyles.text_24D.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: (!isXPlayer1)
                                            ? MyColors.darkColor
                                            : MyColors.oColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: NameTextFieldWidget(
                                        numberTF: player2NameTF,
                                        enable: gameType == 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Who play first?",
                              style: MyTextStyles.text_18D,
                            ),
                            SizedBox(
                              width: 250,
                              child: FirstDropDownWidget(
                                onChange: (value) {
                                  if (value != null &&
                                      value is DropDownValueModel) {
                                    startFirst = value.value;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: Column(
                            children: [
                              Text(
                                "Number of Round",
                                style: MyTextStyles.text_18D,
                              ),
                              NumberTextFieldWidget(
                                numberTF: roundNumberTF,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonWidget(
                      text: "Play",
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          GameModel gm = GameModel(
                            player1: PlayerModel(
                              name: player1NameTF.text,
                              isXPlayer: isXPlayer1,
                            ),
                            player2: PlayerModel(
                              name: player2NameTF.text,
                              isXPlayer: !isXPlayer1,
                            ),
                            rounds: int.parse(roundNumberTF.text),
                            gameType: gameType,
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => GamePage(
                                game: gm,
                                isPlayer1PlayFirst: (startFirst == 3)
                                    ? Random().nextBool()
                                    : startFirst == 1,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
