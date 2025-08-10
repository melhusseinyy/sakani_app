import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';
import 'package:sakni/cubits/search_cubit/search_cubit.dart';
import 'package:sakni/helper/selection_box.dart';
import 'package:sakni/models/home_model/type_model.dart';
import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/views/filter_search_page.dart';
import 'package:sakni/widgets/Horozintal_custom_card.dart';
import 'package:sakni/widgets/vertical_card.dart';
import 'package:sakni/widgets/dotted_border.dart';
import 'package:sakni/widgets/no_results_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    this.duration,
    this.location,
    this.saknType,
    this.selectedType,
    this.units,
  });
  final String? duration;
  final String? location;
  final String? saknType;

  final TypeModel? selectedType;
  final List<UnitModel>? units;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSelected = true;
  bool showFilterOptions = false;
  bool noResults = false;
  TypeModel? selectType;

  String? selectedLocation;
  String? selectedSaknType;
  String? selectedDuration;
  bool isloading = false;

  @override
  void initState() {
    super.initState();

    // هنا بنقرر إذا فيه نتائج ولا لا
    if (widget.duration == null &&
        widget.location == null &&
        widget.saknType == null) {
      noResults = true;
    } else {
      noResults = false;
    }

    // selectType = widget.selectedType ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // log('📥 Received in SearchPage => type: ${selectedType?.title}');
    final units = context.watch<SearchCubit>().searchResult?.units ?? [];
    
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 54.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Iconsax.arrow_right_3_copy,
                        color: Color(0xff008080),
                        size: 16,
                      ),
                    ),
                    SizedBox(width: 119.h),
                    Icon(
                      Iconsax.search_normal_1_copy,
                      color: Color(0xff008080),
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        'البحث',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff008080),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                showFilterOptions
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                final cubit = context.read<HomeCubit>();

                                if (cubit.homeModel == null ||
                                    cubit.homeModel!.types!.isEmpty) {
                                  return const SizedBox(); // أو Pl/ aceholder/Loader
                                }

                                return SelectionBox(
                                  types: cubit.homeModel!.types,
                                  selectedType:selectType ,
                                  onTypeSelected: (type) {
                                    setState(() {
                                      selectType = type;
                                    });
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        DottedBorderr(
                          onTap: (location, saknType, duration) async {
                            setState(() {
                              isloading = true;
                              selectedLocation = location;
                              selectedSaknType = saknType;
                              selectedDuration = duration;
                              showFilterOptions = false;
                            });
                            await Future.delayed(Duration(seconds: 1));
                            setState(() {
                              isloading = false;
                              noResults = false;
                            });
                          },
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            radius: Radius.circular(16),
                            dashPattern: [4, 2],
                            color: Color(0xffA4A4A4),
                          ),
                          child: SizedBox(
                            // width: 251.w,
                            height: 24.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                               if (widget.selectedType != null) ...[
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xff008080),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.selectedType?.title ?? '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(width: 8.w),
                                ],
                                // مثال: شرط لعرض نوع السكن لو متاح
                                if ((selectedSaknType ?? widget.saknType) !=
                                        null &&
                                    (selectedSaknType ?? widget.saknType)!
                                        .isNotEmpty) ...[
                                  Icon(
                                    Iconsax.house_2_copy,
                                    color: Color(0xff008080),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    selectedSaknType ?? widget.saknType!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ],

                                if ((selectedLocation ?? widget.location) !=
                                        null &&
                                    (selectedLocation ?? widget.location)!
                                        .isNotEmpty) ...[
                                  Icon(
                                    Iconsax.location_copy,
                                    color: Color(0xff008080),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    selectedLocation ?? widget.location!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ],

                                if ((selectedDuration ?? widget.duration) !=
                                        null &&
                                    (selectedDuration ?? widget.duration)!
                                        .isNotEmpty) ...[
                                  Icon(
                                    Iconsax.calendar_1_copy,
                                    color: Color(0xff008080),
                                    size: 16,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    selectedDuration ?? widget.duration!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showFilterOptions = true;
                            });
                          },
                          child: Text(
                            'تغير النتائج',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xff008080),
                              decorationThickness: 2,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Color(0xff008080),
                            ),
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: 15.h),
                noResults
                    ? NoResultsSearch()
                    : Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FilterSearchPage();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  'نتائج البحث',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff008080),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3).w,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return FilterSearchPage();
                                          },
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Iconsax.setting_3_copy,
                                      color: Color(0xff008080),
                                      size: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/images/pepicons-print_map.png',
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                      ).w,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected = true;
                                      });
                                    },
                                    child: Icon(
                                      Iconsax.row_horizontal,
                                      color:
                                          isSelected
                                              ? Color(0xff008080)
                                              : Color(0xff8E8E8E),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = false;
                                    });
                                  },
                                  child: Icon(
                                    Iconsax.row_vertical,
                                    color:
                                        !isSelected
                                            ? Color(0xff008080)
                                            : Color(0xff8E8E8E),
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            child:
                                isSelected
                                    ? GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
                                      itemCount: units.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 16,
                                            crossAxisSpacing: 16,
                                            childAspectRatio: 163 / 228,
                                          ),
                                      itemBuilder: (context, index) {
                                        final unit = units[index];
                                        return verticalCard(unit: unit);
                                      },
                                    )
                                    : GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 16.h,
                                      ),
                                      itemCount: units.length,
                                      shrinkWrap: true,

                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1, // عمود واحد
                                            mainAxisSpacing: 16.h,
                                            mainAxisExtent:
                                                170.h, // طول الكارد (اللي انت طلبته)
                                          ),
                                      itemBuilder: (context, index) {
                                        final unit = units[index];
                                        return HorozintalCustomCard(unit: unit);
                                      },
                                    ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ),
        if (isloading)
          Center(child: CircularProgressIndicator(color: Color(0xff008080))),

        Positioned(
          top: 371.h,

          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff0000001a),
                  blurRadius: 13,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.headphone_copy, color: Color(0xff008080)),
                Text(
                  'الدعم',
                  style: TextStyle(
                    color: Color(0xff008080),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
