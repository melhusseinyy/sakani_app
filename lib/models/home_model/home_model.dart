import 'package:sakni/models/home_model/banner_model.dart';
import 'package:sakni/models/home_model/type_model.dart';
import 'package:sakni/models/home_model/unit_model.dart';

class HomeModel {
  final List<UnitModel>? units;
  final List<TypeModel>? types;
  final List<BannerModel>? banners;

  HomeModel({this.units, this.types, this.banners});
  factory HomeModel.fromJson(Map<String, dynamic> jsondata) {
    return HomeModel(
      units:
          (jsondata['units'] as List)
              .map((unit) => UnitModel.fromJson(unit))
              .toList(),
      types:
          (jsondata['types'] as List)
              .map((type) => TypeModel.fromJson(type))
              .toList(),
      banners:
          (jsondata['banners'] as List)
              .map((banner) => BannerModel.fromjson(banner))
              .toList(),
    );
  }
}
