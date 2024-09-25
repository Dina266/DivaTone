import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../data/theme_cubit/theme_cubit.dart';
import 'custom_item_mode.dart';

class ItemChangeMode extends StatelessWidget {
  const ItemChangeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ()=> context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
          child: const CustomItemMode(title: "Dark Mode",image:AppImages.moon)),
        const SizedBox(width: 40,),
        GestureDetector(
          onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.light),
          child: const CustomItemMode(title: "Light Mode",image: AppImages.sun)),

      ],
    );

  }
}
