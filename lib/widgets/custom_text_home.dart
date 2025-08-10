import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextHome extends StatelessWidget {
  const CustomTextHome({super.key, required this.title, required this.subTitle});
final String title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
          color: const Color(0xff006666),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 136.h),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFAFAFA),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  textAlign: TextAlign.start,
                 subTitle,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffEDEDED),
                    
                  ),
                ),
              ],
            ),
          ),
        );
  }
}