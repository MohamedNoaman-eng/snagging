import 'package:flutter/material.dart';

import '../resources/colors_managers.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_managers.dart';
import 'package:lottie/lottie.dart';
Widget getAnimatedImage(imageName) {
  return SizedBox(
    height: 150,
    width: 150,
    child: Lottie.asset(imageName),
  );
}
Widget getColumn(List<Widget> children) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
  );
}
Widget getMessage(String message) {
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p8),
    child: Text(
      message,
      style: getRegularStyle(color: Colors.black, fontSize: FontSize.s18),
    ),
  );
}

Widget getRetryButton(String title,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p18),
    child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: () {
          // if(stateRenderType == StateRenderType.fullScreenErrorState){
          //   retryActionFunction.call();
          // }else{
          //   Navigator.of(context).pop();
          // }
        }, child: Text(title))),
  );
}
Widget getPopupDialog(BuildContext context,List<Widget> children){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s14),
    ),
    elevation: AppSize.s1_5,
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26

            )
          ]
      ),
      child: _getDialogContent(context,children),
    ),
  );
}
Widget _getDialogContent(BuildContext context, List<Widget> children ){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
  );
}
