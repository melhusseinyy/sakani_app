import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/create_acc_2_page.dart';
import 'package:sakni/views/forget_password_page.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';
import 'package:sakni/widgets/face_print_widget.dart';
import 'package:sakni/widgets/home_view_body.dart';

class PasswordAfterVertificationPage extends StatefulWidget {
  const PasswordAfterVertificationPage({super.key});

  @override
  State<PasswordAfterVertificationPage> createState() => _PasswordAfterVertificationPageState();
}

class _PasswordAfterVertificationPageState extends State<PasswordAfterVertificationPage> {
  bool obscurePassword=true;
  GlobalKey <FormState> formkey=GlobalKey();
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
            child: Form(
              key:formkey,
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscurePassword=!obscurePassword;
                            });
                          },
                          child: Icon(obscurePassword? Iconsax.eye_slash_copy:Iconsax.eye_copy,color: Colors.grey,)),
                        validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
                  }
                  return null;
                },
                        obscureText: obscurePassword,
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
                             if (formkey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CreateAcc2Page();
                            }));
                           }},width: 253.w,
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
                                    return HomeViewBody();
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
          ),
        ],
      ),
    );
  }
}