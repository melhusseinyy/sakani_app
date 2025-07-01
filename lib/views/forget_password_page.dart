import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/views/select_pass.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';



class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String phoneNumber='';
  String countryCode = '+20';
  GlobalKey<FormState>formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          CustomTextHome(title: 'التحقق من الهاتف', subTitle: 'برجاء أدخل رقم هاتفك'),
           Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child:Form(
            key:formkey ,
            child: Container(
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
                          SizedBox(height: 24.h,),
                          CustomFormTextField(
                hintText: 'رقم الهاتف',
                prefixIcon: Icon(Iconsax.call),
                suffixIcon: CountryCodePicker(
                  initialSelection: 'مصر',
                  favorite: ['+20', 'مصر'],
                  onChanged: (country) {
                    setState(() {
                      countryCode = country.dialCode ?? '+20';
                    });
                  },
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل رقم الهاتف';
                  } else if (!RegExp(
                    r'^[0-9]{9,15}$',
                  ).hasMatch(value)) {
                    return 'رقم الهاتف غير صحيح';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
                          SizedBox(height: 279.h,),
                          GestureDetector(
                            onTap: () {
                              if(formkey.currentState!.validate()){
                              Navigator.push(context, MaterialPageRoute(builder:(context){
                                return SelectPass(
                                  phoneNumber: phoneNumber,
                                );
                              }));
                            }},
                            child: Container(
                              height: 54.h,
                              width: 343.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: Color(0xff008080),
                              ),
                              child: Center(
                                child: Text('المتابعة',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                          ),
                           SizedBox(height: 24.h,),
                          Text('هل تريد لمتابعة كزائر؟',style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff008080)
                          ),)
                        ],
                      ),
                    ),
                    
                    ),
          ), 
        ),
        ],
        
      )
      
    );
  }
}