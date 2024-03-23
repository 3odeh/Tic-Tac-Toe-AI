import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project4/util/colors.dart';
import 'package:project4/util/text_style.dart';

class NumberTextFieldWidget extends StatelessWidget {
  final TextEditingController numberTF;
  const NumberTextFieldWidget({
    Key? key,
    required this.numberTF,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberTF,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(RegExp(r'^0'))
      ],
      style: MyTextStyles.text_18D,
      cursorColor: MyColors.primaryColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          return "Please enter the number of rounds";
        }
        return null;
      },
    );
  }
}
