import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/bloc/webview/webview_booking.dart';
import 'package:snagging/bloc/webview/webview_login.dart';
import 'package:snagging/network/remote/dio_helper.dart';

import 'app/app.dart';
import 'bloc/blocObservable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl : true // option: set to false to disable working with http links (default: false)
  );
  Bloc.observer = const AppBlocObserver();
  DioHelper.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomePageCubit>(
        create: (BuildContext context) => HomePageCubit(),
      ),

      BlocProvider<WebViewLoginCubit>(
        create: (BuildContext context) => WebViewLoginCubit(),
      ),
      BlocProvider<WebViewBookingCubit>(
        create: (BuildContext context) => WebViewBookingCubit(),
      ),
    ],
    child: MyApp(),
  ));
}


