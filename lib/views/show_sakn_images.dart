import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/models/home_model/unit_model.dart';
class ShowSaknImages extends StatefulWidget {
  const ShowSaknImages({super.key, required this.images, required this.initialIndex});

  final List<ImagesModel> images;
 final int initialIndex;
  @override
  State<ShowSaknImages> createState() => _ShowSaknImagesState();
}

class _ShowSaknImagesState extends State<ShowSaknImages> {
  int selectedIndex = 0;
  @override
  void initState() {
    
    super.initState();
    selectedIndex= widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),
      body: Column(
        children: [
          SizedBox(height: 70.h),
          Padding(
            padding: const EdgeInsets.only(right: 16).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Iconsax.close_square_copy,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200.h),

          // الصورة الكبيرة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.images[selectedIndex].image,
                width: double.infinity,
                height: 185.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 237.h),

          // الصور الصغيرة (thumbnails)
          SizedBox(
            height: 74.h,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0).w,
              child: ListView.builder(
                itemCount: widget.images.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16).r,
                        child: Image.network(
                          widget.images[index].image,
                          width: 74.w,
                          height: 74.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
