import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Color color;
  final double radius;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool isSelected;
  


  const SelectionButton({
    super.key,
    required this.label,
    this.width = 80,
    this.height = 33,
    this.color = Colors.white,
    this.radius = 10,
    this.borderColor,
    this.onTap, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color:isSelected? Color(0xff008080).withValues(alpha: .2):Colors.white,
          borderRadius: BorderRadius.circular(radius.r),
          border:isSelected?Border.all(color: Colors.transparent) : borderColor != null
              ? Border.all(color: borderColor!)
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color:Color(0xff008080)
            ),
          ),
        ),
      ),
    );
  }
}
