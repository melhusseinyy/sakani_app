import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/widgets/custom_card.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children:[
      Scaffold(
       
        body: Padding(
          padding: const EdgeInsets.only(right: 16.0).w,
          child: Column(
            children: [
              62.bh,
              Padding(
                padding: const EdgeInsets.only(left:16.0).w,
                child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8).w,
                    child: Image.asset('assets/images/Ellipse 8.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Column(
                      children: [
                        Text(
                          'اهلا مصطفى كيف الحال ؟',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff008080),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'قم بالبحث عن سكنك بسهوله',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff008080),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(Iconsax.notification_copy, color: Color(0xff008080)),
                ],
                            ),
              ),
            16.bh,
             Expanded(
               child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                 children: [
                   Text(
                             'خصم شهرين لكل سنه',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff008080),
                              ),
                            ),
                 ],
               ),
               16.bh,
               
               SizedBox(
                height: 228.h,
                 child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,kk){
                    return Padding(
                      padding: const EdgeInsets.only(left:12),
                      // child: CustomCard(unit:,),
                    );
                  }),
               ),
               16.bh,
               Row(
                 children: [
                   Text(
                             'بدون تأمين او مقدم',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff008080),
                              ),
                            ),
                 ],
               ),
               16.bh,
               
               SizedBox(
                height: 228.h,
                 child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,kk){
                    return Padding(
                      padding: const EdgeInsets.only(left:12),
                      // child: CustomCard(unit: ,),
                    );
                  }),
               ),
               16.bh,
               Row(
                 children: [
                   Text(
                            'خصم 20%',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff008080),
                              ),
                            ),
                 ],
               ),
               16.bh,
               
               SizedBox(
                height: 228.h,
                 child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,kk){
                    return Padding(
                      padding: const EdgeInsets.only(left:12),
                      // child: CustomCard(),
                    );
                  }),
               ),
               100.bh
                  ],
                ),
               ),
             )

            ],
          ),
        ),
      )
    
    ] );
  }
}