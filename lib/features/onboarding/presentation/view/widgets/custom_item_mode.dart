
import 'package:flutter/material.dart';

class CustomItemMode extends StatelessWidget {
  const CustomItemMode({super.key , required this.title, required this.image});
  final String title;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xff30393c).withOpacity(0.5)
        
        ),
        
        child: Image.asset(
          fit: BoxFit.none,
          image),
              ),
        const SizedBox(height: 16,),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          color: Color(0xffDADADA),
          ),
        )

      ],
    );
  }
}