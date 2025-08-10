class UnitModel {
  final int? id;
  final String? title;
  final String? priceAfterDiscount;
  final String? priceBeforeDiscount;
  final String? pricePercentage;
  final String? country;
  final String? city;
  final String? address;
  final String? code;
  final int? rate;
  final int? availablity;
  final int? status;
  final int? bedCount;
  final int? roomCount;
  final int? bathroomCount;
  final String? publisher;
  final List<ImagesModel>? images;
  final String? image;
  final List<FacilityModel>? facility;
  final List<FurnitureModel>? furniture;
  final bool? isFavorited;

  UnitModel({
    this.isFavorited,
    this.id,
    this.title,
    this.priceAfterDiscount,
    this.priceBeforeDiscount,
    this.pricePercentage,
    this.country,
    this.city,
    this.address,
    this.code,
    this.rate,
    this.availablity,
    this.status,
    this.bedCount,
    this.roomCount,
    this.bathroomCount,
    this.publisher,
    this.images,
    this.image,
    this.facility,
    this.furniture,
  });
  factory UnitModel.fromJson(Map<String, dynamic> jsondata) {
    return UnitModel(
      id: jsondata['id'] ?? 0,
        title: jsondata['title'] ?? "",
        priceAfterDiscount: jsondata['price_after_discount'] ?? '',
        priceBeforeDiscount: jsondata['price_before_discount'] ?? '',
        pricePercentage: jsondata['price_percentage'] ?? '',
        country: jsondata['country'] ?? '',
        city: jsondata['city'] ?? '',
        address: jsondata['address'] ?? '',
        code: jsondata['code'] ?? '',
        rate: int.parse(jsondata['rate'].toString()),
        availablity: jsondata['availablity'] ?? 0,
        status: jsondata['status'] ?? 0,
       bedCount: int.tryParse(jsondata['bed_count'].toString()) ?? 0,

        roomCount: int.tryParse(jsondata['room_count'].toString()) ?? 0,
        bathroomCount: int.tryParse(jsondata['bathroom_count'].toString()) ?? 0,
        publisher: jsondata['publisher'] ?? "",
      
        images:
            jsondata['images'] != null
                ? (jsondata['images'] as List)
                    .map((e) => ImagesModel.fromJson(e))
                    .toList()
                : [],
      image: jsondata['image'] ?? '',
      
      facility: jsondata['facility'] != null
          ? (jsondata['facility'] as List)
              .map((e) => FacilityModel.fromJson(e))
              .toList()
          : [],
     
      furniture: jsondata['furniture'] != null
          ? (jsondata['furniture'] as List)
              .map((e) => FurnitureModel.fromJson(e))
              .toList()
          : [],
      isFavorited: jsondata['is_favorited'] ?? false,
    );
  }
}

class ImagesModel {
  final int id;
  final String image;
  final int isMaster;

  ImagesModel({required this.id, required this.image, required this.isMaster});
  factory ImagesModel.fromJson(Map<String, dynamic> jsondata) {
    return ImagesModel(
      id: jsondata['id'] ?? 0,
      image: jsondata['image'] ?? '',
      isMaster: jsondata['is_master'] ?? 0,
    );
  }
}

class FacilityModel {
  final int? id;
  final String? title;
  final String? image;

  FacilityModel({ this.id, this.title,  this.image});
  factory FacilityModel.fromJson(Map<String, dynamic> jsondata) {
    return FacilityModel(
      id: jsondata['id'] ?? 0,
      title: jsondata['title'] ?? '',
      image: jsondata['image'] ?? '',
    );
  }
}

class FurnitureModel {
  final int id;
  final String title;
  final String image;
  final int count;

  FurnitureModel({
    required this.id,
    required this.title,
    required this.image,
    required this.count,
  });
  factory FurnitureModel.fromJson(Map<String, dynamic> jsondata) {
    return FurnitureModel(
      id: jsondata['id'],
      title: jsondata['title'],
      image: jsondata['image'],
      count: jsondata['count'],
    );
  }
}
