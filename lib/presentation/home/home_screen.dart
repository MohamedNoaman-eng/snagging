import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/bloc/home/home_cubit_states.dart';
import 'package:snagging/bloc/webview/webview_state.dart';
import 'package:snagging/presentation/resources/colors_managers.dart';
import 'package:snagging/presentation/resources/image_assets.dart';
import 'package:snagging/presentation/widgets/alertDialog.dart';

import 'package:snagging/presentation/widgets/carsouleSlider.dart';
import 'package:snagging/presentation/widgets/feedback_item.dart';
import 'package:snagging/presentation/widgets/loading_item.dart';
import 'package:snagging/presentation/widgets/package_carsoul.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Future _onRefresh() async {
    // monitor network fetch
    context.read<HomePageCubit>().getServices(context);
    // if failed,use refreshFailed()
  }



  @override
  void initState() {
    context.read<HomePageCubit>().getServices(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomePageCubit>();
    //context.read<HomePageCubit>().checkInternetConnection(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(

            resizeToAvoidBottomInset: false,
            body: RefreshIndicator(
              edgeOffset: 20,
              displacement: 20,
              strokeWidth: 3,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              color: Colors.red,
              onRefresh: _onRefresh,
              child: Stack(children: [
                BlocConsumer<HomePageCubit, HomeCubitStates>(
                    builder: (context, state) {
                      if (state is CheckInternetBookingErrorState) {
                        return showAwesomeDialog(context);
                      } else {
                        if (state is GetServicesErrorState ||
                            state is GetTestimonialsErrorState ||
                            state is GetPackagesErrorState) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(
                              child: Text(
                                "Something went wrong!",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          );
                        } else {
                          if (state is GetServicesLoadingState ||
                              state is GetTestimonialsLoadingState ||
                              state is GetPackagesLoadingState) {
                            return BuildLoadingWidget();
                          } else {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Stack(
                                  alignment: Alignment(0, 1.04),
                                  children: [
                                    Align(
                                      alignment: Alignment(-1, -1),
                                      child: SizedBox(
                                          //color: Colors.black,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          child: const Image(
                                            image: AssetImage(
                                                ImageAssets.gradient1Image),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment(1, -1),
                                      child: SizedBox(
                                          //color: Colors.black,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          child: const Image(
                                            image: AssetImage(
                                                ImageAssets.gradient2Image),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment(1, 1),
                                      child: SizedBox(
                                          //color: Colors.black,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: const Image(
                                            image: AssetImage(
                                                ImageAssets.gradient3Image),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Align(
                                      alignment: Alignment(-1, 0),
                                      child: SizedBox(
                                          //color: Colors.black,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: const Image(
                                            image: AssetImage(
                                                ImageAssets.gradient4Image),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    // ...Constant.homeList.map((e) =>  Align(
                                    //   alignment: e['alignment'],
                                    //   child: SizedBox(
                                    //     //color: Colors.black,
                                    //       width: MediaQuery.of(context).size.width * 0.5,
                                    //       height: MediaQuery.of(context).size.height * 0.25,
                                    //       child:  Image(
                                    //         image: AssetImage(e['image']),
                                    //         fit: BoxFit.fill,
                                    //       )),
                                    // ),),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: LayoutBuilder(
                                        builder: (context, constraint) =>
                                            Column(
                                          children: [
                                            //logo image
                                            SizedBox(
                                              width: double.infinity,
                                              height:
                                                  constraint.maxHeight * 0.08,
                                              child: const Center(
                                                child: Hero(
                                                  tag: "logo",
                                                  child: Image(
                                                    image: AssetImage(
                                                        ImageAssets.splashLogo),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            //service item
                                            SizedBox(
                                              width: double.infinity,
                                              height:
                                                  constraint.maxHeight * 0.25,
                                              child: Stack(
                                                  alignment:
                                                      const Alignment(0, -0.2),
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: LayoutBuilder(
                                                        builder: (context,
                                                                constraint) =>
                                                            Column(
                                                          children: [
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: constraint
                                                                      .maxHeight *
                                                                  0.8,
                                                              child: BuildCarouselSlider(
                                                                  bloc.serviceItems),
                                                            ),
                                                            SizedBox(
                                                              width: double
                                                                  .infinity,
                                                              height: constraint
                                                                      .maxHeight *
                                                                  0.2,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: bloc
                                                                    .serviceItems
                                                                    .asMap()
                                                                    .entries
                                                                    .map(
                                                                        (entry) {
                                                                  return Container(
                                                                    width: constraint
                                                                            .maxWidth *
                                                                        0.04,
                                                                    height: constraint
                                                                            .maxHeight *
                                                                        0.04,
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            constraint.maxHeight *
                                                                                0.01,
                                                                        horizontal:
                                                                            0),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: entry.key ==
                                                                                bloc.currentIndex
                                                                            ? ColorManager.sliderColor2.withOpacity(0.2)
                                                                            : ColorManager.sliderColor1),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            //review scroll
                                            SizedBox(
                                              width: double.infinity,
                                              height:
                                                  constraint.maxHeight * 0.25,
                                              child: LayoutBuilder(
                                                builder:
                                                    (context, constraint) =>
                                                        Column(
                                                  children: [
                                                    SizedBox(
                                                      width: double.infinity,
                                                      height:
                                                          constraint.maxHeight *
                                                              0.9,
                                                      child: BuildFeedbackItem(
                                                          bloc.testimonials),
                                                    ),
                                                    // SizedBox(
                                                    //   width: double.infinity,
                                                    //   height:
                                                    //   constraint.maxHeight * 0.2,
                                                    //   child: Row(
                                                    //     mainAxisAlignment:
                                                    //     MainAxisAlignment.center,
                                                    //     children: bloc.serviceItems
                                                    //         .asMap()
                                                    //         .entries
                                                    //         .map((entry) {
                                                    //       return GestureDetector(
                                                    //         onTap: () => bloc
                                                    //             .controller
                                                    //             .animateToPage(
                                                    //             entry.key),
                                                    //         child: Container(
                                                    //           width: constraint
                                                    //               .maxWidth *
                                                    //               0.04,
                                                    //           height: constraint
                                                    //               .maxHeight *
                                                    //               0.04,
                                                    //           margin: EdgeInsets.symmetric(
                                                    //               vertical: constraint
                                                    //                   .maxHeight *
                                                    //                   0.01,
                                                    //               horizontal: 0),
                                                    //           decoration: BoxDecoration(
                                                    //               shape:
                                                    //               BoxShape.circle,
                                                    //               color: entry.key ==
                                                    //                   bloc
                                                    //                       .currentIndex
                                                    //                   ? ColorManager
                                                    //                   .sliderColor2
                                                    //                   .withOpacity(
                                                    //                   0.2)
                                                    //                   : ColorManager
                                                    //                   .sliderColor1),
                                                    //         ),
                                                    //       );
                                                    //     }).toList(),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            //packages
                                            SizedBox(
                                              width: double.infinity,
                                              height:
                                                  constraint.maxHeight * 0.3,
                                              child: LayoutBuilder(
                                                builder:
                                                    (context, constraint) =>
                                                        SizedBox(
                                                  width: double.infinity,
                                                  height: constraint.maxHeight,
                                                  child: BuildPackageCarsoul(
                                                      bloc.packageItems),
                                                ),
                                              ),
                                            ),
                                            //working process
                                            // SizedBox(
                                            //   //width: constraint.maxWidth,
                                            //   height: constraint.maxHeight * 0.18,
                                            //   child: Container(
                                            //     height: double.infinity,
                                            //     width: constraint.maxWidth * 0.92,
                                            //     decoration: getDecoration(),
                                            //     child: LayoutBuilder(
                                            //       builder: (context, constraint) => Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment.center,
                                            //         children: [
                                            //           SizedBox(
                                            //             width: double.infinity,
                                            //             height: constraint.maxHeight * 0.35,
                                            //             child: Padding(
                                            //                 padding: EdgeInsetsDirectional
                                            //                     .fromSTEB(
                                            //                         0,
                                            //                         constraint.maxHeight *
                                            //                             0.1,
                                            //                         0,
                                            //                         0),
                                            //                 child: BuildFittedText(
                                            //                   text: AppString.processText,
                                            //                   textStyle: Theme.of(context)
                                            //                       .textTheme
                                            //                       .headlineLarge!
                                            //                       .copyWith(
                                            //                           fontSize: constraint
                                            //                                   .maxHeight *
                                            //                               0.12),
                                            //                   maxLines: 1,
                                            //                   textAlign: TextAlign.center,
                                            //                 )),
                                            //           ),
                                            //           SizedBox(
                                            //             height: constraint.maxHeight * 0.65,
                                            //             width: constraint.maxWidth * 0.99,
                                            //             child: Padding(
                                            //               padding: EdgeInsetsDirectional.only(
                                            //                   start:
                                            //                       constraint.maxWidth * 0.01,
                                            //                   top: 0,
                                            //                   end: constraint.maxWidth * 0.01,
                                            //                   bottom:
                                            //                       constraint.maxHeight * 0.1),
                                            //               child: Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment.spaceAround,
                                            //                 children: [
                                            //                   ...bloc.processList.map(
                                            //                       (item) => BuildCircleImage(
                                            //                             item['id'],
                                            //                             item['image'],
                                            //                             item['title'],
                                            //                             double.infinity,
                                            //                           ))
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            //feedback item
                                            // SizedBox(
                                            //   width: constraint.maxWidth * 0.92,
                                            //   height: constraint.maxHeight * 0.4,
                                            //   child: ListView.builder(
                                            //     physics: BouncingScrollPhysics(),
                                            //     itemBuilder: (context, index) => Padding(
                                            //       padding: EdgeInsetsDirectional.fromSTEB(
                                            //           0, constraint.maxHeight * 0.01, 0, 0),
                                            //       child: SizedBox(
                                            //         width: constraint.maxWidth * 0.92,
                                            //         height: constraint.maxHeight * 0.2,
                                            //         child: Container(
                                            //             height: double.infinity,
                                            //             width: constraint.maxWidth * 0.92,
                                            //             decoration: getDecoration(),
                                            //             child: LayoutBuilder(
                                            //               builder: (context, constraint) =>
                                            //                   ,
                                            //             )),
                                            //       ),
                                            //     ),
                                            //     itemCount: bloc.testimonials.length,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            );
                          }
                        }
                      }
                    },
                    listener: (context, state) {}),
                ListView(),
              ]),
            )
        ));
  }
}
