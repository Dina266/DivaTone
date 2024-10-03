import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/core/routes/routing.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.actions, this.isHome});
  final Widget? title;
  final List<Widget>? actions;
  final bool? isHome;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.all(10),
      child: AppBar(
        centerTitle: true,
        title: title != null? title! :const Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: actions,
        leading:IconButton(
            onPressed: (){
              isHome !=null? Navigator.pushReplacementNamed(context, Routing.homeView):
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
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+10);
}