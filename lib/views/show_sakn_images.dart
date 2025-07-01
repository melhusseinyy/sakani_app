import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ShowSaknImages extends StatefulWidget {
  const ShowSaknImages({super.key});

  @override
  State<ShowSaknImages> createState() => _ShowSaknImagesState();
}

class _ShowSaknImagesState extends State<ShowSaknImages> {
  int selectedIndex = 0;
  final List<String> images = List.generate(
    10,
    (index) =>
        index % 2 == 0
            ? 'assets/images/Rectangle 4 (1).png'
            : 'assets/images/535e5cfd7e752b1c4fd79ae4d62d86e4ac1c7ae1.jpg',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
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
                  child: Icon(Iconsax.close_square_copy, color: Colors.white, size: 24)),
              ],
            ),
          ),
          SizedBox(height: 200.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Image.asset(
              images[selectedIndex],
              width: double.infinity,
              fit: BoxFit.cover,
              height: 185.h,
            ),
          ),
          SizedBox(height: 237.h),
          SizedBox(
            height: 74.h,
          
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0).w,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                

                physics: BouncingScrollPhysics(),
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
                          color:
                              selectedIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16).r,
                        child: Image.asset(
                          
                          images[index],
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
