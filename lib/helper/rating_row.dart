import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.rating, required this.isSelected, required this.onTap});
    final double rating;
    final bool isSelected;
    final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector
        (onTap: onTap,
          child:isSelected? 
          Icon(Iconsax.tick_square, color: const Color(0xff008080), size: 24)
          :Image.asset('assets/images/tick-square.png')),
        10.bw,
        ...List.generate(5, (index) {
          if (index < rating) {
            return Icon(Icons.star, color: const Color(0xffEDA145), size: 24);
          } else {
            return Icon(Icons.star_border, color: const Color(0xffE8E8E8), size: 24);
          }
        }),
        10.bw,
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff546881),
          ),
        ),
      ],
    );
  }
}
