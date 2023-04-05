
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:snagging/data/models/package.dart';
import 'package:snagging/network/network_info.dart';
import 'package:snagging/network/remote/api_services.dart';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'dart:developer';

import '../data/models/service_item.dart';
import '../network/remote/api_endpoints.dart';
class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  ApiService _apiService  = ApiService( NetworkInfoImp(InternetConnectionChecker()));

  List<PackageItem> _list = [];

  void getPackages(BuildContext context){
    _list = [];
    //checkInternetConnection();

    _apiService.getDate(endPoint: EndPoints.testimonialsEPoint,context: context).then((value){
      List li = value?.data["testimonials"] as List;
      log("${li.length}");
      // li.forEach((element) {
      //   _list.add(PackageItem.fromMap(element));
      // });
      // log("${_list.length}");

    }).catchError((onError){

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // log('your message here');
          // ApiService(NetworkInfoImp(InternetConnectionChecker())).getDate( endPoint: "/get-packages", context: context).then((value){
          //   log("${value!.data}");
          // }).catchError((onError){
          //   log("${onError}");
          // });

        },
        child:FaIcon(faIconNameMapping['angleDoubleUp']),
      ),
    );
  }

}









