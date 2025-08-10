import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sakni/helper/star_reviws.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key, required this.image, required this.userName, required this.reviewText, required this.date, required this.rating});
final String image;
final String userName;
final String reviewText;
final DateTime date;
final double rating;
  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  late String formattedDate;

  @override
  void initState() {
    super.initState();

   
    formattedDate = formatCustomDate(widget.date);
  }

  String formatCustomDate(DateTime date) {
    String day = DateFormat('d').format(date);         // 13
    String year = DateFormat('y').format(date);        // 2023
    String monthArabic = DateFormat('MMMM', 'ar').format(date); // أغسطس

    return '$day $monthArabic, $year';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10).w,
              child: Image.network(widget.image),
            ),
            Column(children: [
              Text(widget.userName ,style: TextStyle(
                fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xff1D1E20)
              ),),
              SizedBox(height: 6.h,),
              StarReviws(
                initialRating: widget.rating,
                ),
  ],),Spacer(),
   Text(formattedDate,style: TextStyle(
    color: Color(0xff8F959E),fontSize: 12.sp,fontWeight: FontWeight.w600
   ),)
          ],
        ),
        SizedBox(height:8.h ,),
        Text(widget.reviewText,
        style: TextStyle(
          fontSize: 10.sp,fontWeight: FontWeight.w400,color: Color(0xff6F777B)
        ),)
      ],
    );
  }
}