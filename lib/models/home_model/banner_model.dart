class BannerModel {
  final int? id;
  final String? image;
  final String? link;

  BannerModel({ this.id,  this.image,  this.link});

  factory BannerModel.fromjson(Map<String, dynamic> jsondata) {
    return BannerModel(
      id: jsondata['id'],
      image: jsondata['image'],
      link: jsondata['link'],
    );
  }
}
