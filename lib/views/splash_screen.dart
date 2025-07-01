import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sakni/widgets/home_view_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), ()=>
    Navigator.pushReplacement(context,MaterialPageRoute(
      builder: (context)=>HomeViewBody()
    ), )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff008080).withValues(alpha: 0.12),
              Color(0xff84C36A).withValues(alpha: 0.12),
              Color(0xffFFFFFF).withValues(alpha: 0.12),
              Color(0xffF6F9F6).withValues(alpha: 0.12),
              Color(0xffFCFDFC).withValues(alpha: 0.12),
              Color(0xffFEFEFE).withValues(alpha: 0.12),
              Color(0xffFFFFFF).withValues(alpha: 0.12)
            ],
             stops: [
        0.0,   // أول لون
        0.16,  // الثاني
        0.32,  // الثالث
        0.48,  // الرابع
        0.64,  // الخامس
        0.80,  // السادس
        1.0    // السابع
      ],
          ),
          
        ),
        child: Center(child: Image.asset('assets/images/Group 2.png'))
      ),
    );
  }
}
