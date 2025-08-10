import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacePrintWidget extends StatefulWidget {
  const FacePrintWidget({super.key});

  @override
  State<FacePrintWidget> createState() => _FacePrintWidgetState();
}

class _FacePrintWidgetState extends State<FacePrintWidget> {
 bool showfaceId=true;

     void toggleIcon(){
      setState(() {
        showfaceId=!showfaceId;
      });
     }

  @override
  Widget build(BuildContext context) {
    return InkWell(
                          onTap:toggleIcon,
                          child: Container(
                            width: 74.h,
                            height: 54.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff008080),
                                width: 2
                              ),
                            
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset(showfaceId?'assets/images/fi_10898988.png':'assets/images/Group 45.png'
                            
                            ,width: 24.w,
                            height: 24.h,
                                                             
                            ),
                            
                            
                          ),
                        );
  }
}