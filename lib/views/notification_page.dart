import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/selection_button.dart';
import 'package:sakni/widgets/notification_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String isSelected = '  الجميع ';
  final List<DateTime> notifications = [
    DateTime.now().subtract(Duration(minutes: 2)),
    DateTime.now().subtract(Duration(hours: 2)),
    DateTime.now().subtract(Duration(days: 4)),
  ];
  List <DateTime> getNotificationsFilter(){
    final now=DateTime.now();
    if(isSelected=='الجميع'){
      return notifications;
    }else if(isSelected=='غير مقروءه'){
      return notifications.where((dt)=>now.difference(dt).inHours<24).toList();
    }else if(isSelected=='مقروءه'){
      return notifications.where((dt)=>now.difference(dt).inHours>=24).toList();
    }
      return notifications;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 19),
        child: Column(
          children: [
            50.bh,
            Row(
              children: [
                16.bw,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Iconsax.arrow_right_1_copy,
                    size: 24,
                    color: Color(0xff0A0B0B),
                  ),
                ),
              ],
            ),
            20.bh,
            Row(
              children: [
                16.bw,
                Text(
                  'الاشعارات',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
            21.bh,
            Row(
              children: [
                16.bw,
                SelectionButton(
                  label: 'الجميع',
                  borderColor: Color(0xff008080),
                  isSelected: isSelected == 'الجميع',
                  onTap: () {
                    setState(() {
                      isSelected = 'الجميع';
                    });
                  },
                ),
                12.bw,
                SelectionButton(
                  label: 'مقروءه',
                  borderColor: Color(0xff008080),
                  isSelected: isSelected == 'مقروءه',
                  onTap: () {
                    setState(() {
                      isSelected = 'مقروءه';
                    });
                  },
                ),
                12.bw,
                SelectionButton(
                  label: 'غير مقروءه',
                  borderColor: Color(0xff008080),
                  isSelected: isSelected == 'غير مقروءه',
                  onTap: () {
                    setState(() {
                      isSelected = 'غير مقروءه';
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:getNotificationsFilter().length,
                
                  itemBuilder: (context, index) {
                    final date=getNotificationsFilter()[index];
                    return NotificationItem(
                      title: 'المميزه',
                      subTitle:
                          '“يوم جديد و عروض جديده عليك تفقدها هيا ابدأ رحلتك فى البحث معنا',
                      date:date ,
                    );
                  },
                ),
            ),
            
           
          ],
        ),
      ),
    );
  }
}
