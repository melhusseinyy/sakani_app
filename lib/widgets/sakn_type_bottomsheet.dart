import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakni/helper/extention.dart';
class SaknTypeBottomsheet extends StatelessWidget {
  const SaknTypeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is TaskeenTypesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is taskeenTypesSuccess) {
            final taskeenTypes = state.taskeenTypes;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // العنوان
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Iconsax.close_square_copy,
                        color: Color(0xffC03744),
                        size: 16,
                      ),
                    ),
                    SizedBox(width: 119.w),
                    const Icon(
                      Iconsax.house_2_copy,
                      color: Color(0xff008080),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'السكن',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff008080),
                      ),
                    ),
                  ],
                ),
                8.bh,

                // العنوان الفرعي
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'اختر نوع السكن',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff008080),
                      ),
                    ),
                  ],
                ),
                12.bh,

                // قائمة أنواع السكن
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: taskeenTypes.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final type = taskeenTypes[index];

                    return ListTile(
                      title: Text(
                        type.title??'',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff000000),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context, type); // نرجّع النوع المختار
                      },
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(child: Text('لا توجد بيانات حالياً'));
          }
        },
      ),
    );
  }
}
