import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/view/choose_mode_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/onboarding/presentation/view/signin_r_signup_view.dart';
import '../../features/splash/presentation/view/splash.dart';
import '../routes/routing.dart';

class AppRouters {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routing.getStarted:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routing.changeMood:
        return MaterialPageRoute(builder: (_) => const ChooseModeView());
      case Routing.signinOrSignupView:
        return MaterialPageRoute(builder: (_) => const SigninOrSignupView());

      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

