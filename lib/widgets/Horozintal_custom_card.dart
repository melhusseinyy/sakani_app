import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/views/sakn_details.dart';

class HorozintalCustomCard extends StatelessWidget {
  const HorozintalCustomCard({super.key, required this.unit});
  final UnitModel unit;

  String getUnitImage(UnitModel unit) {
    if (unit.image != null && unit.image!.isNotEmpty) {
      return unit.image!;
    } else if (unit.images != null && unit.images!.isNotEmpty) {
      final masterImage = unit.images!.firstWhere(
        (img) => img.isMaster == 1,
        orElse: () => unit.images!.first,
      );
      return masterImage.image;
    } else {
      return 'assets/images/Group 44.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SaknDetails(unit: unit,id: unit.id,);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffE8E8E8),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4, left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Stack(
                children: [
                  Image.network(
                    getUnitImage(unit),
                    height: 158.h,
                    width: 159.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/Group 44.png',
                        // height: 157.h,
                        // width: 155.w,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    left: 8.w,
                    bottom: 8.h,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Iconsax.heart_copy,
                              color: Colors.white,
                              size: 16,
                            ),
                            Container(
                              height: 16.h,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${unit.rate}',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff008080),
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.star,
                                    color: Color(0xffEDA145),
                                    size: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${unit.code}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '${unit.title}',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1C1C1C),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Iconsax.house_2_copy,
                            color: Color(0xff008080),
                            size: 12,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            'شقة',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff1C1C1C),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '${unit.code}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff1C1C1C),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location_copy,
                            color: Color(0xff008080),
                            size: 12,
                          ),
                          SizedBox(width: 2.w),
                          Flexible(
                            child: Text(
                              '${unit.country},${unit.city}',
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 6.h,
                        children:
                            unit.facility!.map((facility) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if ((facility.image ?? '').isNotEmpty)
                                    Image.network(
                                      facility.image!,
                                      width: 14.w,
                                      height: 14.h,
                                      fit: BoxFit.contain,
                                    ),
                                  SizedBox(width: 4.w),
                                  Flexible(
                                    child: Text(
                                      facility.title ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Color(0xff1C1C1C),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),

                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Spacer(),
                          Icon(
                            Iconsax.dollar_circle_copy,
                            color: Color(0xff008080),
                            size: 12,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '${unit.priceAfterDiscount}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff008080),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
