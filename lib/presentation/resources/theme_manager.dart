
import 'package:flutter/material.dart';
import 'style_manager.dart';
import 'values_managers.dart';

import 'colors_managers.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    fontFamily: FontConstants.fontFamily,
    // main colors
      primaryColor: ColorManager.primary,
      //primaryColorLight: ColorManager.lightPrimary,
      //primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,

      splashColor: ColorManager.lightPrimary,
    // cardview theme
      cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: 0,
        //shadowColor: Colors.grey,
        titleTextStyle:
        getRegularStyle(fontSize: FontSize.s22, color: ColorManager.white).copyWith(fontWeight: FontWeight.w600)),

      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s17),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),



    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.lightPrimary,
        splashColor: ColorManager.lightPrimary),
    // text theme
    textTheme: TextTheme(
        displayLarge: getLightStyle(color: ColorManager.white, fontSize: FontSize.s22),
        headlineLarge: getSemiBoldStyle(
            color: Colors.black, fontSize: FontSize.s17),
        titleMedium: getMediumStyle(
            color: Colors.black, fontSize: FontSize.s16),
        titleSmall: getSmallStyle(
            color: Colors.black),
        bodyLarge: getRegularStyle(color: ColorManager.black),
        bodyMedium: getBodyMedium(color: ColorManager.black),
        bodySmall: getRegularStyle(color: ColorManager.black)),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
        getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.lightPrimary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.lightPrimary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // input decoration theme (text form field)

  );
}