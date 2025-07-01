import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:sakni/widgets/container_for_dotted_border.dart';

class TimeBottomsheet extends StatefulWidget {
  final void Function(String) onDurationSelected;

  const TimeBottomsheet({super.key, required this.onDurationSelected});
 

  @override
  State<TimeBottomsheet> createState() => _TimeBottomsheetState();
}

class _TimeBottomsheetState extends State<TimeBottomsheet> {

  DateTime? fromDate;
  DateTime? toDate;

  void showPicker(bool isFrom) {
    BottomPicker.date(
      pickerTitle: isFrom ?Text("اختر التاريخ من")  :Text("اختر التاريخ الي"),
     
      initialDateTime: DateTime.now(),
      buttonContent:Text("تم") ,
     
      onSubmit: (date) {
        setState(() {
          if (isFrom) {
            fromDate = date;
          } else {
            toDate = date;
          }
        });
      },
      dismissable: true,
    ).show(context);
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16,right: 16,top: 16,
      bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Icon(Iconsax.close_square_copy,color: Color(0xffC03744),size: 16,),
            SizedBox(width: 119.w,),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.asset('assets/images/Group 1000006446.png'),
            ),
            Text('المدة',style: TextStyle(
              fontSize: 16.sp,fontWeight: FontWeight.w700,color:  Color(0xff008080)
            ),)
          ],),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('اختر المدة',style: TextStyle(
                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                ),),
            ],
          ),
           
                                  SizedBox(height: 8.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector
                                      (onTap: () => showPicker(true),
                                        child: ContainerForDottedBorder(width: 163.w, text: fromDate != null ? formatDate(fromDate) : 'اختر المدة من',prefixIcon:Iconsax.calendar_1_copy,)),
                                      GestureDetector(
                                        onTap: () => showPicker(false),
                                        child: ContainerForDottedBorder(width: 163.w, text: toDate != null ? formatDate(toDate) : 'اختر المدة إلى',prefixIcon:Iconsax.calendar_1_copy,))
                                    
                                    
                                    
                                  ],
                                  ),
                                  
                                   Padding(
                                     padding: const EdgeInsets.only(top: 16,bottom: 16).h,
                                     child: Dash(
                                      direction: Axis.horizontal,
                                      dashColor: Color(0xffD2D2D2),
                                      length: 343.w,
                                      dashLength: 1,
                                      dashThickness: 2,
                                      dashBorderRadius: 3.r,
                                      
                                                                       ),
                                   ),
                                  GestureDetector(
                                    onTap: () {
                                      widget.onDurationSelected('سنة');
                                       Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4,).w,
                                          child: Icon(Iconsax.calendar_tick_copy,color: Color(0xff008080),size: 16,),
                                        ),
                                        Text('سنة',style: TextStyle(
                                                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                ),)
                                        
                                        
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4,top: 4).h,
                                    child: Container(height: 1.h,
                                    color: Color(0xffD2D2D2),
                                    width: 343.w,),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      widget.onDurationSelected('ترم');
                                       Navigator.pop(context);
                                      
                                      
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4).w,
                                          child: Icon(Iconsax.calendar_tick_copy,color: Color(0xff008080),size: 16,),
                                        ),
                                        Text('ترم',style: TextStyle(
                                                  fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                ),)
                                                               
                                      ],
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(bottom: 4,top: 4).h,
                                    child: Container(height: 1.h,
                                    color: Color(0xffD2D2D2),
                                    width: 343.w,),
                                  ),
                                   GestureDetector(
                                    onTap: () {
                                      widget.onDurationSelected('شهر');
                                      Navigator.pop(context);
                                    },
                                     child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10,left: 4).w,
                                          child: Icon(Iconsax.calendar_tick_copy,color: Color(0xff008080),size: 16,),
                                        ),
                                        Text('شهر',style: TextStyle(
                                                   fontSize: 12.sp,fontWeight: FontWeight.w600,color:  Color(0xff008080)
                                                 ),)
                                                                
                                      ],
                                                                       ),
                                   ),
                                  SizedBox(height: 16.h,)
                                  
        ],
        ),
      ),
    );
  }
}



