
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/widgets/custom_button.dart';

class CustomTextHasAnEmail extends StatelessWidget {
  const CustomTextHasAnEmail({super.key, required this.btnTxt, required this.txt, required this.onPressed});
  final String btnTxt;
  final String txt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(txt,style: TextStyle(
                          color: context.isDarkMode? Colors.white: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        )),
        CustomTextButton(
          onPressed:onPressed ,
          title: btnTxt,
          fontWeight: FontWeight.w600,
          color: Colors.blue,
        ),
      ],
    );
  }
}
