import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,required this.onTap, required this.width, required this.height, required this.text});
VoidCallback? onTap;
final double width,height;
final String text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                              width: width,
                              height: height,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.sp),
                                color: Color(0xff008080)
                              ),
                              child:  Center(
                                child: Text(text,style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16.sp,
                                                              color: Colors.white
                                                            ),),
                              ),
                            ),
    );
  }
}