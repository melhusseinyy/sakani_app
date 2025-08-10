import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckDottedBorder extends StatelessWidget {
  const CheckDottedBorder({super.key, required this.width, required this.height,  required this.text, required this.isSelected, required this.onTap});
  final double width;
  final double height;
  final bool isSelected;
  final String text;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior:HitTestBehavior.opaque ,
      onTap: onTap,
      child: DottedBorder(
                       options: RoundedRectDottedBorderOptions(
                         radius: Radius.circular(12.r),
                         strokeWidth: 1,
                         dashPattern: [5, 3],
                        //  borderPadding: EdgeInsets.symmetric(vertical: widget.height,horizontal:widget.width),
                         padding: EdgeInsets.symmetric(horizontal:width, vertical:height),
                         color:isSelected? Color(0xff008080):Color(0xffE5E5E5),
                       ),
                       child: SizedBox(
                        child: Text(text ,style: TextStyle(
                              fontSize: 14.sp,fontWeight: FontWeight.w400,
                              color:isSelected?Color(0xff1C1C1C): Color(0xffD2D2D2)
                            ),),
                        
                       )),
    );
  }
}