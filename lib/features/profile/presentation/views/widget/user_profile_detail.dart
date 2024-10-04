import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../view_model/model/get_user.dart';
import 'custom_circle_avatar.dart';

class UserProfileDetail extends StatelessWidget {
  const UserProfileDetail({super.key, required this.userModelEntity});
  final UserModelEntity userModelEntity;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height / 3.3,
      decoration: BoxDecoration(
        color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)),
      ),
      child: Column(
        children: [
          CustomCircleAvatar(userModelEntity: userModelEntity,), const SizedBox(height: 16),
            Text(userModelEntity.email,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: context.isDarkMode
                        ? const Color.fromARGB(255, 103, 102, 102)
                        : AppColors.darkGrey)),
            const SizedBox(height: 10),
          Text(userModelEntity.name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode ? Colors.white : Colors.black)),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }


}
