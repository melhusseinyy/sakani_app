import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/widgets/sign_up_body.dart';
import 'package:sakni/widgets/custom_text_home.dart';



class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextHome(title:'مرحبا بك في سكني' ,subTitle: 'هيا قم بتسجبل الدخول وابدأ رحلتك في البحث عن سكنك',),
        Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child: SignUpBody(),
        ),
      
      ],
    );
  }
}