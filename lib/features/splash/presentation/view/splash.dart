import 'package:diva_tone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routing.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
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
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Routing.getStarted);
  }
}
