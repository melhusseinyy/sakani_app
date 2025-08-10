import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';
import 'package:sakni/cubits/search_cubit/search_cubit.dart';
import 'package:sakni/models/Auth_model/user_model.dart';
import 'package:sakni/models/home_model/taskeen_types_model.dart';
import 'package:sakni/models/home_model/taskken_periods_model.dart';
import 'package:sakni/models/home_model/type_model.dart';
import 'package:sakni/views/search_page.dart';
import 'package:sakni/widgets/loction_buttom_sheet.dart';
import 'package:sakni/widgets/container_for_dotted_border.dart';
import 'package:sakni/widgets/sakn_type_bottomsheet.dart';
import 'package:sakni/widgets/time_bottomsheet.dart';

class DottedBorderr extends StatefulWidget {
  final Function(String? location, String? saknType, String? duration)? onTap;
  const DottedBorderr({super.key, this.onTap, this.selectedType});
  final TypeModel? selectedType;

  @override
  State<DottedBorderr> createState() => _DottedBorderrState();
}

class _DottedBorderrState extends State<DottedBorderr> {
  TaskeenPeriodsModel? selectDuration;
  CountryModel? selectedLocation;
 
  TaskeenTypesModel? selectedTaskeenType;
  TypeModel? selectType;
  @override
void initState() {
  super.initState();
  selectType = widget.selectedType; // 👈 إضافة السطر ده
}


  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchTaskeenTypes();
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16),
        strokeWidth: 1,
        dashPattern: [5, 3],
        borderPadding: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        color: Color(0xffA4A4A4),
      ),
      child: SizedBox(
        width: 343.w,
        height: 161.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                final result = await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16).r,
                    ),
                  ),
                  context: context,
                  builder: (context) => LocationButtomSheet(),
                );

                if (result != null) {
                  Future.microtask(() {
                    if (mounted) {
                      setState(() {
                        selectedLocation = result;
                      });
                    }
                  });
                }
              },
              child: ContainerForDottedBorder(
                width: 327.w,
                text:
                    selectedLocation?.title ??
                    'اكتب عنوانك او اي معلم مهم قريب لك',
                prefixIcon: Iconsax.location_copy,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    final result =
                        await showModalBottomSheet<TaskeenTypesModel>(
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16).r,
                            ),
                          ),
                          context: context,
                          builder: (context) => SaknTypeBottomsheet(),
                        );

                    if (result != null) {
                      Future.microtask(() {
                        if (mounted) {
                          setState(() {
                            selectedTaskeenType = result;
                          });
                        }
                      });
                    }
                  },
                  child: ContainerForDottedBorder(
                    width: 155.w,
                    text: selectedTaskeenType?.title ?? 'اختر نوع السكن',
                    prefixIcon: Iconsax.house_2_copy,
                    sufffixIcon: Iconsax.arrow_down_1_copy,
                  ),
                ),
                GestureDetector(
                  onTap: ()async {
                    context.read<HomeCubit>().fetchTaskeenPeriods();
               final duration=  await showModalBottomSheet<TaskeenPeriodsModel>(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16).r,
                        ),
                      ),
                      context: context,
                      builder:
                          (context) => TimeBottomsheet(
                            onDurationSelected: (duration) {
                              Future.microtask(() {
                                if (mounted) {
                                  setState(() {
                                    selectDuration = duration;
                                  });
                                }
                              });
                            },
                          ),
                    );
                  },
                  child: Container(
                    height: 32.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                      color: Color(0xffE2E2E2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Image.asset(
                              'assets/images/Group 1000006446.png',
                            ),
                          ),
                          Text(
                            selectDuration?.title ?? 'اختر المدة',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color:
                                  selectDuration == null
                                      ? Color(0xff8E8E8E)
                                      : Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Iconsax.arrow_down_1_copy,
                            color: Color(0xff008080),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                print("ontap");
                widget.onTap?.call(
                  selectedLocation?.title,
                  selectedTaskeenType?.title,
                  selectDuration?.title,
                );
                if (selectedLocation != null &&
                    selectedTaskeenType?.title != null &&
                    selectDuration != null) {
                  final cubit = context.read<SearchCubit>();
                  cubit.body.selectedCityId = selectedLocation?.id;
                  cubit.body.selectedSaknTypeId = selectedTaskeenType?.id ?? 0;
                 

                  cubit.body.selectedDurationId = selectDuration?.id;
                  cubit.body.selectedTypeId = widget.selectedType?.id;
                   print(
                    'cubit.body.selectedSaknTypeId ${cubit.body.selectedSaknTypeId}   ${cubit.body.selectedCityId}  ${cubit.body.selectedDurationId}  ${cubit.body.selectedTypeId}',
                  );
                  await cubit.fetchSearchResult();
                }
              },
              child: Container(
                width: 90.w,
                height: 33.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: Color(0xff008080),
                ),
                child: Center(
                  child: Text(
                    'بحث',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}