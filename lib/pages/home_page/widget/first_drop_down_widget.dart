import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project4/util/colors.dart';

class FirstDropDownWidget extends StatelessWidget {
  final Function(dynamic) onChange;
  const FirstDropDownWidget({Key? key, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      enableSearch: false,
      clearOption: false,
      initialValue: "Player1",
      textFieldDecoration: InputDecoration(
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
      dropDownItemCount: 3,
      dropdownRadius: 12,
      dropDownList: const [
        DropDownValueModel(name: "Player1", value: 1),
        DropDownValueModel(name: "Player2", value: 2),
        DropDownValueModel(name: "Random", value: 3)
      ],
      onChanged: onChange,
    );
  }
}
