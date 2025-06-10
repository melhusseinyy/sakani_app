import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/create_acc_2_page.dart';
import 'package:sakni/views/create_acc_page.dart';
import 'package:sakni/views/forget_password_page.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';
import 'package:sakni/widgets/face_print_widget.dart';

class PasswordAfterVertificationPage extends StatelessWidget {
  const PasswordAfterVertificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTextHome(
            title: 'رقم الهاتف مسجل من قبل',
            subTitle:
               'الرقم الذى ادخلته مسجل بالفعل ادخل كلمه المرور للمتابعه و تسجيل الدخول'
          ),

          Positioned(
            top: 232.h,
            left: 0,
            right: 0,
            child: Container(
              height: 580.h,
              width: 375.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                     CustomFormTextField(
                      hintText: 'كلمة المرور',
                      prefixIcon: Icon(Iconsax.lock,color:Colors.grey,),
                      suffixIcon: Icon(Iconsax.eye_slash,color: Colors.grey,),
                      obscureText: true,
                      onChanged: (data) {
                       
                      },
                     
                    ),
                     SizedBox(height:10.h ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ForgetPasswordPage();
                     }));
                    },
                    child: Text('نسيت كلمة السر؟',style: TextStyle(
                            fontWeight: FontWeight.w400,fontSize: 14.sp,
                            color: Color(0xff9CA2AC)
                          ),),
                  ),
                ],
              ),
              SizedBox(height: 311.h,),
               Row(children: [
                           FacePrintWidget(),  SizedBox(width: 13.w,),
                         CustomButton(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CreateAcc2Page();
                          }));
                         },width: 253.w,
                              height: 54.h,text: 'تسجيل الدخول',),
                        
                        
                        ],
      
                        ),
                          SizedBox(height: 24.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('  جديد لدينا',style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                            ),),
                             GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context){
                                  return CreateAccPage();
                                }));
                              },
                               child: Text('انشاء حساب؟',style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff008080)
                                                           ),),
                             ),

                          ],
                        )
      
                 
                   
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}