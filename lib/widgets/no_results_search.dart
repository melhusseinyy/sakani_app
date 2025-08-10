import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoResultsSearch extends StatelessWidget {
  const NoResultsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        
        children: [
          SizedBox(height:105.h ,),
          Center(child: Image.asset('assets/images/Frame.png')),
          SizedBox(height: 24.h,),
          Text('عذراً .. لا يوجد نتائج لديك ..!',style: TextStyle(
            fontSize: 14.sp,fontWeight:FontWeight.w600,color: Color(0xff0B1427)
          ),),
          SizedBox(height: 14.h,),
          Text('قم بتعديل مدخلات البحث لديك لتظهر لك بعض نتائج البحث لدينا لتتمكن من الوصول الى ما تبحث عنة',textAlign:TextAlign.center,style: TextStyle(
            fontSize: 12.sp,fontWeight:FontWeight.w600,color: Color(0xff656B78,)
          ),),
          SizedBox(height: 24.h,),
           Container(
            width: 343.w,
            height: 54.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.sp),
              color: Color(0xff008080),
            ),
            child: Center(
              child: Text(
                'العودة للرئيسية',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}