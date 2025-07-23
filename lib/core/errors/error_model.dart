class ErrorModel {
  final String status;
  final String message;

  ErrorModel({required this.status, required this.message});

  factory ErrorModel.fromjson(Map<String, dynamic>? jsondata) {
    return ErrorModel(
      status: jsondata?['status']?.toString() ?? 'error',
      message: jsondata?['message']?.toString() ?? 'حدث خطأ في الاتصال',
    );
  }
}
