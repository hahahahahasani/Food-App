import 'package:flutter/material.dart';
import 'package:food/app/screen/home.dart';
import 'package:food/app/screen/profile.dart';
import 'app/screen/splash.dart';
import 'app/screen/detail_makanan.dart';
import 'app/screen/quick_easy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
