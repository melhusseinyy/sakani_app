import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sakni/cubits/home_cubit/home_cubit.dart';
import 'package:sakni/helper/extention.dart';
import 'package:sakni/models/home_model/unit_model.dart';
import 'package:sakni/views/sakn_details.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.unit, this.onFavoriteToggle});
  final UnitModel unit;
  final VoidCallback? onFavoriteToggle;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late bool isFavorited;
  @override
  void initState() {
    super.initState();
    isFavorited = widget.unit.isFavorited ?? false;
  }

  String getUnitImage(UnitModel unit) {
    if (unit.image != null && unit.image!.isNotEmpty) {
      return unit.image!;
    } else if (unit.images != null && unit.images!.isNotEmpty) {
      final masterImage = unit.images!.firstWhere(
        (img) => img.isMaster == 1,
        orElse: () => unit.images!.first,
      );
      return masterImage.image;
    } else {
      return 'assets/images/Group 44.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SaknDetails(unit: widget.unit,id:widget.unit.id ,);
                },
              ),
            );
          },
          child: Container(
            width: 160.w,
            height: 270.h,
            decoration: BoxDecoration(
              color: Color(0xffE8E8E8),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 4, top: 4, left: 4, bottom: 8).h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    getUnitImage(widget.unit),
                    height: 158.h,
                    width: 155.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/Group 44.png',
                        // height: 157.h,
                        // width: 155.w,
                        fit: BoxFit.fill,
                      );
                    },
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    widget.unit.title ?? '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      2.bw,
                      Padding(
                        padding: const EdgeInsets.only(left: 2).w,
                        child: Icon(
                          Iconsax.location_copy,
                          color: Color(0xff008080),
                          size: 12,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${widget.unit.country ?? ''}, ${widget.unit.city ?? ''}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4).w,
                        child: Icon(
                          Iconsax.wifi_square,
                          color: Color(0xff008080),
                          size: 12,
                        ),
                      ),
                      Icon(
                        Iconsax.weight_1,
                        color: Color(0xff008080),
                        size: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 4).w,
                        child: Icon(
                          Iconsax.tree,
                          color: Color(0xff008080),
                          size: 12,
                        ),
                      ),
                      Icon(Iconsax.coffee, color: Color(0xff008080), size: 12),

                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Icon(
                          Iconsax.dollar_circle_copy,
                          color: Color(0xff008080),
                          size: 12,
                        ),
                      ),
                      Text(
                        widget.unit.priceAfterDiscount ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff008080),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 12.h,
          right: 12.w,
          left: 12.w,
          bottom: 74.h,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited;
                        widget.onFavoriteToggle?.call();
                      });
                    },
                    child: Icon(
                      isFavorited == true ? Iconsax.heart : Iconsax.heart_copy,
                      color: isFavorited == true ? Colors.red : Colors.white,
                      size: 16,
                    ),
                  ),

                  Container(
                    height: 16.h,
                    width: 36,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.unit.rate?.toString() ?? '0.0',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff008080),
                          ),
                        ),
                        Icon(Iconsax.star, color: Color(0xffEDA145), size: 8),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                widget.unit.code ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
