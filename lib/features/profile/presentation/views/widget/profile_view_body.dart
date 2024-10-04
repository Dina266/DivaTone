
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/get_user/get_user_cubit.dart';
import 'profile_view_body_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit,GetUserState>(
      builder: (context , state) {
        if(state is GetUserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is GetUserSuccess) {
          return ProfileViewBodyItem(userModelEntity: state.userEntity);
        }
        else {
          return const Center(child: Text('Error Loading Profile'));
        }
      }
      );
  }
}