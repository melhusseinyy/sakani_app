import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/image_slider.dart';
import 'package:sakni/widgets/Bullet_point.dart';
import 'package:sakni/widgets/reviews.dart';

class SaknDetails extends StatelessWidget {
  const SaknDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(width: 85.w),
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
                      child: SizedBox(
                        height: 22.h,
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
                  ],
                ),
                SizedBox(height: 16.h),
               ImageSlider(),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'برج الصفوة',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1C1C1C),
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
                                  const EdgeInsets.only(left: 8.0, right: 3).w,
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
                              '#15454',
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
                                size: 16,
                              ),
                            ),
                            Text(
                              'مصر, المنصورة',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
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
                              'تبعد عن جامعه المنصوره ب 2 كيلو',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                              ),
                            ),
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
                              '4 غرفة',
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
                              '8 سرير',
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
                          'مساحة الشقه 160 متر مكونه من 4 غرف و صالتين و حمامين و مطبخ تقع فى الدور السادس تطل على شارع جانبي مساحتة 16 متر الشقه مجهزه بالكامل و مفروشه و بها كل الاجهزه الكهربائية',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 16.h),
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
                                fontSize: 12.sp,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 8.h),
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
                                fontSize: 12.sp,
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1C1C1C),
                              ),
                            ),
                            Spacer(),
                          ],
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
                              'EG2000',
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
                        Image.asset(
                          'assets/images/🌎 Map Maker_ Mansoura, Dakahlia, Egypt (Standard).png',
                          width: double.infinity,
                          fit: BoxFit.fill,
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
                        BulletPoint(
                          text:
                              'أن يكون الشخص الراغب في الإقامة في الفندق سواء كان مصريا أو أجنبيا معه جواز سفر ساري أو بطاقة رقم قومي سارية.',
                        ),
                        SizedBox(height: 8.h),
                        BulletPoint(
                          text:
                              ' يسمح للرجال أو السيدات أيا كان عمرهم بالإقامة بالفنادق بمفردهن «سنجل».',
                        ),
                        SizedBox(height: 8.h),
                        BulletPoint(
                          text:
                              ' بالنسبة لإقامة الزوج والزوجة المصريين بغرفة واحدة فلابد من تقديم وثيقة الزواج الرسمية التي تثبت علاقة الزواج بينهما.',
                        ),
                        SizedBox(height: 8.h),
                        BulletPoint(
                          text:
                              ' لا يجوز التفرقة في معاملة النزلاء وفقا لجنسهم أو ديانتهم أو لونهم أو جنسيتهم حيث إن المعاملة تكون واحدة.',
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
                        Reviews(
                          image: 'assets/images/98.png',
                          userName: 'رنا الخواجة',
                          reviewText:
                              'كتب علم التصريف - الصرف في اللغة العربية .. ركن خاص بكتب مجانيه للتحميل في علم الصرف كما تُعرف باسم الصِرافة أو علم التشكل أو علم تشكُّل الكلمات هو العلم الذي يعرف به أحوال بنية الكلمة، وصرفها على وجوه شتى لمعان مختلفة، وقد يكون هذا التغيير في هذه البنية إما لسبب معنوي',
                          date: DateTime(2023,8,13),
                          rating: 4,
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.only(top: 19,bottom: 12).h,
                          child: Divider(
                            color: Color(0xffD1D1D1),
                          ),
                        ),
                        Reviews(
                          image: 'assets/images/99.png',
                          userName: 'احمد عباس',
                          reviewText:
                              'كتب علم التصريف - الصرف في اللغة العربية .. ركن خاص بكتب مجانيه للتحميل في علم الصرف كما تُعرف باسم الصِرافة أو علم التشكل أو علم تشكُّل الكلمات هو العلم الذي يعرف به أحوال بنية الكلمة، وصرفها على وجوه شتى لمعان مختلفة، وقد يكون هذا التغيير في هذه البنية إما لسبب معنوي',
                          date: DateTime(2023,12,25),
                          rating: 4,
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.only(top: 19,bottom: 12).h,
                          child: Divider(
                            color: Color(0xffD1D1D1),
                          ),
                        ),
                        Reviews(
                          image: 'assets/images/Rectangle_Copy_157-removebg-preview (1).png',
                          userName: ' احمد دومة',
                          reviewText:
                              'كتب علم التصريف - الصرف في اللغة العربية .. ركن خاص بكتب مجانيه للتحميل في علم الصرف كما تُعرف باسم الصِرافة أو علم التشكل أو علم تشكُّل الكلمات هو العلم الذي يعرف به أحوال بنية الكلمة، وصرفها على وجوه شتى لمعان مختلفة، وقد يكون هذا التغيير في هذه البنية إما لسبب معنوي',
                          date: DateTime(2023,2,24),
                          rating: 4,
                        ),
                        SizedBox(height: 16.h,),
                         Container(
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
                      ],
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
