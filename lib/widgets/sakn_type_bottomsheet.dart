import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SaknTypeBottomsheet extends StatelessWidget {
  const SaknTypeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16,right: 16,top: 16,
      bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Icon(Iconsax.close_square_copy,color: Color(0xffC03744),size: 16,),
            SizedBox(width: 119.w,),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Iconsax.house_2_copy,color: Color(0xff008080),size: 16,),
            ),
            Text('السكن',style: TextStyle(
              fontSize: 16.sp,fontWeight: FontWeight.w700,color:  Color(0xff008080)
            ),)
          ],),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('اختر نوع السكن',style: TextStyle(
                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                ),),
            ],
          ),
           
                                  SizedBox(height: 12.h,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context,'شقة');
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4,).w,
                                          child: Icon(Iconsax.house_2_copy,color: Color(0xff008080),size: 16,),
                                        ),
                                        Text('شقه',style: TextStyle(
                                                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                ),)
                                        
                                        
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4,top: 4).h,
                                    child: Container(height: 1.h,
                                    color: Color(0xffD2D2D2),
                                    width: 343.w,),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                       Navigator.pop(context,'غرفة');
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4).w,
                                          child: Image.asset('assets/images/Vector (1).png')
                                        ),
                                        Text('غرفة',style: TextStyle(
                                                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                ),)
                                                               
                                      ],
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(bottom: 4,top: 4).h,
                                    child: Container(height: 1.h,
                                    color: Color(0xffD2D2D2),
                                    width: 343.w,),
                                  ),
                                   GestureDetector(
                                    onTap: () {
                                       Navigator.pop(context,'سرير');
                                    },
                                     child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4).w,
                                          child: Image.asset('assets/images/solar_bed-linear.png')
                                        ),
                                        Text('سرير',style: TextStyle(
                                                   fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                 ),)
                                                                
                                      ],
                                                                       ),
                                   ),
                                  SizedBox(height: 16.h,)
                                  
        ],
        ),
      ),
    );
  }
}