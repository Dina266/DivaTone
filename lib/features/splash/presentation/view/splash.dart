import 'package:flutter/material.dart';
import '../../../../core/routes/routing.dart';
import 'widgets/custom_splash_logo.dart';

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
    return const Scaffold(
      body: Center(child: AppLogo()),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, Routing.getStarted);
  }
}
