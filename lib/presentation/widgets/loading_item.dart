import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/colors_managers.dart';

class BuildLoadingWidget extends StatelessWidget {
  const BuildLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(0.2),
          child: SpinKitDualRing(
            color: ColorManager.navColor,
            duration: Duration(seconds: 1),
            size: 70,
          ),
        ));
  }
}
