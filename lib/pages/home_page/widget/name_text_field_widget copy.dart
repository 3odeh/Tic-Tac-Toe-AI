import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';

class NameTextFieldWidget extends StatelessWidget {
  final TextEditingController numberTF;
  final bool enable;

  const NameTextFieldWidget({
    Key? key,
    required this.numberTF,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberTF,
      style: MyTextStyles.text_18D,
      textAlign: TextAlign.start,
      cursorColor: MyColors.primaryColor,
      enabled: enable,
      decoration: InputDecoration(
        labelText: "Player Name",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        isDense: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.primaryColor),
            borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.errorColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (numberTF.text.isEmpty) {
          return "Please enter name player";
        }
        return null;
      },
    );
  }
}
