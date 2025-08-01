import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_dash/flutter_dash.dart';

class LocationButtomSheet extends StatelessWidget {
  const LocationButtomSheet({super.key});
  

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
            GestureDetector(
              onTap: () {
                 Navigator.pop(context);
              },
              child: Icon(Iconsax.close_square_copy,color: Color(0xffC03744),size: 16,)),
            SizedBox(width: 119.w,),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Iconsax.location_copy,color: Color(0xff008080),size: 16,),
            ),
            Text('الموقع',style: TextStyle(
              fontSize: 16.sp,fontWeight: FontWeight.w700,color:  Color(0xff008080)
            ),)
          ],),
          SizedBox(height: 8.h,),
           DropdownButtonFormField<String>(
            
            
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:Color(0xffE2E2E2),
                                      suffixIconColor: Color(0xff008080),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12.r),
                                        borderSide: BorderSide(
                                          color: Color(0xffE2E2E2)
                                        )
                                      
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 8.w),
                                        
                                      
                                      hintText: 'اختر المدينة او اكتب المعلم المهم بالنسبة لك',
                                      hintStyle: TextStyle(
                                        fontSize: 10.sp,fontWeight: FontWeight.w400
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        
                                        borderSide: BorderSide(
                                          
                                          color: Color(0xff9CA2AC)
                                        ),
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                    ),
                                    items:
                                        <String>['الاسكندرية','القاهرة','المنصورة'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    onChanged: (String? newvalue) {
                                      
                                     Navigator.pop(context,newvalue);
                                    },
                                  ),
                                  SizedBox(height: 16.h,),
                                  Dash(
                                    direction: Axis.horizontal,
                                    dashColor: Color(0xffD2D2D2),
                                    length: 343.w,
                                    dashLength: 3,
                                    dashThickness: 2,
                                    dashBorderRadius: 2.r,
                                    
                                  ),
                                  SizedBox(height: 16.h,),
                                  Row(
                                    children: [
                                      Icon(Iconsax.gps_copy,color:Color(0xff008080) ,size: 16,),
                                      Padding(
                                        padding: const EdgeInsets.only(right:4 ),
                                        child: Text('حدد موقعك الحالي',style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor:Color(0xff008080) ,
                                          decorationThickness: 2,
                                          color:Color(0xff008080),fontSize: 12.sp,fontWeight: FontWeight.w600
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 16.h,)
        ],
        ),
      ),
    );
  }
}