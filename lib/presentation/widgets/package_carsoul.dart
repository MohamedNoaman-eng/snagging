import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:snagging/data/models/package.dart';
import 'package:snagging/presentation/resources/colors_managers.dart';
import 'package:snagging/presentation/widgets/clipper.dart';

import 'package:snagging/presentation/widgets/package_widget.dart';
import 'package:snagging/presentation/widgets/text.dart';

class BuildPackageCarsoul extends StatelessWidget {
  List<PackageItem> packages;

  BuildPackageCarsoul(this.packages, {super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        initialPage: 0,
        aspectRatio: 0.1,
        reverse: false,
        //padEnds:false,
        // onPageChanged: (index, reason) {
        //   context.read<HomePageCubit>().onChanged(index);
        // },
        viewportFraction: .8,
        enableInfiniteScroll: false,

        enlargeCenterPage: true,
      ),
      items: packages
          .map(
            (item) => LayoutBuilder(
              builder:(context,ctx)=> Stack(alignment: Alignment(1, -0.6), children: [
                Align(
                  alignment: Alignment(1.001, -0.3),
                  child: ClipPath(
                    clipper: ClipClipper(),
                    child: Container(
                      width: ctx.maxWidth*0.1,
                      height: ctx.maxHeight*0.1,
                      color: ColorManager.navColor,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(0, 0, ctx.maxWidth*0.08, 0),
                  child: BuildPackageWidget(
                    item.name,
                    item.price,
                    item.notes,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorManager.navColor, borderRadius: BorderRadius.circular(5)),
                  width: ctx.maxWidth *0.6,
                  height: ctx.maxHeight *0.15,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildFittedText(
                          text: "${item.price} AED", textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.white,
                          fontSize: ctx.maxWidth *0.1,
                          fontWeight: FontWeight.bold,

                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )
          .toList(),
    );
  }
}
