import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/show_all_images.dart';
import 'package:sakni/views/show_sakn_images.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  final PageController controller = PageController();
  final List<String> _images = [
    'assets/images/Rectangle 4 (1).png',
    'assets/images/Rectangle 4 (1).png',
    'assets/images/Rectangle 4 (1).png',
    'assets/images/535e5cfd7e752b1c4fd79ae4d62d86e4ac1c7ae1.jpg',
    'assets/images/Rectangle 4 (1).png',
    'assets/images/535e5cfd7e752b1c4fd79ae4d62d86e4ac1c7ae1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final int extraImages = _images.length > 4 ? _images.length - 4 : 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (Context) {
                  return ShowSaknImages();
                },
              ),
            );
          },
          child: SizedBox(
            height: 158.h,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                  child: Image.asset(
                    _images[index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (Index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color:
                      currentIndex == Index
                          ? const Color(0xff008080)
                          : const Color(0xffAAFFFF),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
        12.bh,
        Row(
          spacing: 5,
          children: List.generate(_images.length > 4 ? 4 : _images.length, (
            index,
          ) {
            
              return Expanded(
                
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShowAllImagesPage(allImages: _images);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      buildThumbnail(_images[index]),
                    if (index == 3 && extraImages > 0)   Container(
                        // width: 79.w,
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
           
          }),
        ),
      ],
    );
  }

  Widget buildThumbnail(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.r),
      child: Image.asset(image,width: double.infinity,  height: 50.h, fit: BoxFit.fill),
    );
  }
}
