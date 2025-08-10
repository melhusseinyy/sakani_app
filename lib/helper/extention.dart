import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  SizedBox get bh => SizedBox(height: toDouble().h);
  SizedBox get bw => SizedBox(width: toDouble().w);
  SizedBox get squareBox => SizedBox(width: toDouble().w, height: toDouble().h);
}