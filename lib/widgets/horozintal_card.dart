import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HorozintalCard extends StatelessWidget {
  const HorozintalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
            decoration: BoxDecoration(
              color: Color(0xffE8E8E8),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 4,
                top: 4,
                bottom: 4,
                left: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
          
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/Group 44.png',
                        width: 158.w,
                        height: double.infinity,
                        fit: BoxFit.fill,
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
                                  Iconsax.heart,
                                  color: Colors.red,
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
                                        '4.7',
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
                              '#15454',
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
                          Text(
                            'برج الصفوة',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1C1C1C),
                            ),
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
                                '#15454',
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
                              Text(
                                'مصر, المنصورة',
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
                                Iconsax.routing_copy,
                                color: Color(0xff008080),
                                size: 12,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'تبعد عن جامعه المنصوره ب 2 كيلو',
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
                              Image.asset('assets/images/maximize-4.png'),
                              SizedBox(width: 2.w),
                              Text(
                                '160 متر',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                              Spacer(),
                              Image.asset('assets/images/solar_bed-linear.png'),
                              SizedBox(width: 2.w),
                              Text(
                                '8 سرير',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Icon(
                                Iconsax.wifi_square,
                                color: Color(0xff008080),
                                size: 12,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'يوجد واي فاي',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Iconsax.coffee,
                                color: Color(0xff008080),
                                size: 12,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'ماكينة قهوه',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Icon(
                                Iconsax.tree,
                                color: Color(0xff008080),
                                size: 12,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'مساحه خضراء',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Iconsax.weight_1,
                                color: Color(0xff008080),
                                size: 12,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'قريبة من الجيم',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1C1C1C),
                                ),
                              ),
                            ],
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
                                '2000',
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
          );
  }
}