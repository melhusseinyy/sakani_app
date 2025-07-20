import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/helper/check_dotted_border.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/icon_text_row.dart';

import 'package:sakni/helper/random_text_field.dart';
import 'package:sakni/widgets/booking_bottom_sheet.dart';
import 'package:sakni/widgets/horozintal_card.dart';

import 'package:sakni/widgets/upload_image.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  String? selectedMethod;
  String? selectedRole;
  GlobalKey<FormState> formkey = GlobalKey();
 List<File> uploadedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            
            children: [
              50.bh,
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Iconsax.arrow_right_3_copy,
                      color: Color(0xff008080),
                      size: 22,
                    ),
                  ),
                  115.bw,

                  Text(
                    'بيانات الحجز',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff008080),
                    ),
                  ),
                ],
              ),
              16.bh,
              HorozintalCard(),
              16.bh,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      IconTextRow(
                        text: 'الاسم بالكامل',
                        icon: Iconsax.user_edit_copy,
                      ),
                      8.bh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RandomTextField(
                            text: 'الاول',
                            // height: 40,
                            width: 109,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ادخال الاسم';
                              }if (!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(value)) {
                                        return 'الاسم يجب أن يحتوي على حروف فقط';
                                      }

                              return null;
                            },
                          ),
                          RandomTextField(
                            text: 'الاوسط',
                            height: 40,
                            width: 109,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ادخال الاسم';
                              }if (!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(value)) {
                                        return 'الاسم يجب أن يحتوي على حروف فقط';
                                      }

                              return null;
                            },
                          ),
                          RandomTextField(
                            text: 'الاخير',
                            height: 40,
                            width: 109,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' ادخال الاسم';
                              }
                              if (!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(value)) {
                                        return 'الاسم يجب أن يحتوي على حروف فقط';
                                      }

                              return null;
                            },
                          ),
                        ],
                      ),
                      16.bh,
                      IconTextRow(text: 'الجنسية', icon: Iconsax.flag_copy),
                      8.bh,
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'برجاء اختيار الجنسية';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        icon: Icon(
                          Iconsax.arrow_down_1_copy,
                          size: 14,
                          color: Color(0xff008080),
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xffE8E8E8)),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 7.h),

                          hintText: ' الجنسية',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        items:
                            <String>['سعودي', 'مصري'].map((String value) {
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
                      16.bh,
                      IconTextRow(
                        text: 'بيانات الهوية',
                        icon: Iconsax.user_tick_copy,
                      ),
                      8.bh,
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'برجاء اختيار نوع الهوية';
                          }
                          return null;
                        },
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        icon: Icon(
                          Iconsax.arrow_down_1_copy,
                          size: 14,
                          color: Color(0xff008080),
                        ),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Color(0xffE8E8E8)),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 7.h),

                          hintText: ' نوع الهوية',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        items:
                            <String>['جواز سفر', 'بطاقة رقم قومي'].map((
                              String value,
                            ) {
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
                      16.bh,
                      RandomTextField(
                        text: 'رقم الهوية',
                        height: 40,
                        width: 343,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل رقم الهوية';
                          }
                          return null;
                        },
                      ),
                      16.bh,
                     UploadImage(
                      onImagesChanged: (images) {
                        uploadedImages=images;
                      },
                     ),

                      16.bh,
                      IconTextRow(
                        text: 'رقم الموبايل',
                        icon: Iconsax.call_copy,
                      ),
                      8.bh,
                      Row(
                        children: [
                          RandomTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'برجاء إدخال رقم الهاتف';
                              }
                              if (value.length < 9) {
                                return 'رقم الهاتف قصير جدًا';
                              }
                              return null;
                            },
                            text: 'رقم الهاتف',
                            height: 40,
                            width: 343,
                            suffixIcon: Container(
                              height: 40.h,
                              width: 58.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xff008080),
                              ),
                              child: CountryCodePicker(
                                
                                onChanged: (country) {
                                  print('Selected: ${country.name}');
                                },
                                builder: (country) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 14,
                                      ),

                                      SizedBox(width: 4),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          country!.flagUri!,
                                          package: 'country_code_picker',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                showDropDownButton:   false, // لأنك بتحط الأيقونة بنفسك
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.bh,
                      IconTextRow(
                        text: 'طريقة الدفع',
                        icon: Iconsax.empty_wallet_copy,
                      ),
                      8.bh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CheckDottedBorder(
                            onTap: () {
                              setState(() {
                                selectedMethod = 'المحفظة';
                              });
                            },
                            isSelected: selectedMethod == 'المحفظة',

                            width: 56.w,
                            height: 7.h,
                            text: 'المحفظة',
                          ),
                          CheckDottedBorder(
                            onTap: () {
                              setState(() {
                                selectedMethod = 'تحويل';
                              });
                            },
                            isSelected: selectedMethod == 'تحويل',
                            width: 56.w,
                            height: 7.h,
                            text: 'تحويل',
                          ),
                        ],
                      ),
                      16.bh,
                    ],
                  ),
                ),
              ),

              CustomButton(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    if (selectedMethod == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('برجاء اختيار طريقة الدفع'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (uploadedImages.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('برجاء رفع صورة الهوية'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(42).r,
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return BookingBottomSheet();
                      },
                    );
                  } else {}
                },
                width: 180.w,
                height: 54.h,
                text: 'حجز',
              ),
              16.bh,
            ],
          ),
        ),
      ),
    );
  }
}
