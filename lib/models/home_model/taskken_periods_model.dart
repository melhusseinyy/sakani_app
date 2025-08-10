class TaskeenPeriodsModel {
  final int? id;
  final String? title;

  TaskeenPeriodsModel(this.id, this.title);
  factory TaskeenPeriodsModel.fromJson(Map<String, dynamic> json) {
    return TaskeenPeriodsModel(json['id'], json['title']);
  }
}