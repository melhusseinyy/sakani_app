import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/widgets/upload_dotted_border.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.onImagesChanged});
  final void Function(List<File> images) onImagesChanged;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
    List<File> uploadedImages = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
                        children: [
                          Text(
                            'صورة الهوية',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff008080),
                            ),
                          ),
                        ],
                      ),
                      6.bh,

                      6.bh,
                      if (uploadedImages.isNotEmpty)
                        Wrap(
                          runAlignment: WrapAlignment.start,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          
                          spacing: 8, // المسافة بين الصور
                          runSpacing: 8,
                          children:
                              uploadedImages.map((imageFile) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: 84.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.file(
                                        imageFile,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      right: 3,
                                      top: 3,
                                      child: GestureDetector(
                                        onTap: () {

                                          setState(() {
                                            uploadedImages.remove(imageFile);
                                          });
                                            widget.onImagesChanged(uploadedImages);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),

                      UploadDottedBorder(
                        onImageSelected: (file) {
                          setState(() {
                            uploadedImages.add(file);
                            widget.onImagesChanged(uploadedImages);
                          });
                        },
                      ),
      ],
    );
  }
}