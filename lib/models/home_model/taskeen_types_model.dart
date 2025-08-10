class TaskeenTypesModel {
  int? id;
  String? title;

  TaskeenTypesModel({this.id, this.title});

  factory TaskeenTypesModel.fromJson(Map<String, dynamic> json) {
    return TaskeenTypesModel(id: json['id'], title: json['title']);
  }
}
