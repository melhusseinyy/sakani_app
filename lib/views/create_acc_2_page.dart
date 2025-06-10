import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/widgets/custom_text_field.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class CreateAcc2Page extends StatefulWidget {
  const CreateAcc2Page({super.key});

  @override
  State<CreateAcc2Page> createState() => _CreateAcc2PageState();
}

class _CreateAcc2PageState extends State<CreateAcc2Page> {
  String? selectedCountryName;
  String? selectedCountryFlag;
  TextEditingController countryController = TextEditingController();
   GlobalKey <FormState> formkey=GlobalKey();

  String? selectedRole;
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasddwordController= TextEditingController();
  TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController inviteCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Stack(
        children: [
          CustomTextHome(
            title: 'مرحبا بك فى سكني',
            subTitle: 'هيا قم بتسجيل الدخول و ابدأ رحلتك للبحث عن سكنك',
          ),

          Positioned(
            top: 232.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Form(
              key:formkey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        CustomFormTextField(
                          
                          hintText: 'الاسم',
                          controller: nameController,
                          prefixIcon: Icon(Iconsax.user_edit),
                          onChanged: (data) {},
                          onTap: () {},
                        ),
                        SizedBox(height: 24.h),
              
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 22.h),
              
                            prefixIcon: Icon(Iconsax.user_tag),
                            hintText: 'مستأجر ام مالك؟',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(65.r),
                            ),
                          ),
                          items:
                              <String>['مالك', 'مستأجر'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              selectedRole = newvalue;
                            });
                          },
                        ),
                        SizedBox(height: 24.h),
                        CustomFormTextField(
                          hintText: 'البريد الإلكتروني',
                          controller: emailController,
                          prefixIcon: Icon(Iconsax.sms),
                          onChanged: (data) {},
                        ),
                        SizedBox(height: 24.h),
              
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountryName = country.name;
                                  selectedCountryFlag = country.flagEmoji;
                                  countryController.text =
                                      selectedCountryName ?? '';
                                });
                              },
                            );
                          },
                          child: AbsorbPointer(
                            child: CustomFormTextField(
                              controller: countryController,
                              prefixIcon:
                                  selectedCountryFlag != null
                                      ? Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 12.h,
                                        ),
                                        child: Text(
                                          selectedCountryFlag!,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      )
                                      : null,
                              suffixIcon: Icon(Iconsax.arrow_down),
                              onChanged: (data) {},
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomFormTextField(
                          hintText: 'هل لديك كود دعوة؟',
                          prefixIcon: Icon(Iconsax.directbox_notif),
                          controller: inviteCodeController,
                          onChanged: (data) {},
                        ),
                        SizedBox(height: 24.h),
                        CustomFormTextField(
                          hintText: 'كلمة المرور',
                          controller: passwordController,
                          prefixIcon: Icon(Iconsax.lock, color: Colors.grey),
                          suffixIcon: Icon(Iconsax.eye_slash, color: Colors.grey),
                          obscureText: true,
                          onChanged: (data) {},
                         
                        ),
                        SizedBox(height: 24.h),
                        CustomFormTextField(
                          hintText: 'تأكيد كلمة المرور',
                          controller: confirmPasddwordController,
                          prefixIcon: Icon(Iconsax.lock, color: Colors.grey),
                          suffixIcon: Icon(Iconsax.eye_slash, color: Colors.grey),
                          obscureText: true,
                          onChanged: (data) {},
                        ),
                        SizedBox(height: 82.h),
                        GestureDetector(
                          onTap: () {
                             if (nameController.text.isNotEmpty &&
      selectedRole != null &&
      emailController.text.isNotEmpty &&
      countryController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      confirmPasddwordController.text.isNotEmpty) {

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pop(context);});
        
        return Dialog(
         child:  Container(
              
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
              
              padding: EdgeInsets.symmetric(horizontal: 90.w,vertical: 47.h),
              child: Image.asset('assets/images/Group 76005.png',width: 145.w,height: 138.h,))
         
          
        );
      },
    );
  } else {
    // اختياري: عرض رسالة تنبيه إن في بيانات ناقصة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('يرجى ملء جميع الحقول'),
      ),
    );
  }

                           
              
                          },
                          child: Container(
                            height: 54.h,
                            width: 343.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Color(0xff008080),
                            ),
                            child: Center(
                              child: Text(
                                'انشاء حساب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
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
