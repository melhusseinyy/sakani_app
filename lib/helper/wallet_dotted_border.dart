import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:image_picker/image_picker.dart';
class WalletDottedBorder extends StatefulWidget {
  final void Function(File imageFile)? onImageSelected;
  const WalletDottedBorder({super.key, this.onImageSelected});

  @override
  State<WalletDottedBorder> createState() => _WalletDottedBorderState();
}

class _WalletDottedBorderState extends State<WalletDottedBorder> {
  File? selectedImage;

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(selectedImage!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedImage != null) {
      return Container(
        height: 54.h,
        width: 311.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65.r),
          color: const Color(0xff008080).withOpacity(0.1),
        ),
        child: Center(
          child: Image.asset('assets/images/fi_1721539.png'),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _pickImage(context),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(65.r),
          strokeWidth: 1,
          dashPattern: [5, 5],
          borderPadding: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          color: const Color(0xffA4A4A4),
        ),
        child: SizedBox(
          width: 311.w,
          height: 54.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.receipt_2_copy, color: const Color(0xff9CA2AC), size: 20),
              12.bw,
              Text(
                'اضف الايصال',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xff9CA2AC)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
