import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerHeader extends StatelessWidget {
  const ContainerHeader({super.key,  this.isCreateAccountActive=false, required this.onTabChange});
  final bool isCreateAccountActive;
  final void Function(bool) onTabChange;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color(0xffD9D9D9),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5).w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر تسجيل الدخول
            GestureDetector(
              onTap:() =>onTabChange(false) ,
              child: Container(
                height: 48.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.r),
                  color: !isCreateAccountActive ? Colors.white : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: !isCreateAccountActive ? Colors.teal : const Color(0xff9CA2AC),
                    ),
                  ),
                ),
              ),
            ),
           
        
            // زر انشاء حساب
            GestureDetector(
              onTap:() =>onTabChange(true)
              ,
              child: Container(
                height: 48.w,
                width: 160.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.r),
                  color: isCreateAccountActive ? Colors.white : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    'انشاء حساب',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: isCreateAccountActive ? Colors.teal : const Color(0xff9CA2AC),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
