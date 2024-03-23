import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: MyColors.unselectedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: MyTextStyles.text_18L,
        ),
      ),
    );
  }
}
