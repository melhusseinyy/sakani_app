import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/forget_password_page.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/face_print_widget.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
 
   String? errorTextPhone;
  String? errorTextPassword;
  bool isPhoneValid= true;
  bool isPasswordValid= true;
  GlobalKey <FormState> formkey=GlobalKey();
  final phoneController=TextEditingController();
    final passwordController = TextEditingController();

  void validateAndSubmit() {
    setState(() {
      errorTextPhone = null;
      errorTextPassword = null;
      isPhoneValid= true;
     isPasswordValid= true;

      if (phoneController.text != '0123456789') {
        errorTextPhone = 'رقم الهاتف غير صحيح, حاول مرة أخري';
        isPhoneValid=false;
      }

      if (passwordController.text != '123456') {
        errorTextPassword = 'كلمة المرور خاطئة, حاول مرة أخري';
        isPasswordValid=false;
      }
    });

    if (errorTextPhone == null && errorTextPassword == null) {
     showDialog(context: context, builder: (context){
      Future.delayed(Duration(seconds: 2),(){
        Navigator.pop(context);
      });
      return Dialog(
       child : Column(
          
          mainAxisSize: MainAxisSize.min,
          children: [
            

            Container(
              
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
              
              padding: EdgeInsets.symmetric(horizontal: 90.w,vertical: 47.h),
              child: Image.asset('assets/images/Group 76005.png',width: 145.w,height: 138.h,))
          ],
          
        ),
       
      );

     });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      
      child: Container(
      height: 580.h
      ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r)),
          color: Colors.white
        ),
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 24.h,),
              Container(
                height: 60.h,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color(0xffD9D9D9)
                ),
                child: Row(
                 
                  children: [
                    SizedBox(width: 40.w,),
                    Text('انشاء حساب',style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 16.sp,
                      color: Color(0xff9CA2AC)
                    ),),
                    SizedBox(width: 50.w,),
                    Container(
                      height: 48.w,
                      width: 165.h,
                      decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.r),
                  color: Colors.white),
                      child: Center(
                        child: Text('تسجيل الدخول',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.teal
                        ),),
                      ),
                    )
                  ],
                ),
                
              ),
              SizedBox(height: 24.h),
              CustomFormTextField(suffixIcon:Icons.call , hintText: 'رقم الهاتف',
            
              errorText: errorTextPhone,
              obscureText:true ,
              controller:phoneController,
               borderColor:isPhoneValid?Color(0xff15B097):Color(0xffC03744) ,
              
              onChanged: (data) {

                
              },
              ),
              SizedBox(height: 24.h),
              CustomFormTextField(suffixIcon:Iconsax.lock, hintText: 'كلمة المرور',prefixIcon: Icons.visibility,
              
              controller:passwordController ,
              errorText: errorTextPassword,
              borderColor:isPasswordValid?Color(0xff15B097):Color(0xffC03744) ,
              onChanged: (p0) {
                
              },
              ),
              SizedBox(height:10.h ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(height: 165.h,),
                        Row(children: [
                         CustomButton(onTap: (){validateAndSubmit();

                         }),
                          SizedBox(width: 16.w,),
                         FacePrintWidget()
                        ],
      
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
    );
  }
}