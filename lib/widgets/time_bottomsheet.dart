import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';
import 'package:sakni/models/home_model/taskken_periods_model.dart';
import 'package:sakni/widgets/container_for_dotted_border.dart';

class TimeBottomsheet extends StatefulWidget {
  final void Function(TaskeenPeriodsModel) onDurationSelected;

  const TimeBottomsheet({super.key, required this.onDurationSelected});

  @override
  State<TimeBottomsheet> createState() => _TimeBottomsheetState();
}

class _TimeBottomsheetState extends State<TimeBottomsheet> {
  DateTime? fromDate;
  DateTime? toDate;

  void showPicker(bool isFrom) {
    BottomPicker.date(
      pickerTitle: isFrom ? Text("اختر التاريخ من") : Text("اختر التاريخ الي"),

      initialDateTime: DateTime.now(),
      buttonContent: Text("تم"),

      onSubmit: (date) {
        setState(() {
          if (isFrom) {
            fromDate = date;
          } else {
            toDate = date;
          }
        });
      },
      dismissable: true,
    ).show(context);
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchTaskeenPeriods();
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is TaskeenPeriodsLoading) {
              return const Center(child: CircularProgressIndicator());    
            }else if(state is HomeFailure)  {
              return Center(child: Text(state.errMessage));
            }
            
            else if (state is taskeenPeriodsSuccess) {
              final periods=state.taskeenPeriods;
             return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // باقي الواجهة
      ListView.separated(
        shrinkWrap: true,
        itemCount: periods.length,
        itemBuilder: (context, index) {
          final item = periods[index];
          return GestureDetector(
            onTap: () {
              widget.onDurationSelected(item);
              Navigator.pop(context,item);
            },
            child: Row(
              children: [
                Icon(Iconsax.calendar_tick_copy, color: Color(0xff008080), size: 16),
                SizedBox(width: 10),
                Text(
                  item.title??'',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff008080),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Color(0xffD2D2D2)),
      ),
      SizedBox(height: 16.h),
    ],
  );
            } else {
            return const Center(child: Text('لا توجد بيانات حالياً'));
          }
            
          },
        ),
      ),
    );
  }
}
