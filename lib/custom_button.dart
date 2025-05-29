import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.onTap});
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                              width: 253.w,
                              height: 54.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.sp),
                                color: Color(0xff008080)
                              ),
                              child:  Center(
                                child: Text('تسجيل الدخول',style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16.sp,
                                                              color: Colors.white
                                                            ),),
                              ),
                            ),
    );
  }
}