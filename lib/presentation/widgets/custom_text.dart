import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  CustomText({required this.text,required this.textStyle, this.maxLines = 4,this.textAlign = TextAlign.left});
  String text;
  TextStyle textStyle;
  int maxLines ;
  TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign,

    );
  }
}
