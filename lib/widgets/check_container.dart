
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer({
    super.key, required this.text1, required this.text2, required this.image,required this.onTap, required this.isSelected,
  });
  final String text1,text2,image;
  final void Function()? onTap;
  final bool isSelected;
   
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      
      child: Container(
        width:343.w ,
        height:84.h ,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(30.r),
         border: Border.all(
          color:isSelected?Colors.teal: Color(0xffE5E5E5),
          width: isSelected? 2.5:1
         )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
              padding: const EdgeInsets.only(right: 12,left: 12).w,
              child: Image.asset(image),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
           
                Text(text1,style: TextStyle(
                  fontSize: 16.sp,fontWeight: FontWeight.w400
                ),),
                Text(text2,style: TextStyle(
                  fontSize: 16.sp,fontWeight: FontWeight.w400
                ),),
      
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
