import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:snagging/bloc/home/home_cubit.dart';



showAwesomeDialog(BuildContext context){

  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    borderSide: const BorderSide(
      color: Colors.black,
      width: 0.5,
    ),
    width: MediaQuery.of(context).size.width *0.9,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: false,
    onDismissCallback: (type) {

    },
    headerAnimationLoop: true,
    animType: AnimType.bottomSlide,
    title: 'Connection Error',
    desc: "No internet connection, press ok to \ntry again.",
    showCloseIcon: true,
    btnCancelOnPress: () {
      exit(0);
    },
    btnOkOnPress: () {
      context.read<HomePageCubit>().getServices(context);
      //Navigator.of(context).pop();

    },
  ).show();
}
 showAlertDialog({required String message, required String icon, required BuildContext context}) {



  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    content: SizedBox(
      width: MediaQuery.of(context).size.width *0.8,
      height: MediaQuery.of(context).size.height*0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
              height: MediaQuery.of(context).size.height*0.1,
              child: Lottie.asset(icon)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message,style: Theme.of(context).textTheme.titleMedium,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.deepOrange,

                ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(onPressed: (){
                    Navigator.pop(context,true);                    // context.read<HomePageCubit>().getServices(context);
                    context.read<HomePageCubit>().getServices(context);
                  }, child: Text("Try Again",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),))),
              Container(
                  width: MediaQuery.of(context).size.width *0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,


                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextButton(onPressed: (){
                    Navigator.pop(context,true);
                  }, child: Text("Cancel",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red),))),
            ],
          )
        ],
      ),
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  });
  // show the dialog

}