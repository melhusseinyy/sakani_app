import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/selection_box.dart';
import 'package:sakni/views/notification_page.dart';
import 'package:sakni/views/offers_page.dart';
import 'package:sakni/views/search_page.dart';
import 'package:sakni/widgets/custom_card.dart';
import 'package:sakni/widgets/dotted_border.dart';
import 'package:sakni/widgets/share_app_bottom_sheet.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDuration;
  String? selectedLocation;
  String? selectedSaknType;
  String isSelected='طلاب';
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
     extendBody: true,
    
      body: 
      
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 62.h),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8).w,
                  child: Image.asset('assets/images/Ellipse 8.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Column(
                    children: [
                      Text(
                        'اهلا مصطفى كيف الحال ؟',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff008080),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'قم بالبحث عن سكنك بسهوله',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff008080),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return NotificationPage();
                  }));
                },
                  child: Icon(Iconsax.notification_copy, color: Color(0xff008080))),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/Group 76014.png',
                      height: 158.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 16.h),
                   SelectionBox(onchanged:(type){
                    setState(() {
                      isSelected=type;

                    });
                   },),
                   DottedBorderr(
                    selectedType: isSelected,
  onTap: (location, saknType, duration) {
setState(() {
      selectedLocation = location;
      selectedSaknType = saknType;
      selectedDuration = duration;
});
 Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage(
        location: location,
        duration: duration,
        saknType: saknType,
        selectedType:isSelected ,

      );
    }));
  },
),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('علميات البحث الاخيرة',style: TextStyle(
                          fontSize: 14.sp,fontWeight: FontWeight.w500,color: Color(0xff008080)
                        
                        ),),
                      ],
                    ),
                    SizedBox(height: 8.h,),
                    SizedBox(
                      height: 228.h,
                      child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,kk){
                    return Padding(
                      padding: const EdgeInsets.only(left:12),
                      child: CustomCard(),
                    );
                  }),
                    ),
                    Padding(
                      padding:EdgeInsets.only(top:16.w,bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('المقالات',style: TextStyle(
                            fontSize: 14.sp,fontWeight: FontWeight.w500,color:  Color(0xff008080)
                          ),),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/Group 76018.png',width: double.infinity,fit: BoxFit.fill,),
                    SizedBox(height: 16.h,),
                   GestureDetector(
                    onTap: (){
                      showModalBottomSheet( 
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top:Radius.circular(16).r ),
                                    
                                  ),
                                  context: context, builder: (context){
                                  return ShareAppBottomSheet();
                                });
                    },
                    child: Image.asset('assets/images/Group 1000006460.png',width: double.infinity,fit: BoxFit.fill,)),
                      SizedBox(height: 100.h,) ],

                ),
              ),
            ),
     
          
          ],
        ),
      ),
      
    ),
    Positioned(
      top: 551.h,

      child:Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.white,
shape: BoxShape.circle,
boxShadow: [
  BoxShadow(
    color: Color(0xff0000001a),
    blurRadius: 13,
    offset: Offset(0, 4)
  )
]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
          Icon(Iconsax.headphone_copy,color:Color(0xff008080) ,),
          Text('الدعم',style: TextStyle(
            color: Color(0xff008080),fontSize: 10.sp,fontWeight: FontWeight.w400
          ),)
        ],)
      ) )

    ],

    );
  }
}
