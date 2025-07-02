import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sakni/helper/extention.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.title, required this.subTitle, required this.date});
  final String title;
  final String subTitle;
  final DateTime date;


  @override
  Widget build(BuildContext context) {
   String status=_getStatus(date);
    return Column(
      children: [
        20.bh,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.bw,
            Image.asset('assets/images/Group 1000006437.png',),
            10.bw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                 
                  children: [
                    Text(title,style: TextStyle(
                      fontSize: 12.sp,fontWeight:FontWeight.w600
                    ),),
                    Spacer(),
                   
                    status=='جديدة'?
                    Row(
                      children: [
                         Container(
                  width: 5.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffC03744)
                  ),
                  
                ),
                4.bw,
                Text(status,style: TextStyle(
                  fontSize: 12.sp,fontWeight:FontWeight.w500,color: Color(0xffC03744)
                ),),
              
                      ],
                    ):
                    
                 Text(status,style: TextStyle(
                  fontSize: 12.sp,fontWeight:FontWeight.w500,color:Color(0xff9CA2AC)),),
                  16.bw,
                  ],
                ),
                2.bh,
                 Text(subTitle,maxLines: 2,style: TextStyle(
                  fontSize: 12.sp,fontWeight:FontWeight.w500,color: Color(0xff9CA2AC)
                ),),
              ],),
              
              
            ),
           
          ],
        ),
        20.bh,
        Divider()
      ],
      

    );
  }
}
String _getStatus(DateTime date){
  final now= DateTime.now();
  final diff= now.difference(date);
  if(diff.inMinutes<10){
    return 'جديدة';
  }else if(diff.inHours<24){
    String formattedTime=DateFormat('hh a','ar').format(date);
    return formattedTime;
  }else{
    int days=diff.inDays;
    return'قبل $days يوم';
  }

}