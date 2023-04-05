import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:snagging/bloc/webview/webview_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../network/network_info.dart';

class WebViewLoginCubit extends Cubit<WebViewCubitStates>{
  WebViewLoginCubit(): super(InitialWebViewState());
  double  webProgress = 0;

  final Completer<WebViewController> controller =
  Completer<WebViewController>();
  void changeProgress(progress){
    emit(InitialWebViewState());
    webProgress = progress/100;
    emit(ChangeProgressWebViewState());
  }
  void checkInternetConnection() async{
    emit(CheckInternetLoginLoadingState());
    if(await NetworkInfoImp(InternetConnectionChecker()).isConnect){
      emit(CheckInternetLoginSuccessfullyState());
    }else {
      emit(CheckInternetLoginErrorState());
    }
  }
  void dispose(){

  }
}