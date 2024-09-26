
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintTxt});
  final String hintTxt;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintTxt,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
