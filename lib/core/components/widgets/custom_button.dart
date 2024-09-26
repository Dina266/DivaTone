import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, this.height, required this.title, required this.onPressed});
  final double? height ;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      onPressed: onPressed ,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height?? 80)
      ),
      child:Text(title, style:const TextStyle(color: Colors.white))
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.title, required this.onPressed, this.fontWeight, this.color});
  final String title;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton (
      onPressed: onPressed ,
      child:Text(title, style: TextStyle(
                          color:color!=null?color! : context.isDarkMode? Colors.white: Colors.black,
                          fontSize: 17,
                          fontWeight:fontWeight !=null? fontWeight! : FontWeight.bold 
                        )) ,
      
    );
  }
}