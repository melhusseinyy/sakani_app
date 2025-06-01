import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    required this.suffixIcon,

    this.controller,
    this.errorText,required this.onChanged,
 
  });
  final String hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget suffixIcon;
  final void Function(String)? onChanged;
 

  bool obscureText;
  final String? errorText;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      
    onChanged:onChanged ,
    
      textAlign: TextAlign.end,
      controller: controller,
    
      obscureText: obscureText,
    
      decoration: InputDecoration(
        contentPadding:EdgeInsets.symmetric(vertical:20.h ) ,
        
        
        
       
        errorText: errorText,
    
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
    
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff9CA2AC)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: BorderSide(color: Color(0xff9CA2AC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: BorderSide(color: Color(0xff15B097)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: const BorderSide(color: Color(0xffC03744)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: const BorderSide(color: Color(0xffC03744), width: 2),
        ),
      ),
    );
  }
}
