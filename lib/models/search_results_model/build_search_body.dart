import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sakni/models/search_results_model/search_body_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BuildSearchBodyy {
  SfRangeValues priceRange = SfRangeValues(0.0, 150000.0);
  final bool selectedIndex = false;
  List<String> selectHouseTyping = [];
  List<String> selectLocation = [];
  List<String> selectAdvantages = [];
  double? selectedRating;
  int roomCount = 0;
  int bedCount = 0;
  int? selectedCityId;
  int? selectedDurationId;
  int? selectedSaknTypeId;
  int? selectedTypeId;

  setTypeId(int typeId) {
    selectedTypeId = typeId;
  }
  SearchBodyModel buildSearchBody() {
    // حوّل selectHouseTyping ل IDs
    List<int> taskeenTypeIds = [];
    if (selectHouseTyping.contains('سرير')) taskeenTypeIds.add(1);
    if (selectHouseTyping.contains('غرفة')) taskeenTypeIds.add(2);
    if (selectHouseTyping.contains('شقة')) taskeenTypeIds.add(3);
    if (selectHouseTyping.contains('الكل')) taskeenTypeIds.add(4);
   
    // حوّل المميزات selectedAdvantages ل IDs
    List<int> facilityIds = [];
    if (selectAdvantages.contains('واي فاي')) facilityIds.add(1);
    if (selectAdvantages.contains('مساحة خضراء')) facilityIds.add(2);
    if (selectAdvantages.contains('قريبه من الجيم')) facilityIds.add(3);
    if (selectAdvantages.contains('بها حمام خاص')) facilityIds.add(4);
    if (selectAdvantages.contains('ماكينة قهوه')) facilityIds.add(5);
    if (selectAdvantages.contains('قريبه من الخدمات')) facilityIds.add(6);
    if (selectAdvantages.contains('اجهزة كهربائية')) facilityIds.add(7);
    if (selectAdvantages.contains('غاز طبيعي')) facilityIds.add(8);
    if (selectAdvantages.contains('الكل')) facilityIds.add(9);

    

    SearchBodyModel body = SearchBodyModel(
      1,
      null, // lat
      null, // long
      selectedDurationId,
      selectedSaknTypeId,
      selectedCityId,
      selectedTypeId,
      null, // address (مش مطلوب الآن)
      bedCount,
      roomCount,
      selectedRating?.round() ?? 0,
      priceRange.start,
      priceRange.end,
      taskeenTypeIds,
      facilityIds,
    );
    print("mkjnhbgvfdxcfvgbhnjmkl ${body.toJson()}");
    return body;
  }
}
