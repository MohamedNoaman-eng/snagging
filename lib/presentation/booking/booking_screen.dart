

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snagging/app/constant.dart';
import 'package:snagging/bloc/webview/webview_booking.dart';

import 'package:snagging/presentation/widgets/loading_item.dart';
import 'package:snagging/presentation/widgets/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../../bloc/webview/webview_state.dart';
import '../widgets/alertDialog.dart';
import '../widgets/build_app_bar.dart';


class BookingScreen extends StatefulWidget {

  BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  // WebViewController controller = WebViewController()
  late WebViewController controller;

  @override
  void initState() {
    context.read<WebViewBookingCubit>().checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc  = context.read<WebViewBookingCubit>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          appBar: BuildAppBar(title: "Booking"),
          body:BlocConsumer<WebViewBookingCubit,WebViewCubitStates>(

            builder: (context,state) {
              if (state is CheckInternetBookingErrorState) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text("No Internet Connection!"),),
                );
              } else {
                return WebViewScreen2(url: Constant.bookingUrl, title: "");
              }
            },
            listener: (context,state){

            },
          )
        //TODO internet permission ios
      ),
    );
  }
}
