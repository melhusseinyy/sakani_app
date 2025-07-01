import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';

class ShareAppBottomSheet extends StatelessWidget {
  const ShareAppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:  EdgeInsets.only(left: 16,right: 16,top: 16,
      bottom:16),
      child: Container(
      
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Iconsax.close_square_copy,color: Color(0xffC03744),size: 16,)),
            SizedBox(width: 87.w,),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Iconsax.export_1_copy,color: Color(0xff008080),size: 16,),
            ),
            Text('مشاركة التطبيق',style: TextStyle(
              fontSize: 16.sp,fontWeight: FontWeight.w700,color:  Color(0xff008080)
            ),)
          ],),
          24.bh,
         Image.asset('assets/images/Group 1000006460.png',width: double.infinity,fit: BoxFit.fill,),
         24.bh,
         Row(children: [
          Image.asset('assets/images/fi_15707820.png'),
          4.bw,
          Text('واتس اب',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
            ),)
         ],),
         16.bh,
          Row(children: [
          Image.asset('assets/images/fi_2111646.png'),
          4.bw,
          Text('تيلجرام',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
            ),)
         ],),
         16.bh,
          Row(children: [
          Image.asset('assets/images/Social Icons.png'),
          4.bw,
          Text('ماسنجر',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
            ),)
         ],),
         16.bh,
          Row(children: [
           Icon(Iconsax.link_21_copy,color: Color(0xff008080),size: 20,),
          4.bw,
          Text('نسخ اللينك',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
            ),)
         ],),
         16.bh,
          Row(children: [
           Icon(Iconsax.scan_barcode_copy,color: Color(0xff008080),size: 20,),
          4.bw,
          Text('نسخ ال كيو ار كود',style: TextStyle(
              fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
            ),)
         ],),

          ],
          

        ),
      ),
    );
  }
}