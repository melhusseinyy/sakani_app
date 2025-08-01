import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:sakni/core/api/api_consumer.dart';
import 'package:sakni/core/api/api_interceptor.dart';
import 'package:sakni/core/api/end_point.dart';
import 'package:sakni/core/errors/exceptions.dart';

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
  
  Future delete(String path, {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false}) async{
      final dio = Dio(
        BaseOptions(
          
          receiveDataWhenStatusError: true,
        ),
      );

      // تخطي فحص SSL - فقط أثناء التطوير
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };

   try {
  final response=await dio.delete(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
   return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
   
  }

  

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters,})async {
     final dio = Dio(
        BaseOptions(
          
          receiveDataWhenStatusError: true,
        ),
      );

      // تخطي فحص SSL - فقط أثناء التطوير
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
   try {
  final response =await dio.get(path,data: data,queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }

  @override
   Future patch(String path, {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false})async {
     final dio = Dio(
        BaseOptions(
          
          receiveDataWhenStatusError: true,
        ),
      );

      // تخطي فحص SSL - فقط أثناء التطوير
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
   try {
  final response =await dio.patch(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }

  @override
  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters,bool isFormData=false})async {
    //  final dio = Dio(
    //     BaseOptions(
          
    //       receiveDataWhenStatusError: true,
    //     ),
    //   );

final dio =DioConsumer(dio:Dio()).dio;
      // تخطي فحص SSL - فقط أثناء التطوير
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
   try {
        print("dio podt body=> $data");
        print("dio podt body=> ${dio.options.baseUrl}");

  // final response =await dio.post(path,data:{},queryParameters: queryParameters);
  final response =await dio.post(path,data:isFormData?FormData.fromMap(data!): data!,queryParameters: queryParameters);
        print("dio podt body=> $data");
        print("dio podt response=> $response");

  return response.data;
} on DioException catch (e) {
  handleDioException(e);
}
  }
 



}