import 'package:sakni/models/Auth_model/user_model.dart';
import 'package:sakni/models/home_model/taskeen_types_model.dart';
import 'package:sakni/models/home_model/taskken_periods_model.dart';
import 'package:sakni/models/home_model/type_model.dart';
import 'package:sakni/models/home_model/unit_model.dart';


class UnitDetailsModel {
  final int? id;
 
  final String? title;
  final String? description;
  final String? discountPercentage;
  final String? priceBeforeDiscount;
  final String? priceAfterDiscount;
  final CountryModel? country;
  final CityModel? city;
  final String? address;
  final String? ownerPhone;
  final String? lat;
  final String? lng;
  final String? code;
  final String? area;
  final String? rate;
  final int? availability;
  final int? status;
  final int? bedCount;
  final int? roomCount;
  final int? bathroomCount;
  final String? publisher;
  final String? image;
  final List<ImageModel>? images;
  final List<FacilityModel>? facility;
  final List<MarkModel>? marks;
  final TaskeenPeriodsModel? period;
  final List<FurnitureModel>? furnitures;
  final bool? isFavorited;
  final TypeModel? type;
  final TaskeenTypesModel? tasken;
  final List<ReviewModel>? reviews;
  final List<InstructionModel>? instructions;
  final String? createdAt;

  UnitDetailsModel( {
    
     this.id,
     this.title,
     this.description,
     this.discountPercentage,
     this.priceBeforeDiscount,
     this.priceAfterDiscount,
     this.country,
     this.city,
     this.address,
     this.ownerPhone,
     this.lat,
     this.lng,
     this.code,
     this.area,
     this.rate,
     this.availability,
     this.status,
     this.bedCount,
     this.roomCount,
     this.bathroomCount,
     this.publisher,
     this.image,
     this.images,
     this.facility,
     this.marks,
     this.period,
     this.furnitures,
     this.isFavorited,
     this.type,
     this.tasken,
     this.reviews,
     this.instructions,
     this.createdAt,
  });

  factory UnitDetailsModel.fromJson(Map<String, dynamic> json) {
    return UnitDetailsModel(
     
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discountPercentage: json['discount_precentage'],
      priceBeforeDiscount: json['price_before_discount'],
      priceAfterDiscount: json['price_after_discount'],
      country: CountryModel.fromJson(json['country']),
      city: CityModel.fromJson(json['city']),
      address: json['address'],
      ownerPhone: json['owner_phone'],
      lat: json['lat'],
      lng: json['lng'],
      code: json['code'],
      area: json['area'],
      rate: json['rate'],
      availability: json['availability'],
      status: json['status'],
      bedCount: json['bed_count'],
      roomCount: json['room_count'],
      bathroomCount: json['bathroom_count'],
      publisher: json['publisher'],
      image: json['image'],
      images: (json['images'] as List).map((e) => ImageModel.fromJson(e)).toList(),
      facility: (json['facility'] as List).map((e) => FacilityModel.fromJson(e)).toList(),
      marks: (json['marks'] as List).map((e) => MarkModel.fromJson(e)).toList(),
      period: TaskeenPeriodsModel.fromJson(json['period']),
      furnitures: (json['furnitures'] as List).map((e) => FurnitureModel.fromJson(e)).toList(),
      isFavorited: json['is_favorited'],
      type: TypeModel.fromJson(json['type']),
      tasken: TaskeenTypesModel.fromJson(json['tasken']),
      reviews: (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList(),
      instructions: (json['instructions'] as List).map((e) => InstructionModel.fromJson(e)).toList(),
      createdAt: json['created_at'],
    );
  }
} 



class CityModel {
  final int? id;
  final String? name; 

  CityModel({this.id, this.name});  
  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

 class ImageModel {
  final int id;
  final String image;
  final int isMaster;

  ImageModel({required this.id, required this.image, required this.isMaster});
  factory ImageModel.fromJson(Map<String, dynamic> jsondata) {
    return ImageModel(
      id: jsondata['id'] ?? 0,
      image: jsondata['image'] ?? '',
      isMaster: jsondata['is_master'] ?? 0,
    );
  }
}

class MarkModel {
  final int? id;
  final String? title;
  final int? isMaster;
  final String? distance;
  final int? measureID;

  MarkModel({this.id, this.title, this.isMaster, this.distance, this.measureID});
  factory MarkModel.fromJson(Map<String, dynamic> json) {
    return MarkModel(
      id: json['id'],
      title: json['title'],
      isMaster: json['is_master'],
      distance: json['distance'],
      measureID: json['measure_id'],
    );
  }
}

class InstructionModel {
  final int? id;
  final String? title;

  InstructionModel({this.id, this.title});
  factory InstructionModel.fromJson(Map<String, dynamic> json) {
    return InstructionModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
  
  class ReviewModel {
  final String? userName;
  final String? reviewText;
  final String? image;
  final String? date;
  final double? rating;

  ReviewModel({
     this.userName,
     this.reviewText,
     this.image,
     this.date,
     this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['user_name'] ?? 'مستخدم',
      reviewText: json['review'] ?? '',
      image: json['image'] ?? 'assets/images/default.png', // ضع صورة افتراضية
      date: json['date']??'',
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
    );
  }
}
