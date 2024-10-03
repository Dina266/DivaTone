
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: context.isDarkMode? Colors.white : Colors.black ,
      indicatorColor: AppColors.primary,
      dividerHeight: 0,
      isScrollable: true,
      tabs: const [
      Text('News',
      style: TextStyle(fontWeight: FontWeight.w500,
      fontSize: 20),),
      Text('Videos',
      style: TextStyle(fontWeight: FontWeight.w500,
      fontSize: 20)),
      Text('Artists',
      style: TextStyle(fontWeight: FontWeight.w500,
      fontSize: 20)),
      Text('Podcasts',
      style: TextStyle(fontWeight: FontWeight.w500,
      fontSize: 20)),
    ]);
  }
}
