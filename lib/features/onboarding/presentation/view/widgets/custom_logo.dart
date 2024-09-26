import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          width: 150,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/images/appicon.jpeg',
                      width: 55, height: 55)),
              const SizedBox(
                width: 4,
              ),
              Text(
                'DivaTone',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
