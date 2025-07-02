import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/rating_row.dart';
import 'package:sakni/views/selector_box.dart';
import 'package:sakni/widgets/dot_label_box.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterSearchPage extends StatefulWidget {
const  FilterSearchPage({super.key});

  @override
  State<FilterSearchPage> createState() => _FilterSearchPageState();
}

class _FilterSearchPageState extends State<FilterSearchPage> {
SfRangeValues _values= SfRangeValues(0, 150000.0);
final bool selectedIndex=false;
 List<String> selectHouseTyping=[];
 List<String> selectLocation=[];
 List<String> selectAdvantages=[];
 double? selectedRating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 73.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16).w,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Icon(Iconsax.search_normal_copy,color: Color(0xff008080),size: 16,),
                SizedBox(width: 4.w,),
                Text('البحث',style: TextStyle(
                  fontSize: 16.sp,fontWeight: FontWeight.w700,color: Color(0xff008080)
                ),),
                Spacer(),
                 GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Iconsax.arrow_left_2_copy,color: Color(0xff008080),size: 16,)),
              ],
            ),
          ),
          SizedBox(height: 16.h,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                     Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Iconsax.close_square_copy, color:Color(0xffC03744), size: 16)),
                    SizedBox(width: 119.w,),
                     Icon(Iconsax.setting_3_copy,color: Color(0xff008080),size: 16),
                     SizedBox(width: 4.w,),
                     Text('فلتر حسب',style: TextStyle(
                      fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                     ),)
                
                ],
                            ),
                            SizedBox(height: 16.h,),
                            Row(
                              children: [
                                 Text('نوع السكن',style: TextStyle(
                      fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                     ),)
                              ],
                            ),
                            SizedBox(height: 6.h,),
                            Row(
                              children: [
                              DottedLabelBox(label: 'سرير', isSelected: selectHouseTyping.contains('سرير'), 
                              onTap:(){
                                setState(() {
                                  if ( selectHouseTyping.contains('سرير')){
                                     selectHouseTyping.remove('سرير');
                                  }else{
                                     selectHouseTyping.add('سرير');
                                  }
                                  selectHouseTyping.remove('الكل');
                                  
          if (selectHouseTyping.contains('سرير') &&
              selectHouseTyping.contains('غرفة') &&
              selectHouseTyping.contains('شقة')) {
            selectHouseTyping
              ..remove('سرير')
              ..remove('غرفة')
              ..remove('شقة')
              ..add('الكل');
          }

                                });
                              }),
                              10.bw,
                               DottedLabelBox(label: 'غرفة', isSelected: selectHouseTyping.contains('غرفة'), 
                              onTap:(){
                                setState(() {
                                  if ( selectHouseTyping.contains('غرفة')){
                                     selectHouseTyping.remove('غرفة');
                                  }else{
                                     selectHouseTyping.add('غرفة');
                                  }
                                  selectHouseTyping.remove('الكل');
                                  
          if (selectHouseTyping.contains('سرير') &&
              selectHouseTyping.contains('غرفة') &&
              selectHouseTyping.contains('شقة')) {
            selectHouseTyping
              ..remove('سرير')
              ..remove('غرفة')
              ..remove('شقة')
              ..add('الكل');
          }

                                });
                              }),
                              10.bw,
                               DottedLabelBox(label: 'شقة', isSelected: selectHouseTyping.contains('شقة'), 
                              onTap:(){
                                setState(() {
                                  if ( selectHouseTyping.contains('شقة')){
                                     selectHouseTyping.remove('شقة');
                                  }else{
                                     selectHouseTyping.add('شقة');
                                  }
                                  selectHouseTyping.remove('الكل');
                                  
          if (selectHouseTyping.contains('سرير') &&
              selectHouseTyping.contains('غرفة') &&
              selectHouseTyping.contains('شقة')) {
            selectHouseTyping
              ..remove('سرير')
              ..remove('غرفة')
              ..remove('شقة')
              ..add('الكل');
          }

                                });
                              }),
                              10.bw,
                               DottedLabelBox(label: 'الكل', isSelected: selectHouseTyping.contains('الكل'), 
                              onTap:(){
                                setState(() {
                                  if ( selectHouseTyping.contains('الكل')){
                                     selectHouseTyping.remove('الكل');
                                  }else{
                                     selectHouseTyping.add('الكل');
                                  }
                                  selectHouseTyping..clear()..add('الكل');

                                });
                              }),
                              
                              ],
                            ),
                            SizedBox(height: 16.h,),
                             Row(
                               children: [
                                 Text('عدد الغرف',style: TextStyle(
                                                       fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                      ),),
                               ],
                             ),
                             SizedBox(height: 8.h,),
                           SelectorBox(),
                              16.bh,
                                 Row(
                               children: [
                                 Text(' عدد السراير',style: TextStyle(
                                                       fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                      ),),
                               ],
                             ),
                             8.bh,
                             SelectorBox(),
                             16.bh,
                             Row(
                               children: [
                                 Text('الموقع',style: TextStyle(
                                                       fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                      ),),
                               ],
                             ),
                             8.bh,
                              Row(
                              children: [
                                 DottedLabelBox(label: 'الاقرب', isSelected: selectLocation.contains('الاقرب'), 
                              onTap:(){
                                setState(() {
                                  if ( selectLocation.contains('الاقرب')){
                                     selectLocation.remove('الاقرب');
                                  }else{
                                     selectLocation.add('الاقرب');
                                  }
                                    selectLocation.remove('الكل');
          

                                });
                              }),
                              10.bw,
                               DottedLabelBox(label: 'الكل', isSelected: selectLocation.contains('الكل'), 
                              onTap:(){
                                setState(() {
                                  if ( selectLocation.contains('الكل')){
                                     selectLocation.remove('الكل');
                                  }else{
                                     selectLocation.add('الكل');
                                  }
                                    selectLocation.remove('الاقرب');

                                });
                              }),
                              ],
                            ),
                            16.bh,
                             Row(
                               children: [
                                 Text('الاسعار',style: TextStyle(
                                                           fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                          ),),
                               ],
                             ),
                             8.bh,
                             SfRangeSlider(
                              
                              min: 0.0,
                              max: 200000.0,
                              values: _values,
                             interval: 5000,
        showTicks: false,
        showLabels: false,
        enableTooltip: false,
        minorTicksPerInterval: 1,
        activeColor: Color(0xff008080),
        numberFormat: NumberFormat.compact(locale: 'en'),
        
        onChanged: (SfRangeValues values){
          setState(() {
            _values = SfRangeValues(
      values.start.roundToDouble(),
      values.end.roundToDouble(),
    );
          });},
          tooltipTextFormatterCallback: (actualValue, formattedText) {
            return '$formattedText ج.م';
          },
          ),
          16.bh,
          Row(
            children: [
              Text('السعر: ${_values.start.toInt()}  ج.م حتي  ${_values.end.toInt()}ج.م',style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w500,color: Color(0xff909DAD)
              ),),
            ],
          ),
          16.bh,
           Row(
                               children: [
                                 Text('المميزات',style: TextStyle(
                                                           fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                          ),),
                               ],
                             ),
                             8.bh,
                             Row(
                              children: [
                                 DottedLabelBox(label: 'واي فاي', isSelected: selectAdvantages.contains('واي فاي'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('واي فاي')){
                                     selectAdvantages.remove('واي فاي');
                                  }else{
                                     selectAdvantages.add('واي فاي');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
          if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                               85.bw,
                                 DottedLabelBox(label: 'مساحة خضراء', isSelected: selectAdvantages.contains('مساحة خضراء'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('مساحة خضراء')){
                                     selectAdvantages.remove('مساحة خضراء');
                                  }else{
                                     selectAdvantages.add('مساحة خضراء');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
           if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                              ],
                             ),
                             8.bh,
                              Row(
                              children: [
                                 DottedLabelBox(label: 'قريبه من الجيم', isSelected: selectAdvantages.contains('قريبه من الجيم'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('قريبه من الجيم')){
                                     selectAdvantages.remove('قريبه من الجيم');
                                  }else{
                                     selectAdvantages.add('قريبه من الجيم');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
             if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }
                                });
                              }),
                               56.bw,
                                 DottedLabelBox(label: 'بها حمام خاص', isSelected: selectAdvantages.contains('بها حمام خاص'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('بها حمام خاص')){
                                     selectAdvantages.remove('بها حمام خاص');
                                  }else{
                                     selectAdvantages.add('بها حمام خاص');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
             if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                              ],
                             ),
                             8.bh,
                              Row(
                              children: [
                                 DottedLabelBox(label: 'ماكينة قهوه', isSelected: selectAdvantages.contains('ماكينة قهوه'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('ماكينة قهوه')){
                                     selectAdvantages.remove('ماكينة قهوه');
                                  }else{
                                     selectAdvantages.add('ماكينة قهوه');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
           if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                               65.bw,
                                 DottedLabelBox(label: 'قريبه من الخدمات', isSelected: selectAdvantages.contains('قريبه من الخدمات'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('قريبه من الخدمات')){
                                     selectAdvantages.remove('قريبه من الخدمات');
                                  }else{
                                     selectAdvantages.add('قريبه من الخدمات');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
            if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                              ],
                             ),
                             8.bh,
                              Row(
                              children: [
                                 DottedLabelBox(label: 'اجهزة كهربائية', isSelected: selectAdvantages.contains('اجهزة كهربائية'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('اجهزة كهربائية')){
                                     selectAdvantages.remove('اجهزة كهربائية');
                                  }else{
                                     selectAdvantages.add('اجهزة كهربائية');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
           if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                               58.bw,
                                 DottedLabelBox(label: 'غاز طبيعي', isSelected: selectAdvantages.contains('غاز طبيعي'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('غاز طبيعي')){
                                     selectAdvantages.remove('غاز طبيعي');
                                  }else{
                                     selectAdvantages.add('غاز طبيعي');
                                  }
                                  selectAdvantages.remove('الكل');
                                  
            if (selectAdvantages.contains('واي فاي') &&
              selectAdvantages.contains('مساحة خضراء') &&
              selectAdvantages.contains('قريبه من الجيم') &&
              selectAdvantages.contains('بها حمام خاص') &&
              selectAdvantages.contains('ماكينة قهوه') &&
              selectAdvantages.contains('قريبه من الخدمات') &&
              selectAdvantages.contains('اجهزة كهربائية') &&
              selectAdvantages.contains('غاز طبيعي')) {
            selectAdvantages
              ..remove('واي فاي')
              ..remove('مساحة خضراء')
              ..remove('قريبه من الجيم')
              ..remove('بها حمام خاص')
              ..remove('ماكينة قهوه')
              ..remove('قريبه من الخدمات')
              ..remove('اجهزة كهربائية')
              ..remove('غاز طبيعي')
              ..add('الكل');
          }

                                });
                              }),
                              ],
                             ),
                             8.bh,
                             Row(
                               children: [
                                 DottedLabelBox(label: 'الكل', isSelected: selectAdvantages.contains('الكل'), 
                              onTap:(){
                                setState(() {
                                  if ( selectAdvantages.contains('الكل')){
                                     selectAdvantages.remove('الكل');
                                  }else{
                                     selectAdvantages.add('الكل');
                                  }
                                 
                                   selectAdvantages..clear()..add('الكل');
             
          

                                });
                              }),
                               ],
                             ),
                             14.bh,
                              Row(
                               children: [
                                 Text('تقييمات المُنتجات',style: TextStyle(
                                                           fontSize: 12.sp,fontWeight: FontWeight.w600,color: Color(0xff008080)
                                                          ),),
                               ],
                             ),
                             16.bh,
                              ...[5.0, 4.0, 3.0, 2.0, 1.0].map((rating) => Column(
      children: [
        RatingRow(
          isSelected:selectedRating==rating ,
          onTap: () {
            setState(() {
              if(selectedRating==rating){
                selectedRating=null;
              }else{
                selectedRating=rating;
              }
              
            });
          },
          rating: rating),
        20.bh,
      ],
    )),
                              


                             


                            


                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}