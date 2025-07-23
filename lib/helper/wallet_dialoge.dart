import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/helper/extention.dart';

class WalletDialoge extends StatelessWidget {
  const WalletDialoge({super.key, required this.image, required this.subtext, required this.text, required this.onButtonTap});
  final String image;
  final String subtext;
  final String text;
  final VoidCallback onButtonTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
                           child:  Container(
                                    height: 337.h,
                                    width: 343.w,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                    
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Column(
                                      children: [
                                        54.bh,
                                        Image.asset(image),
                                        12.bh,
                                        Text(textAlign:TextAlign.center  ,subtext,
                                        style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff9CA2AC)),),
                                        24.bh,
                                        CustomButton(onTap: onButtonTap, width: 311.w, height: 43.h, text: text)

                                      ],
                                    ))
                           
                            
                          );
                        
                                  
  }
}