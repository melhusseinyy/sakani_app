import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/widgets/custom_container.dart';
import 'package:sakni/widgets/custom_text_field.dart';

import 'package:sakni/widgets/high_container.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Stack(
        children: [
          HighContainer(title: 'نسيت كلمة المرور',
      subTitle: 'اختر الطريقة التي تريد ان تستلم بها كود استرجاع كلمة المرور',),
       Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child: Container(
            height: 580.h
      ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r)),
          color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Column(
                children: [
                  SizedBox(height: 60.h,),
                  CustomFormTextField(hintText: 'رقم الهاتف', suffixIcon: Icons.phone, onChanged: (Data){}, borderColor:Color(0xff15B097),maxLines: 3,)
                ],
              ),
            ),
          ),
        ),
        ],
      ) ,
    );
  }
}