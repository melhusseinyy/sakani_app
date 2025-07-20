import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({super.key, required this.text, required this.icon});
final String text;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Icon(icon,color: Color(0xff008080),size: 16,),
      4.bw,
      Text(text,style: TextStyle(
        fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
      ),)
    ],
  );
  }
}