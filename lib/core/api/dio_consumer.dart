import 'package:dio/dio.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/api_interceptor.dart';
import 'package:sakni/core/api/end_point.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl=EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request:true,
   requestHeader : true,
   requestBody : false,
   responseHeader : true,
   responseBody : false,
   error : true,
    ));

  }
  @override
  Future delete(String path, {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async{
   try {
  final response=await dio.delete(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
   return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
   
  }

  

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters,})async {
   try {
  final response =await dio.get(path,data: data,queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }

  @override
   Future patch(String path, {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false})async {
   try {
  final response =await dio.patch(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }

  @override
  Future post(String path, {dynamic? data, Map<String, dynamic>? queryParameters,bool isFormData=false})async {
   try {
  final response =await dio.post(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }
 



void handleDioException(DioException e) {
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
    
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.unknown:
        // TODO: Handle this case.
        throw UnimplementedError();
            case DioExceptionType.badResponse:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}