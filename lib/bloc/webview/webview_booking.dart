

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:snagging/bloc/webview/webview_state.dart';


import '../../network/network_info.dart';

class WebViewBookingCubit extends Cubit<WebViewCubitStates>{
  WebViewBookingCubit(): super(InitialWebViewState());
  double  webProgress = 0;


  void changeProgress(progress){
    emit(InitialWebViewState());
    webProgress = progress/100;
    emit(ChangeProgressWebViewState());
  }
  void checkInternetConnection() async{
    emit(CheckInternetBookingLoadingState());
    if(await NetworkInfoImp(InternetConnectionChecker()).isConnect){
      emit(CheckInternetBookingSuccessfullyState());
    }else {
      emit(CheckInternetBookingErrorState());
    }
  }
  void dispose(){

  }
}