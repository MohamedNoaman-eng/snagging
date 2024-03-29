
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



import '../app/constant.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
class DioFactory{



  Future<Dio> getDio() async{
    Dio dio = Dio();

    Map<String,String> headers = {
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      AUTHORIZATION:Constant.token,
      DEFAULT_LANGUAGE : "en"

    };
    dio.options = BaseOptions(
      headers: headers,
      baseUrl: Constant.baseUrl,
      receiveTimeout: Constant.timeOut,
      sendTimeout: Constant.timeOut
    );
    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));
    }
    return dio;
  }
}