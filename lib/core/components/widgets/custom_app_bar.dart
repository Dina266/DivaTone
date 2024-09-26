import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.all(20),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: 
            Container(
              
              decoration: BoxDecoration(
          color: context.isDarkMode? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.04),
          shape: BoxShape.circle
      
          ),
          width: 50,
          height:  50,
          
              child: Icon(Icons.arrow_back_ios,
              size: 15,
              color: context.isDarkMode? Colors.white: Colors.black,
              ),
            )
            ),
      
      ),
    );
  }
}