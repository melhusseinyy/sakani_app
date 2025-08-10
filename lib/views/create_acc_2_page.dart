import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/views/home_page.dart';
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
   bool _obscurePassword=true;
      bool _confirmObscurePassword=true;


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

          Column(
            children: [
              Spacer(),
              Form(
                key:formkey,
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
                        Expanded(
                          child: SingleChildScrollView(
                            
                            child: Column(
                              children: [
                                SizedBox(height: 40.h),
                                CustomFormTextField(
                                  
                                  hintText: 'الاسم',
                                  controller: nameController,
                                  prefixIcon: Icon(Iconsax.user_edit_copy,color: Color(0xff9CA2AC),),
                                  onChanged: (data) {},
                                  onTap: () {},
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return 'برجاء ادخال الاسم';
                                    }
                                     if (!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(value)) {
                                        return 'الاسم يجب أن يحتوي على حروف فقط';
                                      }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24.h),
                                      
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(65.r),
                                      borderSide: BorderSide(
                                        color: Color(0xff15B097)
                                      )
                                    
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 22.h),
                                      
                                    prefixIcon: Icon(Iconsax.user_tag_copy,color:Color(0xff9CA2AC) ),
                                    hintText: 'مستأجر ام مالك؟',
                                    border: OutlineInputBorder(
                                      
                                      borderSide: BorderSide(
                                        
                                        color: Color(0xff9CA2AC)
                                      ),
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
                                  prefixIcon: Icon(Iconsax.sms_copy,color:Color(0xff9CA2AC)),
                                  onChanged: (data) {},
                                   validator: (value) {
                                    if(value!.isEmpty){
                                      return 'برجاء ادخال البريد الالكتروني';
                                    
                                    } if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                        return 'صيغة البريد الإلكتروني غير صحيحة';
                                      }
                                    return null;
                                  },
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
                                  child:Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                                        decoration: BoxDecoration(
                          border:selectedCountryName==null ? Border.all(color: Colors.grey.shade400):Border.all(color: Color(0xff15B097)),
                          borderRadius: BorderRadius.circular(65.r),
                          color: Colors.white,
                                        ),
                                        child: Row(
                          children: [
                           
                            selectedCountryFlag != null
                                    ? Text(
                                        selectedCountryFlag!,
                                        style: TextStyle(fontSize: 24.sp),
                                      )
                                    : Icon(Icons.flag_outlined, color: Color(0xff9CA2AC)),
                                    
                            SizedBox(width: 12.w),
                                    
                            
                            Expanded(
                              child: Text(
                                    selectedCountryName ?? 'اختر الدولة',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: selectedCountryName == null
                          ? Colors.grey
                          : Colors.black,
                                    ),
                              ),
                            ),
                                    
                            
                            Icon(Iconsax.arrow_down, color: Color(0xff9CA2AC)),
                          ],
                                        ),
                                      ),
                                    ),
                               
                                SizedBox(height: 24.h),
                                CustomFormTextField(
                                  hintText: 'هل لديك كود دعوة؟',
                                  prefixIcon: Icon(Iconsax.directbox_notif_copy,color:Color(0xff9CA2AC)),
                                  controller: inviteCodeController,
                                  onChanged: (data) {},
                                ),
                                SizedBox(height: 24.h),
                                CustomFormTextField(
                                  hintText: 'كلمة المرور',
                                  controller: passwordController,
                                  validator: (value) {
                                        if (value == null || value.length < 8) {
                          return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
                                        }
                                        return null;
                                      },
                                  prefixIcon: Icon(Iconsax.lock_1_copy,color:Color(0xff9CA2AC)),
                                  suffixIcon:
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscurePassword=! _obscurePassword;
                                    
                                      });
                                    
                                    },
                                    child: Icon(_obscurePassword? Iconsax.eye_slash_copy:Iconsax.eye_copy, color:Color(0xff9CA2AC)),
                                  ),
                                   
                                  obscureText: _obscurePassword,
                                  onChanged: (data) {},
                                 
                                ),
                                SizedBox(height: 24.h),
                                CustomFormTextField(
                                  hintText: 'تأكيد كلمة المرور',
                                  controller: confirmPasddwordController,
                                  validator: (value) {
                                        if (value != passwordController.text) {
                          return 'كلمة المرور غير متطابقة';
                                        }
                                        return null;
                                      },
                                  prefixIcon: Icon(Iconsax.lock_1_copy, color:Color(0xff9CA2AC)),
                                  suffixIcon: 
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _confirmObscurePassword=!_confirmObscurePassword;
                                      });
                                    },
                                    child: Icon(_confirmObscurePassword? Iconsax.eye_slash_copy:Iconsax.eye_copy,color:Color(0xff9CA2AC)), 
                                  ),
                                 
                                  obscureText: true,
                                  onChanged: (data) {},
                                ),
                                SizedBox(height: 82.h),
                               
                              ],
                            ),
                          ),
                        ),
                         GestureDetector(
                                onTap: () {
                                   if (formkey.currentState!.validate()) {
                                  
                                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 2),(){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return HomePage();
                            }));});
                          
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
            ],
          ),
        ],
      ),
    );
  }
}
