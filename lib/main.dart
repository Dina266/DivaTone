import 'package:flutter/material.dart';
import 'core/routes/app_routers.dart';
import 'core/routes/routing.dart';
import 'core/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DivaTone',
      theme: AppTheme.lightTheme,
      initialRoute: Routing.init,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
