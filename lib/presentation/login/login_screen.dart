
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snagging/app/constant.dart';
import 'package:snagging/bloc/webview/webview_login.dart';
import 'package:snagging/bloc/webview/webview_state.dart';
import 'package:snagging/presentation/widgets/build_app_bar.dart';

import 'package:snagging/presentation/widgets/webview.dart';

import 'package:webview_flutter/webview_flutter.dart';




class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late WebViewController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    context.read<WebViewLoginCubit>().checkInternetConnection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: BuildAppBar(title: "Log In",),
        body:BlocConsumer<WebViewLoginCubit,WebViewCubitStates>(
          builder: (context,state){
            if(state is CheckInternetLoginErrorState){
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(child: Text("No Internet Connection!"),),
              );
            }else {
              return WebViewScreen2(url: Constant.loginUrl, title: "Login");
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
