// import 'package:dio/dio.dart';
//
//
// class ErrorHandler implements Exception {
//
//
//   ErrorHandler.handel(dynamic error) {
//     if (error is DioError) {
//       // dio error its an error from response of api
//        _handelError(error);
//     } else {
//       // default error
//       DataSources.DEFAULT.getFailure();
//     }
//   }
// }
//
//  _handelError(DioError error) {
//   switch (error.type) {
//     case DioErrorType.connectTimeout:
//       return DataSources.CONNECT_TIMEOUT.getFailure();
//     case DioErrorType.sendTimeout:
//       return DataSources.SEND_TIMEOUT.getFailure();
//     case DioErrorType.receiveTimeout:
//       return DataSources.RECIEVE_TIMEOUT.getFailure();
//     case DioErrorType.response:
//       if(error.response?.statusCode !=null&& error.response !=null&&error.response?.statusMessage !=null){
//         return error.response?.statusCode??0;
//       }else{
//         return DataSources.DEFAULT.getFailure();
//       }
//
//     case DioErrorType.cancel:
//       return DataSources.CANCEL.getFailure();
//     case DioErrorType.other:
//       return DataSources.DEFAULT.getFailure();
//   }
// }
//
// enum DataSources {
//   SUCCESS,
//   NO_CONTENT,
//   BAD_REQUEST,
//   FORBIDDEN,
//   UNAUTHORISED,
//   NOT_FOUND,
//   INTERNAL_SERVER_ERROR,
//   CONNECT_TIMEOUT,
//   CANCEL,
//   RECIEVE_TIMEOUT,
//   SEND_TIMEOUT,
//   CACHE_ERROR,
//   NO_INTERNET_CONNECTION,
//   DEFAULT
// }
//
// extension DataSourceExtension on DataSources {
//   Failure getFailure() {
//     switch (this) {
//       case DataSources.SUCCESS:
//         return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
//       case DataSources.NO_CONTENT:
//         return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
//       case DataSources.BAD_REQUEST:
//         return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
//       case DataSources.FORBIDDEN:
//         return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
//       case DataSources.UNAUTHORISED:
//         return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
//       case DataSources.NOT_FOUND:
//         return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
//       case DataSources.INTERNAL_SERVER_ERROR:
//         return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
//             ResponseMessage.INTERNAL_SERVER_ERROR);
//       case DataSources.CONNECT_TIMEOUT:
//         return Failure(
//             ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
//       case DataSources.CANCEL:
//         return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
//       case DataSources.RECIEVE_TIMEOUT:
//         return Failure(
//             ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
//       case DataSources.SEND_TIMEOUT:
//         return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
//       case DataSources.CACHE_ERROR:
//         return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
//       case DataSources.NO_INTERNET_CONNECTION:
//         return Failure(ResponseCode.NO_INTERNET_CONNECTION,
//             ResponseMessage.NO_INTERNET_CONNECTION);
//       case DataSources.DEFAULT:
//         return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
//     }
//   }
// }
//
// class ResponseCode {
//   static const int SUCCESS = 200;
//   static const int NO_CONTENT = 201;
//   static const int BAD_REQUEST = 400;
//   static const int FORBIDDEN = 403;
//   static const int UNAUTHORISED = 401;
//   static const int NOT_FOUND = 404;
//   static const int INTERNAL_SERVER_ERROR = 500;
//   static const int CONNECT_TIMEOUT = -1;
//   static const int CANCEL = -2;
//   static const int RECIEVE_TIMEOUT = -3;
//   static const int SEND_TIMEOUT = -4;
//   static const int CACHE_ERROR = -5;
//   static const int NO_INTERNET_CONNECTION = -6;
//   static const int DEFAULT = -7;
// }
//
// class ResponseMessage {
//   static const String SUCCESS = "success";
//   static const String NO_CONTENT = "success";
//   static const String BAD_REQUEST = "Bad request, try again later";
//   static const String FORBIDDEN = "Forbidden request,  try again later";
//   static const String UNAUTHORISED = "User is unauthorized, try again later";
//   static const String NOT_FOUND = "Not found, try again later";
//   static const String INTERNAL_SERVER_ERROR =
//       "Some thing went wrong, try again later";
//   static const String CONNECT_TIMEOUT = "Time out error, try again later";
//   static const String CANCEL = "Request was cancelled, try again later";
//   static const String RECIEVE_TIMEOUT = "Time out error, try again later";
//   static const String SEND_TIMEOUT = "Time out error, try again later";
//   static const String CACHE_ERROR = "Cache error, try again later";
//   static const String NO_INTERNET_CONNECTION =
//       "Please check your internet connection";
//   static const String DEFAULT = "Some thing went wrong, try again later";
// }
// class ApiStatus{
//   static const int SUCCESS = 0;
//   static const int FAILURE = -1;
// }
