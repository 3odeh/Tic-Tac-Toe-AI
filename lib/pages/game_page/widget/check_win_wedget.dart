import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';

class CheckWinWedget extends StatelessWidget {
  const CheckWinWedget({Key? key}) : super(key: key);

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
            child: Container(
              color: MyColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
