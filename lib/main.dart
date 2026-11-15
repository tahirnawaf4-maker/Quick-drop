import 'package:flutter/material.dart';
import 'package:quick_drop/core/constants/appConfig.dart';
import 'package:quick_drop/core/theme/app_theme.dart';
import 'package:quick_drop/features/auth/presentation/screens/login_screen.dart';
import 'package:quick_drop/features/auth/presentation/screens/splash_screen.dart';

void main() {
  runApp(const QuickDrop());
}

class QuickDrop extends StatelessWidget {
  const QuickDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      home: LoginScreen(),
    );
  }
}
