import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionBox extends StatefulWidget {
  const SelectionBox({super.key, required this.onchanged});
  final Function(String) onchanged;

  @override
  State<SelectionBox> createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  String  isSelected='طلاب';
  @override
  Widget build(BuildContext context) {
    return  Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected='طلاب';
                            });
                            widget.onchanged(isSelected);
                          },
                          child: Container(
                            width: 51.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color:isSelected=='طلاب'? Color(0xff008080): Color(0xffE2E2E2),
                            ),
                            child: Center(
                              child: Text(
                                'طلاب',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color:isSelected=='طلاب'? Color(0xffE2E2E2): Color(0xff8E8E8E),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected='سياحي';
                            });
                             widget.onchanged(isSelected);
                          },
                          child: Container(
                            width: 59.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color:isSelected=='سياحي'? Color(0xff008080): Color(0xffE2E2E2),
                            ),
                            child: Center(
                              child: Text(
                                'سياحي',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color:isSelected=='سياحي'? Color(0xffE2E2E2): Color(0xff8E8E8E),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
  }
}