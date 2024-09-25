
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Image.asset('assets/images/appicon.jpeg',
                    width: 120, height: 120)),
            const SizedBox(
              width: 4,
            ),
            Text(
              'DivaTone',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        );
  }
}