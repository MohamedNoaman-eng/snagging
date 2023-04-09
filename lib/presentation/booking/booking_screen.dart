

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/app/constant.dart';
import 'package:snagging/bloc/webview/webview_booking.dart';
import 'package:snagging/presentation/resources/string_manager.dart';
import 'package:snagging/presentation/widgets/customErrorMessage.dart';
import 'package:snagging/presentation/widgets/webview.dart';

import '../../bloc/webview/webview_state.dart';
import '../widgets/build_app_bar.dart';


class BookingScreen extends StatefulWidget {

  BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {




  @override
  void initState() {
    context.read<WebViewBookingCubit>().checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
          appBar: BuildAppBar(title: "Booking"),
          body:BlocConsumer<WebViewBookingCubit,WebViewCubitStates>(
            builder: (context,state) {
              if (state is CheckInternetBookingErrorState) {
                return BuildErrorMessage(message: AppString.internetConnection,);
              } else {
                return WebViewWidget(url: Constant.bookingUrl);
              }
            },
            listener: (context,state){

            },
          )
      ),
    );
  }
}
