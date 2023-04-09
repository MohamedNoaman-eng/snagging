import 'package:flutter/material.dart';

class BuildErrorMessage extends StatelessWidget {
  BuildErrorMessage({Key? key,required this.message}) : super(key: key);
  String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text(message),),
    );
  }
}
