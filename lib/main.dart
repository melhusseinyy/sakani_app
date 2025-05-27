import 'package:flutter/material.dart';
import 'package:sakni/views/splash_screen.dart';
import 'package:sakni/views/splash_screen.dart';

void main() {
  runApp(SakaniApp());
}
class SakaniApp extends StatelessWidget {
  const SakaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    );
  }
}