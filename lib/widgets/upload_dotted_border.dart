import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UploadDottedBorder extends StatelessWidget {
  const UploadDottedBorder({super.key, this.onImageSelected});
  final void Function(File imageFile)? onImageSelected;

  
  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // أو ImageSource.camera لو عايز كاميرا
      imageQuality: 75, // جودة الصورة للتقليل الحجم
    );

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      if (onImageSelected != null) {
        onImageSelected!(imageFile);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _pickImage(context),
      child: DottedBorder(
                     options: RoundedRectDottedBorderOptions(
                       radius: Radius.circular(10),
                       strokeWidth: 1,
                       dashPattern: [5, 3],
                       borderPadding: EdgeInsets.symmetric(vertical: 8),
                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                       color:Color(0xff008080),
                     ),
                     child: SizedBox(
                       width: 343.w,
                       height: 100.h,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/Vector (3).png'),
                         
                          Text('اضغط هنا لرفع صورة تأكيدية للهوية',style: TextStyle(
                            fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff606060)
                          ),),
                          Text('يُسمح بملفات بحجم 10 ميجابايت كحد أقصى',style: TextStyle(
                            fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xffD2D2D2)
                          ),),
      
                        ],
                       ),
                       
                     ),),
    );
  }
}