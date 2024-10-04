import 'dart:developer';

import 'package:diva_tone/features/profile/presentation/views/widget/user_profile_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    // redirect();
    handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AppLogo()),
    );
  }

  // Future<void> redirect() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.pushReplacementNamed(context, Routing.getStarted);
  // }
  
  void handleNavigation() async{
    await Future.delayed(const Duration(seconds: 2));
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushReplacementNamed(context , Routing.homeView);
    }  else {
      Navigator.pushReplacementNamed(context ,Routing.getStarted);
    }
  }
}

