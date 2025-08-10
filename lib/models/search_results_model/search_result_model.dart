import 'package:sakni/models/home_model/unit_model.dart';
class SearchResultModel {
  final List<UnitModel> units;
  final String? type;
  final String? city;
  final String? taskeenType;
  final String? period;

  SearchResultModel({
    required this.units,
    this.type,
    this.city,
    this.taskeenType,
    this.period,
  });

  factory SearchResultModel.fromjson(Map<String, dynamic> json) {
    return SearchResultModel(
      units: (json['units'] as List)
          .map((e) => UnitModel.fromJson(e))
          .toList(),
      type: json['type'],
      city: json['city'],
      taskeenType: json['taskeen_type'],
      period: json['period'],
    );
  }
}
