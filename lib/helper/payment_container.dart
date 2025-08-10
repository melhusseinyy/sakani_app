import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/random_text_field.dart';
import 'package:sakni/helper/wallet_dialoge.dart';
import 'package:sakni/helper/wallet_dotted_border.dart';
import 'package:sakni/views/wallet_page.dart';

class PaymentContainer extends StatefulWidget {
  const PaymentContainer({super.key, required this.image, required this.onTap, required this.isSelected});
 final String image;
 final VoidCallback onTap;
 final bool isSelected;

  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  File? selectedImage;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:widget.onTap,
      child: 
      widget.isSelected?
     
                      Container(
                        
                        width: 343.w,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Color(0xff9CA2AC).withValues(alpha: .10)
                        ),child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:Form(
                            key:formkey ,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                     Image.asset(widget.image),
                                     Spacer(),
                                     Icon(Iconsax.copy_copy,color: Color(0xff787878),size: 18,),
                                     6.bw,
                                     Text('012354798',style: TextStyle(color:Color(0xff787878) ),)
                                  ],
                                ),
                                14.bh,
                                RandomTextField(text: 'ادخل رقم المحفظه او عنوان الدفع',prefixIcon: Icon(Iconsax.empty_wallet_copy),
                                width: 343,height: 54,padH: 12,radius:65,
                                validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'برجاء إدخال رقم المحفظة';
                                }
                                if (value.length < 9) {
                                  return 'رقم الهاتف قصير جدًا';
                                }
                                return null;
                              },
                                ),
                                20.bh,
                                RandomTextField(text: 'ادخل المبلغ',prefixIcon: Icon(Iconsax.dollar_circle_copy),
                                width: 343,height: 54,padH: 12,radius:65,
                                validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'برجاء إدخال  المبلغ';
                                }
                                
                                return null;
                              },
                                ),
                                20.bh,
                               
                                WalletDottedBorder(
                                  onImageSelected: (imageFile) {
                                    setState(() {
                                      selectedImage=imageFile;
                                    });
                                  },
                                ),
                                20.bh,
                                CustomButton(onTap: (){
                                  if(formkey.currentState!.validate()){
                                   
                                   if(selectedImage==null){
                                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                         
                          
                          return WalletDialoge(image: 'assets/images/Group 76005 (1).png',
                           subtext: 'الآن، اذهب لشحن محفظتك و قم بتأكيد العملية بوضع إيصال الشحن ليتم تأكيد عمليتك',
                            text: 'سأرفعه لاحقًا',
                             onButtonTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletPage(selectedIndex: 1),
                          ),
                        );
                      },
);
                        },
                                      );
                                    
                                  }else{
                                    showDialog(context: context, builder: (BuildContext context){
                                       return WalletDialoge(image: 'assets/images/Group 76005 (1).png',
                           subtext:'جارى مراجعه البيانات',
                            text: 'تأكيد',
                             onButtonTap: () {
                        Navigator.pop(context);
                      },
);

                                    });


                                  }
                                  
                                  }


                                }, width: 163.w, height: 43.h, text: 'تأكيد')
                              ],
                            ),
                          ),
                        ),
                      ): Container(
                        height: 64.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(49.r),
                          color: Color(0xff9CA2AC).withValues(alpha: .10)
                        ),
                        child:
                        Image.asset(widget.image),
                      )
                      
    );
  }
}