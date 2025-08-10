// DotLabelBox.dart
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DottedLabelBox extends StatelessWidget {
  const DottedLabelBox({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected
          ? Row(
              children: [
                Icon(Iconsax.tick_square, color: const Color(0xff008080), size: 24),
                SizedBox(width: 4.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.r),
                    border: Border.all(color: const Color(0xff008080)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff008080),
                      ),
                    ),
                  ),
                )
              ],
            )
          : Row(
              children: [
                Image.asset('assets/images/tick-square.png'),
                SizedBox(width: 4.w),
               DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(36).r,
        strokeWidth: 1,
        dashPattern: [5, 3],
        borderPadding: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4
        ),
        color: const Color(0xffA4A4A4),
      ),
      child: SizedBox(
        
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffA4A4A4),
            ),
          ),
        ),
      ),
    )
              ],
            ),
    );
  }
}
