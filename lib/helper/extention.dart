import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

extension SizedBoxExtension on num {
  SizedBox get bh => SizedBox(height: toDouble().h);
  SizedBox get bw => SizedBox(width: toDouble().w);
  SizedBox get squareBox => SizedBox(width: toDouble().w, height: toDouble().h);
}
extension IconTextRow on Widget {
  Widget iconTextRow(String text,IconData icon) => Row(
    children: [
      Icon(icon,color: Color(0xff008080),size: 16,),
      4.bw,
      Text(text,style: TextStyle(
        fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
      ),)
    ],
  );
}