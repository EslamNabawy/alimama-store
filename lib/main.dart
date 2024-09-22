import 'package:fake_nike_store/Core/Constants/app_colors.dart';
import 'package:fake_nike_store/Presentation/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.secondaryTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}
