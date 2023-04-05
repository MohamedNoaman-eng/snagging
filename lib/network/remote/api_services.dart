import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:snagging/network/remote/dio_helper.dart';

import '../../presentation/widgets/alertDialog.dart';
import '../network_info.dart';

class ApiService {
  final NetworkInfo _networkInfo;

  ApiService(this._networkInfo);

  Future<Response?> getDate(
      {required String endPoint, required BuildContext context}) async {
    final Response response;

    if (await _networkInfo.isConnect) {
      try {
        response = await DioHelper.dio!.get(endPoint);
        if (response.statusCode != 200) {
          throw HttpException(response.statusCode.toString());
        }
        return response;
      } catch (e) {
        log("exception error $e}");
      }
    } else {
      showAwesomeDialog(context);
    }
    return null;
  }
}
