import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerForDottedBorder extends StatelessWidget {
  const ContainerForDottedBorder({super.key, required this.width, required this.text,  this.prefixIcon, this.sufffixIcon});
 final double width;
 final String text;
 final IconData? prefixIcon;
  final IconData? sufffixIcon; 
  @override
  Widget build(BuildContext context) {
    return Container(
                              height: 32.h,
                              width: width,
                              decoration: BoxDecoration(
                                color: Color(0xffE2E2E2),
                                borderRadius: BorderRadius.circular(12.r),
                                
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Icon(prefixIcon,color: Color(0xff008080),size: 16,),
                                    ),
                                    Text(text,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,fontSize: 10.sp,color: Color(0xff8E8E8E)
                                    ),
                                    
                                    ),Spacer(),
                                     Icon(sufffixIcon,color: Color(0xff008080),size: 16,)
                                
                                  ],
                                ),
                              ),
                            ) ;
  }
}