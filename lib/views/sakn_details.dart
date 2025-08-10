import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/unit_details/unit_details_cubit.dart';
import 'package:sakni/helper/image_slider.dart';
import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/models/unit_details_model/unit_details_modael.dart';
import 'package:sakni/views/tab_bar_page.dart';
import 'package:sakni/widgets/Bullet_point.dart';
import 'package:sakni/widgets/location_map.dart';
import 'package:sakni/widgets/reviews.dart';
import 'package:share_plus/share_plus.dart';

class SaknDetails extends StatelessWidget {
  const SaknDetails({super.key, required this.unit, required this.id, });
  final UnitModel unit;
  final int? id;
  

  @override
  Widget build(BuildContext context) {
context.read<UnitDetailsCubit>().fetchunitDetails(id!);

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 54.h),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Iconsax.arrow_right_3_copy,
                        color: Color(0xff008080),
                        size: 22,
                      ),
                    ),
                    SizedBox(width: 83.w),
                    Icon(
                      Iconsax.house_2_copy,
                      color: Color(0xff008080),
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        'تفاصيل الوحدة',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff008080),
                        ),
                      ),
                    ),
                    SizedBox(width: 36.w),
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(16).r,
                        strokeWidth: 1,
                        dashPattern: [5, 3],
                        borderPadding: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 8.h,
                        ),
                        color: Color(0xff008080),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          SharePlus.instance.share(
                            ShareParams(text: ' https://www.liverpoolfc.com/'),
                          );
                        },
                        child: SizedBox(
                          height: 23.h,
                          width: 72.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'مشاركة',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff008080),
                                ),
                              ),
                              Icon(
                                Iconsax.export_1_copy,
                                color: Color(0xff008080),
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ImageSlider(images: unit.images ?? []),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: BlocBuilder<UnitDetailsCubit, UnitDetailsState>(
                      builder: (context, state) {
                        if (state is UnitDetailsLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is UnitDetailsFailure) {
                          return Center(child: Text(state.errMessage));
                        } else if (state is UnitDetailsSuccess) {
                          final unitDetails = state.unitDetails;
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      unitDetails.title ?? '',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff1C1C1C),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Iconsax.house_2_copy,
                                    color: Color(0xff008080),
                                    size: 16,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(
                                          left: 8.0,
                                          right: 3,
                                        ).w,
                                    child: Text(
                                      'شقة',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff1C1C1C),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    unitDetails.code ?? '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0).w,
                                    child: Icon(
                                      Iconsax.location_copy,
                                      color: Color(0xff008080),
                                      size: 17,
                                    ),
                                  ),
                                  Text(
                                    '${unitDetails.country?.title},${unitDetails.city?.name}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 17.h),
                              Row(
                                children: [
                                  
                                 
                               unitDetails.marks != null && unitDetails.marks!.isNotEmpty
    ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: unitDetails.marks!.map((mark) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2.0).w,
                child: Icon(
                  Iconsax.routing_copy,
                  color: Color(0xff008080),
                  size: 16,
                ),
              ),
              Text(
                'تبعد عن ${mark.title ?? ''} بـ ${mark.distance ?? ''} كيلو',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          );
        }).toList(),
      )
    : SizedBox(),


                                ],
                              ),
                              SizedBox(height: 18.h),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0).w,
                                    child: Image.asset(
                                      'assets/images/maximize-4.png',
                                    ),
                                  ),
                                  Text(
                                    '160 متر',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0).w,
                                    child: Image.asset(
                                      'assets/images/Vector (1).png',
                                    ),
                                  ),
                                  Text(
                                    '${unitDetails.roomCount}غرفة',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0).w,
                                    child: Image.asset(
                                      'assets/images/solar_bed-linear.png',
                                    ),
                                  ),
                                  Text(
                                    '${unitDetails.bedCount} سرير',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),

                              SizedBox(height: 16.h),
                              Text(
                                unitDetails.description ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                ),
                              ),
                              SizedBox(height: 16.h),

                              Wrap(
                                spacing: 8.w,
                                runSpacing: 6.h,
                                children:
                                    unitDetails.facility!.map((facility) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          facility.image!.isNotEmpty
                                              ? Image.network(
                                                facility.image ?? '',
                                                width: 16.w,
                                                height: 16.h,
                                                fit: BoxFit.contain,
                                              )
                                              : SizedBox(),

                                          SizedBox(width: 4.w),
                                          Text(
                                            facility.title ?? '',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1C1C1C),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                              ),

                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Text(
                                    'المدة :',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'سنة',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0).w,
                                    child: Icon(
                                      Iconsax.dollar_circle_copy,
                                      color: Color(0xff008080),
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    unitDetails.priceAfterDiscount ?? '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff008080),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text(
                                    'من :',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    '01/01/2024',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'الى :',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    '01/01/2025',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff1C1C1C),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                height: 300.h,
                                child: CurrentLocationMap(),
                              ),
                              SizedBox(height: 26.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'التعليمات و الممنوعات',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff008080),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    unitDetails.instructions!
                                        .map(
                                          (instruction) => BulletPoint(
                                            text: instruction.title ?? '',
                                          ),
                                        )
                                        .toList(),
                              ),
                              SizedBox(height: 32.h),
                              Row(
                                children: [
                                  Text(
                                    'تقييمات ( 22 )',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff008080),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Iconsax.edit_2_copy,
                                    color: Color(0xff008080),
                                    size: 14,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'اضف تقييم',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff008080),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              
unitDetails.reviews!.isEmpty
    ? Text('لا توجد تقييمات بعد', style: TextStyle(fontSize: 14.sp))
    : ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:unitDetails.reviews!.length,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12).h,
          child: Divider(color: Color(0xffD1D1D1)),
        ),
        itemBuilder: (context, index) {
          final review = unitDetails.reviews![index];
          return Reviews(
            image:review.image??'',
            userName: review.userName??'',
            reviewText: review.reviewText??'',
            date:DateTime.parse(review.date??''),
            rating: review.rating??0.0,
          );
        },
      )
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TabBarPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 343.w,
                    height: 33.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      color: Color(0xff008080),
                    ),
                    child: Center(
                      child: Text(
                        'حجز EG2000',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
