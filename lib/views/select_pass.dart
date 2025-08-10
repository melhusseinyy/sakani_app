import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/returnPasswordPage.dart';
import 'package:sakni/widgets/check_container.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class SelectPass extends StatefulWidget {
  const SelectPass({super.key, required this.phoneNumber});
final String phoneNumber;

  @override
  State<SelectPass> createState() => _SelectPassState();
}

class _SelectPassState extends State<SelectPass> {
  String selectedMethod='phoneNumber';
  String maskPhoneNumber(String phoneNumber) {
  if (phoneNumber.length <= 4) return phoneNumber;
  
  final visibleDigits = phoneNumber.substring(phoneNumber.length - 4);
  final masked = '*' * (phoneNumber.length - 4);
  return '$masked$visibleDigits';
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          CustomTextHome(title: 'نسيت كلمة المرور', subTitle: 'اختر الطريقة التي تريد ان تستلم بها كود استرجاع كلمة المرور'),
           Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child:Container(
                height: 580.h
                ,
                  decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r)),
          color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).w,
                    child: Column(
                      children: [
                        SizedBox(height: 60.h,),
                        CheckContainer(text1: 'رقم الهاتف', text2:maskPhoneNumber( widget.phoneNumber) , image: 'assets/images/call.png',
                        isSelected:selectedMethod=='phoneNumber' ,
                        onTap: () {
                          setState(() {
                            selectedMethod='phoneNumber';
                            
                          });
                          
                        },),
                        SizedBox(height: 24,),
                        CheckContainer(text1: 'رقم الواتس اب', text2:maskPhoneNumber( widget.phoneNumber) , image: 'assets/images/Vector.png',
                        isSelected:selectedMethod=='whatsapp' ,
                        onTap: () {
                          setState(() {
                            selectedMethod='whatsapp';
                          });}),
                        SizedBox(height: 225,),
                       
                       
                       CustomButton(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context){
                          return Returnpasswordpage();
                        }));
                       },width:343.w ,height: 54.h,text: 'ارسال',)
                      ],
                    ),
                  ),
                  
                  ), 
        ),
        ],
        
      )
      
    );
  }
}
