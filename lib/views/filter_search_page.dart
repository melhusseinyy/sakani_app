import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sakni/cubits/Auth_cubit/auth_cubit.dart';
import 'package:sakni/cubits/search_cubit/search_cubit.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/helper/rating_row.dart';
import 'package:sakni/models/search_results_model/build_search_body.dart';
import 'package:sakni/models/search_results_model/search_body_model.dart';
import 'package:sakni/views/search_page.dart';
import 'package:sakni/views/selector_box.dart';
import 'package:sakni/widgets/dot_label_box.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterSearchPage extends StatefulWidget {
  const FilterSearchPage({super.key});

  @override
  State<FilterSearchPage> createState() => _FilterSearchPageState();
}

class _FilterSearchPageState extends State<FilterSearchPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    final body = cubit.body; // ✅ نفس النسخة من الكيوبت

    return Scaffold(
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // if (state is searchsuccess) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) {
          //         return SearchPage(units: state.searchResults);
          //       },
          //     ),
          //   );
          // } else if (state is searchFailure) {
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          // }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 73.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Icon(
                      Iconsax.search_normal_copy,
                      color: Color(0xff008080),
                      size: 16,
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.fetchSearchResult();
                      },

                      child: Text(
                        'البحث',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff008080),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Iconsax.arrow_left_2_copy,
                        color: Color(0xff008080),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Iconsax.close_square_copy,
                                color: Color(0xffC03744),
                                size: 16,
                              ),
                            ),
                            SizedBox(width: 119.w),
                            Icon(
                              Iconsax.setting_3_copy,
                              color: Color(0xff008080),
                              size: 16,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              'فلتر حسب',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Text(
                              'نوع السكن',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'سرير',
                              isSelected: body.selectHouseTyping.contains(
                                'سرير',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectHouseTyping.contains('سرير')) {
                                    body.selectHouseTyping.remove('سرير');
                                  } else {
                                    body.selectHouseTyping.add('سرير');
                                  }
                                  body.selectHouseTyping.remove('الكل');

                                  if (body.selectHouseTyping.contains('سرير') &&
                                      body.selectHouseTyping.contains('غرفة') &&
                                      body.selectHouseTyping.contains('شقة')) {
                                    body.selectHouseTyping
                                      ..remove('سرير')
                                      ..remove('غرفة')
                                      ..remove('شقة')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            10.bw,
                            DottedLabelBox(
                              label: 'غرفة',
                              isSelected: body.selectHouseTyping.contains(
                                'غرفة',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectHouseTyping.contains('غرفة')) {
                                    body.selectHouseTyping.remove('غرفة');
                                  } else {
                                    body.selectHouseTyping.add('غرفة');
                                  }
                                  body.selectHouseTyping.remove('الكل');

                                  if (body.selectHouseTyping.contains('سرير') &&
                                      body.selectHouseTyping.contains('غرفة') &&
                                      body.selectHouseTyping.contains('شقة')) {
                                    body.selectHouseTyping
                                      ..remove('سرير')
                                      ..remove('غرفة')
                                      ..remove('شقة')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            10.bw,
                            DottedLabelBox(
                              label: 'شقة',
                              isSelected: body.selectHouseTyping.contains(
                                'شقة',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectHouseTyping.contains('شقة')) {
                                    body.selectHouseTyping.remove('شقة');
                                  } else {
                                    body.selectHouseTyping.add('شقة');
                                  }
                                  body.selectHouseTyping.remove('الكل');

                                  if (body.selectHouseTyping.contains('سرير') &&
                                      body.selectHouseTyping.contains('غرفة') &&
                                      body.selectHouseTyping.contains('شقة')) {
                                    body.selectHouseTyping
                                      ..remove('سرير')
                                      ..remove('غرفة')
                                      ..remove('شقة')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            10.bw,
                            DottedLabelBox(
                              label: 'الكل',
                              isSelected: body.selectHouseTyping.contains(
                                'الكل',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectHouseTyping.contains('الكل')) {
                                    body.selectHouseTyping.remove('الكل');
                                  } else {
                                    body.selectHouseTyping.add('الكل');
                                  }
                                  body.selectHouseTyping
                                    ..clear()
                                    ..add('الكل');
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Text(
                              'عدد الغرف',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        SelectorBox(
                          initialValue: body.roomCount,
                          onChanged: (value) {
                            setState(() {
                              body.roomCount = value;
                            });
                          },
                        ),

                        16.bh,
                        Row(
                          children: [
                            Text(
                              ' عدد السراير',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        8.bh,
                        SelectorBox(
                          initialValue: body.bedCount,
                          onChanged: (value) {
                            setState(() {
                              body.bedCount = value;
                            });
                          },
                        ),

                        16.bh,
                        // Row(
                        //   children: [
                        //     Text(
                        //       'الموقع',
                        //       style: TextStyle(
                        //         fontSize: 12.sp,
                        //         fontWeight: FontWeight.w600,
                        //         color: Color(0xff008080),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // 8.bh,
                        // Row(
                        //   children: [
                        //     DottedLabelBox(
                        //       label: 'الاقرب',
                        //       isSelected: selectLocation.contains('الاقرب'),
                        //       onTap: () {
                        //         setState(() {
                        //           if (selectLocation.contains('الاقرب')) {
                        //             selectLocation.remove('الاقرب');
                        //           } else {
                        //             selectLocation.add('الاقرب');
                        //           }
                        //           selectLocation.remove('الكل');
                        //         });
                        //       },
                        //     ),
                        //     10.bw,
                        //     DottedLabelBox(
                        //       label: 'الكل',
                        //       isSelected: selectLocation.contains('الكل'),
                        //       onTap: () {
                        //         setState(() {
                        //           if (selectLocation.contains('الكل')) {
                        //             selectLocation.remove('الكل');
                        //           } else {
                        //             selectLocation.add('الكل');
                        //           }
                        //           selectLocation.remove('الاقرب');
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
                        16.bh,
                        Row(
                          children: [
                            Text(
                              'الاسعار',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        8.bh,
                        SfRangeSlider(
                          min: 0.0,
                          max: 200000.0,
                          values: body.priceRange,
                          interval: 5000,
                          showTicks: false,
                          showLabels: false,
                          enableTooltip: false,
                          minorTicksPerInterval: 1,
                          activeColor: Color(0xff008080),
                          numberFormat: NumberFormat.compact(locale: 'en'),

                          onChanged: (SfRangeValues values) {
                            setState(() {
                              body.priceRange = SfRangeValues(
                                values.start.roundToDouble(),
                                values.end.roundToDouble(),
                              );
                            });
                          },
                          tooltipTextFormatterCallback: (
                            actualValue,
                            formattedText,
                          ) {
                            return '$formattedText ج.م';
                          },
                        ),
                        16.bh,
                        Row(
                          children: [
                            Text(
                              'السعر: ${body.priceRange.start.toInt()}  ج.م حتي  ${body.priceRange.end.toInt()}ج.م',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff909DAD),
                              ),
                            ),
                          ],
                        ),
                        16.bh,
                        Row(
                          children: [
                            Text(
                              'المميزات',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        8.bh,
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'واي فاي',
                              isSelected: body.selectAdvantages.contains(
                                'واي فاي',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'واي فاي',
                                  )) {
                                    body.selectAdvantages.remove('واي فاي');
                                  } else {
                                    body.selectAdvantages.add('واي فاي');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            85.bw,
                            DottedLabelBox(
                              label: 'مساحة خضراء',
                              isSelected: body.selectAdvantages.contains(
                                'مساحة خضراء',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'مساحة خضراء',
                                  )) {
                                    body.selectAdvantages.remove('مساحة خضراء');
                                  } else {
                                    body.selectAdvantages.add('مساحة خضراء');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        8.bh,
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'قريبه من الجيم',
                              isSelected: body.selectAdvantages.contains(
                                'قريبه من الجيم',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'قريبه من الجيم',
                                  )) {
                                    body.selectAdvantages.remove(
                                      'قريبه من الجيم',
                                    );
                                  } else {
                                    body.selectAdvantages.add('قريبه من الجيم');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            56.bw,
                            DottedLabelBox(
                              label: 'بها حمام خاص',
                              isSelected: body.selectAdvantages.contains(
                                'بها حمام خاص',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'بها حمام خاص',
                                  )) {
                                    body.selectAdvantages.remove(
                                      'بها حمام خاص',
                                    );
                                  } else {
                                    body.selectAdvantages.add('بها حمام خاص');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        8.bh,
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'ماكينة قهوه',
                              isSelected: body.selectAdvantages.contains(
                                'ماكينة قهوه',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'ماكينة قهوه',
                                  )) {
                                    body.selectAdvantages.remove('ماكينة قهوه');
                                  } else {
                                    body.selectAdvantages.add('ماكينة قهوه');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            65.bw,
                            DottedLabelBox(
                              label: 'قريبه من الخدمات',
                              isSelected: body.selectAdvantages.contains(
                                'قريبه من الخدمات',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'قريبه من الخدمات',
                                  )) {
                                    body.selectAdvantages.remove(
                                      'قريبه من الخدمات',
                                    );
                                  } else {
                                    body.selectAdvantages.add(
                                      'قريبه من الخدمات',
                                    );
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        8.bh,
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'اجهزة كهربائية',
                              isSelected: body.selectAdvantages.contains(
                                'اجهزة كهربائية',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'اجهزة كهربائية',
                                  )) {
                                    body.selectAdvantages.remove(
                                      'اجهزة كهربائية',
                                    );
                                  } else {
                                    body.selectAdvantages.add('اجهزة كهربائية');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                            58.bw,
                            DottedLabelBox(
                              label: 'غاز طبيعي',
                              isSelected: body.selectAdvantages.contains(
                                'غاز طبيعي',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains(
                                    'غاز طبيعي',
                                  )) {
                                    body.selectAdvantages.remove('غاز طبيعي');
                                  } else {
                                    body.selectAdvantages.add('غاز طبيعي');
                                  }
                                  body.selectAdvantages.remove('الكل');

                                  if (body.selectAdvantages.contains(
                                        'واي فاي',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'مساحة خضراء',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الجيم',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'بها حمام خاص',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'ماكينة قهوه',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'قريبه من الخدمات',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'اجهزة كهربائية',
                                      ) &&
                                      body.selectAdvantages.contains(
                                        'غاز طبيعي',
                                      )) {
                                    body.selectAdvantages
                                      ..remove('واي فاي')
                                      ..remove('مساحة خضراء')
                                      ..remove('قريبه من الجيم')
                                      ..remove('بها حمام خاص')
                                      ..remove('ماكينة قهوه')
                                      ..remove('قريبه من الخدمات')
                                      ..remove('اجهزة كهربائية')
                                      ..remove('غاز طبيعي')
                                      ..add('الكل');
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        8.bh,
                        Row(
                          children: [
                            DottedLabelBox(
                              label: 'الكل',
                              isSelected: body.selectAdvantages.contains(
                                'الكل',
                              ),
                              onTap: () {
                                setState(() {
                                  if (body.selectAdvantages.contains('الكل')) {
                                    body.selectAdvantages.remove('الكل');
                                  } else {
                                    body.selectAdvantages.add('الكل');
                                  }

                                  body.selectAdvantages
                                    ..clear()
                                    ..add('الكل');
                                });
                              },
                            ),
                          ],
                        ),
                        14.bh,
                        Row(
                          children: [
                            Text(
                              'تقييمات المُنتجات',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff008080),
                              ),
                            ),
                          ],
                        ),
                        16.bh,
                        ...[5.0, 4.0, 3.0, 2.0, 1.0].map(
                          (rating) => Column(
                            children: [
                              RatingRow(
                                isSelected: body.selectedRating == rating,

                                onTap: () {
                                  setState(() {
                                    if (body.selectedRating == rating) {
                                      body.selectedRating = null;
                                    } else {
                                      body.selectedRating = rating;
                                    }
                                  });
                                },

                                rating: rating,
                              ),
                              20.bh,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
