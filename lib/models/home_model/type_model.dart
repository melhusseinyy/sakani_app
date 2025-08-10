class TypeModel {
  final int? id;
  final String? title;
  final String? image;

  TypeModel({ this.id,  this.title, this.image});
  factory TypeModel.fromJson(Map<String, dynamic> jsondata) {
    return TypeModel(
      id: jsondata['id']??0,
      title: jsondata['title']??'',
      image: jsondata['image']??''
    );
  }
  
}
