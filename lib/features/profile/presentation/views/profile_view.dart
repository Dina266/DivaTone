import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/features/profile/presentation/view_model/get_user/get_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/profile_view_body.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.isDarkMode? Color(0xff1C1B1B):Color(0xffE5E5E5),
      appBar: CustomAppBar(
        // isHome: true,
        title: Text('Profile' , style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: context.isDarkMode?  Colors.white : Colors.black
                ),),
        backGroundColor: context.isDarkMode? const Color(0xff2C2B2B) : Colors.white ,
      ),
      body: BlocProvider(create: (_)=> GetUserCubit()..getUser(),
      
      child: const ProfileViewBody(),)
    ));
  }
}