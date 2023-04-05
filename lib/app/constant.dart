import 'package:flutter/material.dart';

import '../presentation/resources/image_assets.dart';

class Constant{
  static const String baseUrl = "http://snaggingmasters.ae/api/";
  static const String loginUrl = 'http://snaggingmasters.ae/login-mobile';
  static const String bookingUrl = 'http://snaggingmasters.ae/book-mobile';
  static const String token = "send token here";
  static const int timeOut = 60000;
  static const String empty = "Empty";
  static const List<Map<String,dynamic>> homeList = [
    {
      'alignment': Alignment(-1, -1),
      'image':ImageAssets.gradient1Image
    },
    {
      'alignment': Alignment(1, -1),
      'image':ImageAssets.gradient2Image
    },
    {
      'alignment': Alignment(1, 1),
      'image':ImageAssets.gradient3Image
    },
    {
      'alignment': Alignment(-1, 0),
      'image':ImageAssets.gradient4Image
    },
  ];

}