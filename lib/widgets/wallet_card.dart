import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/wallet_dotted_border.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key, required this.isSelected});
 final int isSelected;
  @override
  State<WalletCard> createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  bool isOpend=false;
  @override
  void initState() {
    super.initState();
    if (widget.isSelected == 1) {
      isOpend = true; // ✅ افتح الكارد تلقائيًا
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
       setState(() {
         isOpend= !isOpend;
       });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff008080).withValues(alpha: .10)
                ),
                child: Icon(Iconsax.convert_card_copy,color: Color(0xff008080),size: 24,)),
              16.bw,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                Text('طلب شحن المحفظه',
                style: TextStyle(
                  fontSize: 15.sp,fontWeight: FontWeight.w500,color:Colors.black
                ),),
                6.bh,
                 Text(' اليوم , 2:10',
                style: TextStyle(
                  fontSize: 12.sp,fontWeight: FontWeight.w400,color:Color(0xff9CA2AC)
                ),)
              ],),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                
                Text('500 ج -',
                style: TextStyle(
                  fontSize: 16.sp,fontWeight: FontWeight.w700,color:Color(0xff008080)
                ),),
                6.bh,
                Icon(Iconsax.arrow_circle_left_copy,color:Color(0xff9CA2AC),size: 24,)
              ],)
          
            ],
          ),
          8.bh,
          if (isOpend)
          Column(
            children: [
             if(widget.isSelected==1)...[
          Column(
            children: [
               Text('عليك ارفاق الايصال لاتمام العمليه',style: TextStyle(
            fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xffC03744)
          ),),
          26.bh,
         WalletDottedBorder()

            ],
          )]
          else if( widget.isSelected==2)...[
         
          Container(
            height: 54.h,
            width: 311.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.r),
              color: Color(0xffFAFAFA),
              border: Border.all(
                color: Color(0xffE5E5E5)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/transaction-W2tvRDWQir.png'),
                16.bw,
                Text('جارى التأكد من بيانات العمليه',style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w400,color:Color(0xff9CA2AC)
               ),)
              ],
            ),
          )]
          else if( widget.isSelected==3)...[
         
          Container(
            height: 54.h,
            width: 311.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.r),
              color: Color(0xff008080).withValues(alpha: .10),
            
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Text('تم شحن المحفظه',style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w400,color:Color(0xff008080)
               ),)
              ],
            ),
          )]
           else if( widget.isSelected==4)...[
         
          Container(
            height: 54.h,
            width: 311.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.r),
              color: Color(0xffC03744).withValues(alpha: .10),
            
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset('assets/images/Vector (4).png'),
               12.bw,
                Text('فشلت عمليه التحويل',style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w400,color:Color(0xff9CA2AC)
               ),)
              ],
            ),
          )]

            ],
          ),
         

         
        20.bh,
          Divider()
       ],

        
      ),
    );
  }
}