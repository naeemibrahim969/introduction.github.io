import 'package:flutter/material.dart';
import 'package:uipractice/components/text_field_container.dart';
import 'package:uipractice/utils/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputField({Key? key,required this.hintText, required this.iconData,required this.onChanged,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
              icon: Icon(iconData,color: kPrimaryColor,),
              hintText: hintText,
              border: InputBorder.none
          ),
        )
    );
  }
}
