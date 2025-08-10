import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 6.w,
      height: 6.h,
      margin: EdgeInsets.only(top: 6.h),
      decoration: BoxDecoration(
        color: Colors.black,
       
      ),
    ),
    SizedBox(width: 8.w),
    Expanded(
      child: Text(
        text,
        maxLines: 2,

        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff000000),
        ),
      ),
    ),
  ],
);
  }
}