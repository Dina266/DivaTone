import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/onboarding/presentation/view/choose_mode_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/onboarding/presentation/view/signin_or_signup_view.dart';
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
      case Routing.signInOrSignUpView:
        return MaterialPageRoute(builder: (_) => const SignInOrSignUpView());
      case Routing.signUpView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignUpView(),
                ));
      case Routing.signInView:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignInView(),
                ));

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
