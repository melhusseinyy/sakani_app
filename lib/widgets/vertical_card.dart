import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/views/sakn_details.dart';

class verticalCard extends StatelessWidget {
  const verticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio:163/228),
      itemBuilder:(context,int){
                    return Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SaknDetails();
              }));
            },
            child: Container(
             
              decoration: BoxDecoration(
                color: Color(0xffE8E8E8),
                borderRadius: BorderRadius.circular(16.r)
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 4,top: 4,left: 4,bottom: 8).h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/Group 44.png',height: 157.h,width:double.infinity,fit: BoxFit.fill,),
                    SizedBox(height: 4.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('برج الصفوة',style: TextStyle(
                          fontSize: 12.sp,fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                    SizedBox(height: 4.h,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2).w,
                          child: Icon(Iconsax.location_copy,color: Color(0xff008080),size: 12,),
                        ),
                        Text('مصر, المنصورة',style: TextStyle(
                          fontSize: 10.sp,fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                    Row(children: [
                       Padding(
                            padding: const EdgeInsets.only(left: 4).w,
                            child: Icon(Iconsax.wifi_square,color: Color(0xff008080),size: 12,),
                          ),
                          Icon(Iconsax.weight_1,color: Color(0xff008080),size: 12,),
                          Padding(
                            padding: const EdgeInsets.only(right: 4,left: 4).w,
                            child: Icon(Iconsax.tree,color: Color(0xff008080),size: 12,),
                          ),
                          Icon(Iconsax.coffee,color: Color(0xff008080),size: 12,),
                        
                          SizedBox(width: 51.w,),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Icon(Iconsax.dollar_circle_copy,color: Color(0xff008080),size: 12,),
                          ),
                          Text('2000',style: TextStyle(
                            fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                          ),)
                      
                          
                    ],)
                
                  ],
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 12.h,
            right: 12.w,
            left: 12.w,
            bottom: 74.h,
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Iconsax.heart_copy,color: Colors.white,size: 16,),
                    Container(height:16.h,width: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('4.7',style: TextStyle(
                              fontSize: 10.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                            ),),
                            Icon(Iconsax.star,color: Color(0xffEDA145),size: 8,),
                
                      ],
                    ),
                    )
                
                  ],
                ),
                Text('#15454',style: TextStyle(
                              fontSize: 12.sp,fontWeight: FontWeight.w600,color:Colors.white
                            ),),
                
      
              ],
            ))
        ],
        
      );
      },
    );
  }
}