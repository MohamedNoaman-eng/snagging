import 'package:flutter/material.dart';
import 'package:snagging/presentation/resources/image_assets.dart';
import 'package:snagging/presentation/widgets/text.dart';

import '../resources/colors_managers.dart';
import 'custom_text.dart';


class BuildSliderWidget extends StatelessWidget {
  BuildSliderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl})
      : super(key: key);
  String title;
  String description;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 0.5,
            offset: const Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      ),
      //margin: EdgeInsets.all(5.0),
      child: LayoutBuilder(
        builder: (context, constraint) => Stack(
          alignment: const Alignment(0, 2),
          children: [
            Container(
              width: constraint.maxWidth,
              height: constraint.maxHeight * 0.8,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  //borderRadius: BorderRadius.circular(radius),
                  gradient: LinearGradient(
                colors: [
                  ColorManager.white.withOpacity(0.1),
                  ColorManager.primary.withOpacity(0.15),
                  ColorManager.white.withOpacity(0.1),
                ],
                begin: Alignment.center,
                end: Alignment.topCenter,
                // stops: [
                //   // 0,
                //   // 0,
                // ]
              )),
              child: const Text(""),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: double.infinity,
                  width: constraint.maxWidth * 0.78,
                  child: LayoutBuilder(
                    builder:(context,cons)=> Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
//                                    When you’re interested in putting an offer in on a home, a buyer’s home inspection is one of the best ways to protect your investment.

                        SizedBox(
                         height: cons.maxHeight *0.25,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                constraint.maxWidth * 0.02,
                                constraint.maxHeight * 0.1,
                                constraint.maxWidth * 0.01,
                                constraint.maxHeight * 0.01),
                            child: BuildFittedText(text: title,textStyle: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(

                                textBaseline: TextBaseline.alphabetic),
                            maxLines: 1,),
                          ),
                        ),
                        SizedBox(

                          width: double.infinity,
                          height:cons.maxHeight *0.75 ,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                constraint.maxWidth * 0.03,
                                constraint.maxHeight * 0.1,
                                constraint.maxWidth * 0.03,
                                constraint.maxHeight * 0.03),
                            child:CustomText(textStyle:Theme.of(context).textTheme.bodyMedium!.copyWith(
                              textBaseline: TextBaseline.alphabetic,
                                fontSize: constraint.maxWidth *0.04

                            ),text: description,
                            maxLines: 4,
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: constraint.maxWidth * 0.15,
                  height: constraint.maxHeight *0.3,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Image(
                    image: AssetImage("assets/images/home2.png"),
                    fit: BoxFit.fill,
                  ),
                )

                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Color.fromARGB(200, 0, 0, 0),
                //           Color.fromARGB(0, 0, 0, 0)
                //         ],
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //       ),
                //     ),
                //     padding: EdgeInsets.symmetric(
                //         vertical: 10.0, horizontal: 20.0),
                //     child: Text(
                //       'No. ${imgList.indexOf(item)} image',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
