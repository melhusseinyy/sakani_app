import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/views/show_sakn_images.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex=0;
  final PageController controller=PageController();
  final List<String> _images=['assets/images/Rectangle 4 (1).png','assets/images/535e5cfd7e752b1c4fd79ae4d62d86e4ac1c7ae1.jpg'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
           onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (Context){
                      return ShowSaknImages();
                    }));
                  },
          child: SizedBox(
            height: 158.h,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex=index;
                });
              },
              itemBuilder: (context,index){
                return  ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                  child: Image.asset(
                    _images[index]
                             ,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                );
              }),
          ),
        ),
          SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:List.generate(_images.length,(Index){
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                         color: currentIndex == Index
                      ? const Color(0xff008080)
                      : const Color(0xffAAFFFF),
                        shape: BoxShape.circle,
                      ),
                    ),);
                  })
                   
                   
       
    )],
    );
  }
}