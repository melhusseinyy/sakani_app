import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    required this.suffixIcon,
    required this.onChanged,
     this.controller,
     this.errorText,
    required this.borderColor, this.maxLines=1,
    
  });
  String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData suffixIcon;
  final Function(String)? onChanged;
  bool obscureText;
  final String? errorText;
  final Color borderColor;
  final int? maxLines ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onChanged: onChanged,
      textAlign: TextAlign.end,
      controller: controller,

      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },

      decoration: InputDecoration(
        
        errorText: errorText,

        suffixIcon: Icon(suffixIcon, color: Color(0xff9CA2AC)),
        prefixIcon: Icon(prefixIcon, color: Color(0xff9CA2AC)),
        

        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff9CA2AC)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: BorderSide(color:Color(0xff9CA2AC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(65.r),
          borderSide: BorderSide(color:borderColor),
        ),
      ),
    );
  }
}
