import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/widgets/loction_buttom_sheet.dart';
import 'package:sakni/widgets/container_for_dotted_border.dart';
import 'package:sakni/widgets/sakn_type_bottomsheet.dart';
import 'package:sakni/widgets/time_bottomsheet.dart';
class DottedBorderr extends StatefulWidget {
  final Function(String? location, String? saknType, String? duration)? onTap;
  const DottedBorderr({super.key, this.onTap,  this.selectedType});
  final String? selectedType;

  @override
  State<DottedBorderr> createState() => _DottedBorderrState();
}

class _DottedBorderrState extends State<DottedBorderr> {
  String? selectDuration;
  String? selectedLocation;
  String? selectedSaknType;

  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16).r),
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
                text: selectedLocation ?? 'اكتب عنوانك او اي معلم مهم قريب لك',
                prefixIcon: Iconsax.location_copy,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    final result = await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16).r),
                      ),
                      context: context,
                      builder: (context) => SaknTypeBottomsheet(),
                    );

                    if (result != null) {
                      Future.microtask(() {
                        if (mounted) {
                          setState(() {
                            selectedSaknType = result;
                          });
                        }
                      });
                    }
                  },
                  child: ContainerForDottedBorder(
                    width: 155.w,
                    text: selectedSaknType ?? 'اختر نوع السكن',
                    prefixIcon: Iconsax.house_2_copy,
                    sufffixIcon: Iconsax.arrow_down_1_copy,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16).r),
                      ),
                      context: context,
                      builder: (context) => TimeBottomsheet(
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
                            child: Image.asset('assets/images/Group 1000006446.png'),
                          ),
                          Text(
                            selectDuration ?? 'اختر المدة',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: selectDuration == null ? Color(0xff8E8E8E) : Colors.black,
                            ),
                          ),
                          Spacer(),
                          Icon(Iconsax.arrow_down_1_copy, color: Color(0xff008080), size: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                widget.onTap?.call(selectedLocation, selectedSaknType, selectDuration);
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
