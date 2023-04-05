import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/presentation/widgets/text.dart';

import '../resources/colors_managers.dart';
import '../resources/image_assets.dart';
import 'custom_text.dart';

class BuildPackageWidget extends StatelessWidget {
  BuildPackageWidget(this.title, this.price, this.notes);

  String title;
  String price;
  String notes;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
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
          padding: EdgeInsetsDirectional.fromSTEB(
            constraint.maxWidth * 0.04,
            constraint.maxHeight * 0.03,
            constraint.maxHeight * 0.04,
            constraint.maxWidth * 0.0,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: constraint.maxHeight * 0.15,
                child: BuildFittedText(
                  text: title,
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(textBaseline: TextBaseline.alphabetic),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  height: constraint.maxHeight * 0.15,
                  child: Text("")),
              SizedBox(
                  width: constraint.maxWidth * 0.99,
                  height: constraint.maxHeight * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CustomText(
                        text: notes,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: constraint.maxWidth *0.04
                        ),
                        maxLines: 4,
                      ),
                    ],
                  )
              ),
              Padding(
                padding:  EdgeInsetsDirectional.fromSTEB(0, constraint.maxHeight *0.05, 0, 0),
                child: SizedBox(
                    width: double.infinity,
                    height: constraint.maxHeight * 0.14,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.navColor,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                      ),
                      width: constraint.maxWidth * 0.7,
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            context.read<HomePageCubit>().changePageIndex(2);
                          },
                          child: BuildFittedText(
                              text: "Book Now",
                              textStyle:
                                  Theme.of(context).textTheme.titleLarge!.copyWith(
                                        //textBaseline: TextBaseline.alphabetic,
                                        color: ColorManager.white,
                                      )),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
