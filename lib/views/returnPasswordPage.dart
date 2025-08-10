import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sakni/custom_button.dart';
import 'package:sakni/views/new_password_page.dart';
import 'package:sakni/widgets/custom_text_home.dart';

class Returnpasswordpage extends StatefulWidget {
  const Returnpasswordpage({super.key});

  @override
  State<Returnpasswordpage> createState() => _ReturnpasswordpageState();
}

class _ReturnpasswordpageState extends State<Returnpasswordpage> {
   Timer? _timer;
  int _seconds = 120;
  bool _isTimerFinished = false;
  String vertificationCode='';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isTimerFinished = false;
      _seconds = 120;
    });

    _timer?.cancel(); // تأكد من إلغاء المؤقت القديم
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
        setState(() {
          _isTimerFinished = true;
        });
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  String get timerText {
    final minutes = (_seconds ~/ 60).toString();
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
       
        children: [
           CustomTextHome(
      title: 'استرجاع كلمة المرور',
      subTitle: 'ادخل الكود الذي تم إرساله إليك حتى تتمكن من استرجاع كلمة المرور الخاصة بك',
    ),
   
           Positioned(
          top: 232.h,
          left: 0,
          right: 0,
          child:Container(
                height: 580.h
                ,
                  decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r)),
          color: Colors.white
                  ),
                 child: Column(
                  
                  children: [
                    SizedBox(height: 40.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68).w,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(appContext: context, length: 4,
                        
                        onChanged: (value) {
                          vertificationCode=value;
                        },
                        pinTheme: PinTheme(inactiveColor:Color(0xff9CA2AC) ,selectedColor: Color(0xff008080)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    CustomButton(onTap: (){
                       if(vertificationCode.length!=4){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('ادخل رمز مكون من 4 ارقام'),
                          backgroundColor: Colors.red,));
                          return;

                        }
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return NewPasswordPage();
                      }));
                    }, width: 343.w, height: 54.h, text: 'تأكيد'),
                    SizedBox(height: 11.h,),
                    Text('لم تستلم رسالة بعد؟',style: TextStyle(
                      color: Color(0xff9CA2AC),fontSize: 12.sp
                    ),),
                    SizedBox(height: 6.h,),
                    GestureDetector(
  onTap: _isTimerFinished ? () {
    startTimer(); // يعيد تشغيل العداد
    // هنا تقدر تضيف كود إرسال الكود من جديد (API مثلاً)
  } : null,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (!_isTimerFinished)
        Text(
          '($timerText)',
          style: const TextStyle(
            color: Color(0xffFF4947),
          ),
        ),
      Text(
        _isTimerFinished
            ? 'إعادة الإرسال'
            : 'إعادة الإرسال بعد ',
        style: TextStyle(
          color: _isTimerFinished ? const Color(0xff008080) : Colors.black,
          fontWeight: _isTimerFinished ? FontWeight.bold : FontWeight.normal,
          fontSize: 14.sp,
        ),
      ),
      
    ],
  ),
),

                  ],
                 ),
                  ),
      )],
      ),
    );
  }
}