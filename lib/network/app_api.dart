import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../app/constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServicesClient{
  factory AppServicesClient(Dio dio,{String baseUrl})= _AppServicesClient;

  @POST("/customer/login")
  Future login(
      @Field("email") String email, @Field("password") String password
      );

}