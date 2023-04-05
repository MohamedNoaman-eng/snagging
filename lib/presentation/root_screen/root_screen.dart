import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/bloc/home/home_cubit_states.dart';
import 'package:snagging/presentation/booking/booking_screen.dart';
import 'package:snagging/presentation/home/home_screen.dart';
import 'package:snagging/presentation/login/login_screen.dart';
import 'package:snagging/presentation/widgets/text.dart';

import '../../bloc/webview/webview_booking.dart';
import '../../bloc/webview/webview_login.dart';
import '../resources/colors_managers.dart';
import '../resources/image_assets.dart';
import '../widgets/custom_text.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {


  List<Widget> pages = [LoginScreen(), HomeScreen(), BookingScreen()];

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomePageCubit>();
    return BlocConsumer<HomePageCubit, HomeCubitStates>(
      builder: ((context, state) =>
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
              alignment: Alignment.bottomCenter,
                  children: [
                pages[bloc.pageIndex],
                LayoutBuilder(
                  builder: (context, cons) => Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      cons.maxWidth*0.05,
                      0,
                      cons.maxWidth*0.05,
                      cons.maxHeight *0.02,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: cons.maxHeight *0.133,
                      child: Stack(
                            alignment: Alignment.bottomCenter,
                          children: [

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorManager.navColor),
                          height: cons.maxHeight *0.085,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                  bloc.changePageIndex(0);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Expanded(
                                         child: Image(
                                           image: AssetImage(ImageAssets.loginImage),
                                           fit: BoxFit.fill,
                                         ),
                                       ),
                                      CustomText(
                                          text: "Login",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: Colors.white,
                                              fontSize: (cons.maxHeight *0.085) *0.223,
                                              //fontWeight: FontWeight.bold
                                          ))
                                    ],
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    //context.read<WebViewBookingCubit>().checkInternetConnection();
                                   bloc.changePageIndex(2);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(

                                        child: Image(
                                          image: AssetImage(ImageAssets.bookingImage),
                                          fit: BoxFit.fill,
                                        ),
                                       // height:(cons.maxHeight *0.085) *0.223 ,
                                      ),
                                      CustomText(
                                          text: "Booking",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(color: Colors.white,
                                              fontSize: (cons.maxHeight *0.085) *0.2,
                                            //fontWeight: FontWeight.bold
                                          ))
                                    ],
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,

                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: TextButton(
                              onPressed: () {
                                //context.read<HomePageCubit>().getServices(context);
                                bloc.changePageIndex(1);
                              },
                              child: CircleAvatar(
                                radius: cons.maxHeight *0.0375,
                                backgroundColor: ColorManager.white,
                                child: CircleAvatar(
                                    radius: cons.maxHeight * 0.033,
                                    backgroundColor: ColorManager.navColor,
                                    child: Image(
                                      image: AssetImage(ImageAssets.homeImage),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                        ),

                      ]),
                    ),
                  ),
                )
              ]),
            ),
          )),
      listener: (context, state) {},
    );
  }
}
