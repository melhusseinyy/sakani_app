import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/success_new_password.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool PasswordsMatch = true;
  void checkPasswordMatch() {
    setState(() {
      PasswordsMatch =
          newPasswordController.text == confirmPasswordController.text;
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTextHome(
            title: 'ادخل كلمه المرور الجديده',
            subTitle:
                r'ادخل كلمة مرور قويه تحتوى على 8 احرف على الأقل و تأكد من اضافه بعض الرموز مثل #$@',
          ),
          Positioned(
            top: 232.h,
            left: 0,
            right: 0,
            child: Container(
              height: 580.h,
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
                      hintText: 'كلمة المرور الجديده',
                      prefixIcon: Icon(Iconsax.lock),
                      suffixIcon: Icon(Icons.visibility),
                      controller: newPasswordController,
                      obscureText: true,
                      onChanged: (data) {
                        checkPasswordMatch();
                      },
                      bordercolor:
                          PasswordsMatch
                              ? Color(0xff15B097)
                              : Color(0xffC03744),
                    ),
                    SizedBox(height: 24.h),
                    CustomFormTextField(
                      hintText: 'تأكيد كلمة المرور الجديده',
                      prefixIcon: Icon(Iconsax.lock),
                      suffixIcon: Icon(Icons.visibility),
                      controller: confirmPasswordController,
                      obscureText: true,
                      onChanged: (data) {
                        checkPasswordMatch();
                      },
                      bordercolor:
                          PasswordsMatch
                              ? Color(0xff15B097)
                              : Color(0xffC03744),
                              errorText: PasswordsMatch?null:'كلمتا المرور غير متطابقتان',
                    ),
                    SizedBox(height: 305.h,),
                    CustomButton(onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SuccessNewPassword();

                      }));
                    }, width: 343.w, height: 54.h, text: 'تأكيد')

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
