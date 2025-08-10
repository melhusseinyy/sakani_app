import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/Auth_cubit/auth_cubit.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/forget_password_page.dart';
import 'package:sakni/views/home_page.dart';
import 'package:sakni/views/main_navigation_page.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/face_print_widget.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  String? phoneNumber;
  String? password;
  bool obscurePassword = true;

  String? errorTextPhone;
  String? errorTextPassword;

  bool isPhoneValid = true;
  bool isPasswordValid = true;
  GlobalKey<FormState> formkey = GlobalKey();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void validateAndSubmit() {
    setState(() {
      errorTextPhone = null;
      errorTextPassword = null;
      isPhoneValid = true;
      isPasswordValid = true;

      if (phoneController.text != '0123456789') {
        errorTextPhone = 'رقم الهاتف غير صحيح, حاول مرة أخري';
        isPhoneValid = false;
      }

      if (passwordController.text != '123456') {
        errorTextPassword = 'كلمة المرور خاطئة, حاول مرة أخري';
        isPasswordValid = false;
      }
    });

    if (errorTextPhone == null && errorTextPassword == null) {
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
          });
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),

                  padding: EdgeInsets.symmetric(
                    horizontal: 90.w,
                    vertical: 47.h,
                  ),
                  child: Image.asset(
                    'assets/images/Group 76005.png',
                    width: 145.w,
                    height: 138.h,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MainNavigationPage();
              }));
            }else if(state is AuthFailure){
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.errMessage)));
              print('loginerror ${state.errMessage}');
            }

          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomFormTextField(
                    prefixIcon: Icon(Icons.call),
                    hintText: 'رقم الهاتف',
                    onChanged: (data) {
                      phoneNumber = data;
                    },
                    errorText: errorTextPhone,
                              
                    controller: phoneController,
                  ),
                  SizedBox(height: 24.h),
                              
                  CustomFormTextField(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      child: Icon(
                        obscurePassword
                            ? Iconsax.eye_slash_copy
                            : Iconsax.eye_copy,
                      ),
                    ),
                    hintText: 'كلمة المرور',
                    prefixIcon: Icon(Iconsax.lock),
                    onChanged: (data) {
                      password = data;
                    },
                    controller: passwordController,
                    errorText: errorTextPassword,
                    obscureText: obscurePassword,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgetPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'نسيت كلمة السر؟',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff9CA2AC),
                          ),
                        ),
                      ),
                    ],
                  ),
              
                  
                  Row(
                    children: [
                      FacePrintWidget(),
                      SizedBox(width: 16.w),
                      state is AuthLoading?CircularProgressIndicator(): CustomButton(
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).SignIn(phone:phoneController.text,password:passwordController.text);
                          validateAndSubmit();
                        },
                        width: 253.w,
                                
                        height: 54.h,
                        text: 'تسجيل الدخول',
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'هل تريد لمتابعة كزائر؟',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff008080),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
