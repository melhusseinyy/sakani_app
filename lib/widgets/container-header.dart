import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 60.h,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color(0xffD9D9D9)
                ),
                child: Row(
                 
                  children: [
                    SizedBox(width: 40.w,),
                    Text('انشاء حساب',style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16.sp,
                      color: Color(0xff9CA2AC)
                    ),),
                    SizedBox(width: 50.w,),
                    Container(
                      height: 48.w,
                      width: 165.h,
                      decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.r),
                  color: Colors.white),
                      child: Center(
                        child: Text('تسجيل الدخول',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.teal
                        ),),
                      ),
                    )
                  ],
                ),
                
              );
  }
}