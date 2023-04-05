
import 'package:flutter/material.dart';
import 'package:snagging/presentation/widgets/text.dart';

import '../resources/colors_managers.dart';
import '../resources/image_assets.dart';
import 'custom_text.dart';

class BuildFeedbackWidget extends StatelessWidget {
 BuildFeedbackWidget(this.imageUrl,this.title,this.position,this.content,{Key? key}) : super(key: key);
  String imageUrl;
  String title;
  String position;
  String content;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(context,constraint)=> Container(
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
        child: Padding(
          padding: EdgeInsetsDirectional
              .fromSTEB(
            constraint.maxWidth * 0.03,
            constraint.maxHeight * 0.03,
            constraint.maxHeight * 0.03,
            constraint.maxWidth * 0.01,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height:
                constraint.maxHeight *
                    0.4,
                child: Row(
                  children: [
                    Container(
                      width: constraint
                          .maxWidth *
                          0.13,
                      height: constraint
                          .maxHeight *
                          0.3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  ImageAssets
                                      .ratePerson),
                              fit: BoxFit
                                  .fill),
                          shape: BoxShape
                              .circle),
                      //child: Image(image: AssetImage("assets/images/person.jpg",),fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional
                          .fromSTEB(
                          constraint
                              .maxWidth *
                              0.02,
                          0,
                          0,
                          0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        textBaseline:
                        TextBaseline
                            .alphabetic,
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .baseline,
                        children: [
                          BuildFittedText(
                            text: title,
                            textStyle: Theme.of(
                                context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                textBaseline:
                                TextBaseline.alphabetic),
                            maxLines: 1,
                          ),
                          BuildFittedText(
                            text:position,
                            textStyle: Theme.of(
                                context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                textBaseline:
                                TextBaseline.alphabetic),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height:
                constraint.maxHeight *
                    0.5,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .center,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .baseline,
                  textBaseline:
                  TextBaseline
                      .alphabetic,
                  children: [
                    CustomText(
                      text:content,
                      textStyle: Theme.of(
                          context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        textBaseline:
                        TextBaseline
                            .alphabetic,
                          fontSize: constraint.maxWidth *0.04

                      ),
                      maxLines: 3,
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}
