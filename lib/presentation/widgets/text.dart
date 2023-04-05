import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class BuildFittedText extends StatelessWidget {
  BuildFittedText({required this.text,required this.textStyle, this.maxLines = 4,this.textAlign = TextAlign.left});
  String text;
  TextStyle textStyle;
  int maxLines ;
  TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: textAlign,

    );
  }
}
