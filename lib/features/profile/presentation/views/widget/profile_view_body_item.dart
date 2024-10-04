
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/view_model/auth_cubit.dart';
import '../../view_model/model/get_user.dart';
import 'public_play_list.dart';
import 'user_profile_detail.dart';

class ProfileViewBodyItem extends StatelessWidget {
  const ProfileViewBodyItem({super.key, required this.userModelEntity});
  final UserModelEntity userModelEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => AuthCubit(),
            child: UserProfileDetail(userModelEntity: userModelEntity,),
          ),
          Padding(
            padding: const EdgeInsets.only(left :20.0 , top: 20),
            child: Text('FAVORITE SONGS' , style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.isDarkMode?  Colors.white : Colors.black
                    ),),
          ),
                  const PublicPlayList()
      
        ],
      ),
    );
  }
}
