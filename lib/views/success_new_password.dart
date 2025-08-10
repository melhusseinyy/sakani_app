import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/custom_button.dart';

import 'package:sakni/widgets/home_view_body.dart';

class SuccessNewPassword extends StatelessWidget {
  const SuccessNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xff006666), width: double.infinity),
          Positioned(
            top: 232.h,
            left: 0,
            right: 0,
            child: Container(
              height: 580.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              child: Column(
               
                children: [
                SizedBox(height: 110.h,),
                Image.asset('assets/images/fi_827880.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 24,bottom: 14).h,
                  child: Text('تم تغيير كلمه المرور بنجاح',style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600
                  ),),
                  
                ),Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 52).w,
                  child: Text('تم تغيير كلمه المرور بنجاح قم بالعوده الى صفحه تسجيل الدخول واملأ بياناتك مره اخرى',style: TextStyle(
                    color: Color(0xff9CA2AC),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    
                  ),
                  textAlign: TextAlign.center,),
                ),
                SizedBox(height: 200.h,),
                CustomButton(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomeViewBody();
                  }));
                }, width: 343.w, height: 54.h, text: 'العودة لتسجيل الدخول')
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
