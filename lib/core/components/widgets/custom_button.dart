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
      child:Text(title, style:TextStyle(color: Colors.white)) ,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height?? 80)
      )
    );
  }
}