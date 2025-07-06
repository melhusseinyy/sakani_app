import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/random_text_field.dart';
import 'package:sakni/widgets/horozintal_card.dart';
import 'package:country_picker/country_picker.dart';
import 'package:sakni/widgets/upload_dotted_border.dart';
class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            50.bh,
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
                115.bw,

                Text(
                  'بيانات الحجز',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff008080),
                  ),
                ),
              ],
            ),
            16.bh,
            HorozintalCard(),
            16.bh,
           Expanded(
             child: SingleChildScrollView(
              child: Column(children: [
                iconTextRow('الاسم بالكامل', Iconsax.user_edit_copy),
             8.bh,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 RandomTextField(text: 'الاول',height: 40,width: 109,),
                 RandomTextField(text: 'الاوسط',height: 40,width: 109),
                 RandomTextField(text: 'الاخير',height: 40,width: 109),
               ],
             ),
             16.bh,
              iconTextRow('الجنسية', Iconsax.flag_copy),
              8.bh,
              RandomTextField(text: 'الجنسية',height: 40,width: 343,suffixIcon: Icon(Iconsax.arrow_down_1_copy),),
              16.bh,
              iconTextRow('بيانات الهوية', Iconsax.user_tick_copy),
              8.bh,
              RandomTextField(text: 'نوع الهوية',height: 40,width: 343,suffixIcon: Icon(Iconsax.arrow_down_1_copy),),
              16.bh,
              RandomTextField(text: 'الجنسية',height: 40,width: 343,),
              16.bh,
              Row(
                children: [
                  Text('صورة الهوية',style: TextStyle(
                    fontSize: 12.sp,fontWeight:FontWeight.w400,color:Color(0xff008080),
                  ),),
                ],
              ),
              8.bh,
             UploadDottedBorder(),
                   16.bh,
                   iconTextRow('رقم الموبايل', Iconsax.call_copy),
                   8.bh,
                    RandomTextField(text: 'رقم الهاتف',height: 40,width: 343,suffixIcon:Container(
                      height: 40.h,width: 58.w,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Color(0xff008080),
                      ),
                      child: CountryCodePicker(

                      ),
                    ),),

              ],),
             ),
           )
         
          ],
        ),
      ),
    );
  }
}
