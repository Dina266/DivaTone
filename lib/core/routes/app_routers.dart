import 'package:flutter/material.dart';
import '../../features/splash/presentation/view/splash.dart';
import '../routes/routing.dart';

class AppRouters {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routing.getStarted:
        return MaterialPageRoute(builder: (_) => const Scaffold(body:Center(child: Text("Get Started"))));

      
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

