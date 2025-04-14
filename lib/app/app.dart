import 'package:flutter/material.dart';
import 'package:vg_coffee_app/app/navigation/app_router.dart';
import 'package:vg_coffee_app/theme/app_theme.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: AppRouter.router,
      builder: (context, child) => child!,
    );
  }
}
