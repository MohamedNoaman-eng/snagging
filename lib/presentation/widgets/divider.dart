import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  Color color;
  double thickNess;
  BuildDivider(this.color,this.thickNess, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Divider(color: color, thickness: thickNess);
  }
}
