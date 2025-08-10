class SearchBodyModel {
  final int? page;
  final int? lat;
  final int? long;
  final int? periodId;
  final int? taskeenTypeId;
  final int? cityId;
  final int? typeId;
  final String? address;
  final int? bedCount;
  final int? roomCount;
  final int? rate;
  final double? priceFrom;
  final double? priceTo;
  final List<int>? taskeenTypeIds;
  final List<int>? facilityIds;

  SearchBodyModel(
    this.page,
    this.lat,
    this.long,
    this.periodId,
    this.taskeenTypeId,
    this.cityId,
    this.typeId,
    this.address,
    this.bedCount,
    this.roomCount,
    this.rate,
    this.priceFrom,
    this.priceTo,
    this.taskeenTypeIds,
    this.facilityIds,
  );

  Map<String, dynamic> toJson() {
    return {"page": 1,
    "lat":lat,
    "long":long,
    "period_id":periodId,
    "taskeen_type_id":taskeenTypeId,
    "city_id":cityId,
    "type_id":typeId,
    "address":address,
    "bed_count":bedCount,
    "room_count":roomCount,
    "rate":rate,
    "price_from":priceFrom,
    "price_to":priceTo,
    "taskeen_type_ids":taskeenTypeIds,
    "facility_ids":facilityIds
    
    };
  }
}
