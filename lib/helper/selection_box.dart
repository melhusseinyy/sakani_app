import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';
import 'package:sakni/models/home_model/type_model.dart';

class SelectionBox extends StatelessWidget {
  const SelectionBox({super.key, required this.types, this.onTypeSelected,  this.selectedType});
  final List<TypeModel>? types;
  final TypeModel? selectedType;
  final Function(TypeModel)? onTypeSelected;

  @override
  Widget build(BuildContext context) {
;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            types!.map((type) {
              final isSelected = selectedType?.id == type.id;
              return Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: GestureDetector(
                  onTap: () {
                    log('type5${type.title}');
                    context.read<HomeCubit>().changeSelectedType(type);
                    onTypeSelected!(type);
                  },
                  child: Container(
                    width: 85.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color:
                          isSelected
                              ? const Color(0xff008080)
                              : const Color(0xffE2E2E2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (type.image != null && type.image!.isNotEmpty) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: Image.network(
                              type.image!,
                              width: 20.w,
                              height: 20.h,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const SizedBox(),
                            ),
                          ),
                          SizedBox(width: 4.w),
                        ],
                        Text(
                          type.title ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color:
                                isSelected
                                    ? const Color(0xffE2E2E2)
                                    : const Color(0xff8E8E8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
