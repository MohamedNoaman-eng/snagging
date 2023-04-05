import 'package:dio/dio.dart';


import '../../app/constant.dart';
const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
class DioHelper{
  static final DioHelper _dioHelper = DioHelper._internal();

  factory DioHelper() {
    return _dioHelper;
  }

  DioHelper._internal();

  static Map<String,String> headers = {
    CONTENT_TYPE:APPLICATION_JSON,
    ACCEPT:APPLICATION_JSON,
    AUTHORIZATION:Constant.token,
    DEFAULT_LANGUAGE : "en"

  };
  static Dio? dio;
  static init(){
    dio = Dio(
        BaseOptions(
            headers: headers,
            baseUrl: Constant.baseUrl,
            receiveTimeout: Constant.timeOut,
            sendTimeout: Constant.timeOut
        )
    );
  }

}