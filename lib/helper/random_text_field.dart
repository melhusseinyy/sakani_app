import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RandomTextField extends StatelessWidget {
  const RandomTextField({
    super.key,
    required this.text,
    this.suffixIcon,
    this.width = 109,
    this.height = 40, this.padH=14, this.padW=30,
  });
  final String text;
  final Widget? suffixIcon;
  final double width;
  final double height;
  final double padH;
  final double padW;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height.h ,
      width: width.w,
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
      
          hintStyle: TextStyle(
            color: Color(0xff9CA2AC),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
      
          suffixIcon: suffixIcon,
          
          suffixIconColor: Color(0xff008080),

          contentPadding: EdgeInsets.symmetric(
            horizontal: padW.w,
            // vertical: padW.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xffE8E8E8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xffE8E8E8)),
          ),
          
        ),
        
      ),
    );
  }
}
