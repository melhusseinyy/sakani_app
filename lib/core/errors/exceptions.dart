import 'package:dio/dio.dart';
import 'package:sakni/core/errors/error_model.dart';

class ServerException implements Exception {
final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioException(DioException e) {
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
       throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
         throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
    
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
      case DioExceptionType.unknown:
        // TODO: Handle this case.
         throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
            case DioExceptionType.badResponse:
        // TODO: Handle this case.
       switch(e.response?.statusCode){
        case 400:  //bad request
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
        case 401:  //unauthorized
        throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
         case 403:  //forbidden
         throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
          case 404:  //not found
          throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
           case 409:  //cofficient
           throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
            case 422:  //unprocessable entity
            throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
             case 504:  //server exception
             throw ServerException(errModel:ErrorModel.fromjson(e.response!.data));
       }
  }}