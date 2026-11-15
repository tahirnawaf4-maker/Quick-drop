import 'package:flutter/material.dart';
import 'package:quick_drop/core/constants/appConfig.dart';
import 'package:quick_drop/core/theme/app_theme.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text(
            AppConfig.appName,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
