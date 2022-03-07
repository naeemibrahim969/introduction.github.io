import 'package:flutter/material.dart';
import 'package:uipractice/components/text_field_container.dart';
import 'package:uipractice/utils/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField(
      {Key? key,
      required this.hintText,
      required this.iconData,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              color: kPrimaryColor,
              onPressed: () {
              },
            ),
            border: InputBorder.none),
    ));
  }
}
