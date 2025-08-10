import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';

import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/views/show_sakn_images.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.images});
  final List<ImagesModel> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final int extraImages =
        widget.images.length > 4 ? widget.images.length - 4 : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShowSaknImages(images:widget.images, initialIndex: selectedImageIndex)),
            );
          },
          child: SizedBox(
            height: 158.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                widget.images[selectedImageIndex].image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),

        // مؤشر (دوتس) حسب عدد الصور كلها
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color:
                      selectedImageIndex == index
                          ? const Color(0xff008080)
                          : const Color(0xffAAFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),

        12.bh,

        // الصور المصغرة
        Row(
          children: List.generate(
            widget.images.length >= 4 ? 4 : widget.images.length,
            (index) {
              final bool isLastWithExtra = index == 3 && extraImages > 0;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isLastWithExtra) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ShowSaknImages(images: widget.images,
          initialIndex: index, ),
                        ),
                      );
                    } else {
                      setState(() {
                        selectedImageIndex = index;
                      });
                    }
                  },
                  child: Stack(
                    children: [
                      buildThumbnail(widget.images[index].image),
                      if (isLastWithExtra)
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '+$extraImages',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildThumbnail(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.r),
      child: Image.network(
        image,
        width: double.infinity,
        height: 50.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
