
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snagging/app/constant.dart';
import 'package:snagging/bloc/webview/webview_login.dart';
import 'package:snagging/bloc/webview/webview_state.dart';
import 'package:snagging/presentation/resources/string_manager.dart';
import 'package:snagging/presentation/widgets/build_app_bar.dart';
import 'package:snagging/presentation/widgets/customErrorMessage.dart';


import 'package:snagging/presentation/widgets/webview.dart';






class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    context.read<WebViewLoginCubit>().checkInternetConnection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BuildAppBar(title: "Log In",),
        body:BlocConsumer<WebViewLoginCubit,WebViewCubitStates>(
          builder: (context,state){
            if(state is CheckInternetLoginErrorState){
              return BuildErrorMessage(message: AppString.internetConnection,);
            }else {
              return WebViewWidget(url: Constant.loginUrl);
            }
          },
          listener: (context,state){

          },
        )
      ),
    );
  }
}
