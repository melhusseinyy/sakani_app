import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/helper/extention.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
        child:Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
          
            mainAxisSize: MainAxisSize.min,
            children: [
              20.bh,
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
              Text(' تأكيد الدفع',style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w500,color:  Color(0xff151A0E)
              ),),
              
               GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Iconsax.close_square_copy,color: Color(0xff000000),size: 24,)),
            ],),
            8.bh,
            Divider(
              color: Color(0xffE8E8E8),
                    ),
                    16.bh,
                    Image.asset('assets/images/Group.png'),
                    16.bh,
                    Text('انت على وشك دفع 2000 جنية عن طريق محفظتك',style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.bold,color:  Color(0xff0A0B0B)
              )),
              32.bh,
              CustomButton(onTap: (){}, width: 343.w, height: 54.h, text: 'دفع')
           
          
            ],
            
          
          ),
        ),
      );
  }
}