// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import '../resources/app_constants.dart';
// import '../resources/colors_managers.dart';
// import '../resources/image_assets.dart';
// import '../resources/ruotes.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   Timer? _timer;
//
//   _startDelay() {
//     Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
//   }
//
//   _goNext() {
//     Navigator.pushReplacementNamed(context, Routes.homeRoute);
//   }
//
//   late AnimationController _controller;
//   late Animation<Alignment> _topAlignmentAnimation;
//   late Animation<Alignment> _bottomAlignmentAnimation;
//
//   @override
//   void initState() {
//     _startDelay();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     _topAlignmentAnimation = TweenSequence<Alignment>([
//       TweenSequenceItem<Alignment>(
//         tween:
//             Tween<Alignment>(begin: Alignment(-1,-1), end: Alignment(1,-1)),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.topRight, end: Alignment.bottomRight),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.bottomRight, end: Alignment.bottomLeft),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.bottomLeft, end: Alignment.topLeft),
//         weight: 1,
//       )
//     ]).animate(_controller);
//     _bottomAlignmentAnimation = TweenSequence<Alignment>([
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.bottomRight, end: Alignment.bottomLeft),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.bottomLeft, end: Alignment.topLeft),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween:
//             Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
//         weight: 1,
//       ),
//       TweenSequenceItem<Alignment>(
//         tween: Tween<Alignment>(
//             begin: Alignment.topRight, end: Alignment.bottomRight),
//         weight: 1,
//       )
//     ]).animate(_controller);
//     _controller.repeat();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           //alignment: Alignment(-1,0),
//           children: [
//             AnimatedBuilder(animation: _controller, builder: (context,_)=>Container(
//             width: double.infinity,
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 //borderRadius: BorderRadius.circular(250),
//                   gradient: SweepGradient(
//                       colors: [
//                         ColorManager.white,
//                         ColorManager.color1.withOpacity(0.1),
//                        Colors.white
//                       ],
//                     center: _topAlignmentAnimation.value,
//
//
//
//                     // stops: [
//                     //   0.05,
//                     //   0.5,
//                     //   0.5                   ]
//                   )
//               ),
//
//
//             )),
//             const Center(
//               child: Hero(
//                 tag: "logo",
//                 child: Image(
//                   image: AssetImage(ImageAssets.splashLogo),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _controller.dispose();
//     super.dispose();
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/bloc/home/home_cubit.dart';

import 'package:snagging/presentation/resources/image_assets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snagging/presentation/root_screen/root_screen.dart';
import 'package:snagging/presentation/s.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  void initState() {
    // _startDelay();
    startAnimation();
    super.initState();
  }

  bool animate = false;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    //Navigator.pushReplacementNamed(context, Routes.homeRoute);
    //context.read<HomePageCubit>().getServices(context);
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
            child: RootScreen(),
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 200)),
        (route) => false);
  }

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder:(context,cons)=> Stack(children: [


            AnimatedSplashScreen(
              splash: const Image(
                image: AssetImage(ImageAssets.splashLogo),
                fit: BoxFit.fill,
              ),
              disableNavigation: true,
              splashIconSize: cons.maxWidth *0.15,
              splashTransition: SplashTransition.fadeTransition,
              animationDuration: const Duration(seconds: 1),
              nextScreen: TestScreen(),
            ),

            AnimatedPositioned(
                top: animate ? 0 : -30,
                left: animate ? 0 : -30,
                duration: Duration(milliseconds: 1600),
                child: const SizedBox(
                  child: Image(
                    image: AssetImage(ImageAssets.gradient1Image),
                    fit: BoxFit.cover,
                  ),
                )),
            AnimatedPositioned(
                top: animate ? 0 : -30,
                right: animate ? 0 : -30,
                duration: Duration(milliseconds: 1600),
                child: const SizedBox(
                  child: Image(
                    image: AssetImage(ImageAssets.gradient2Image),
                    fit: BoxFit.cover,
                  ),
                )),
            AnimatedPositioned(
                top: -50,
                left: animate ? 0 : -30,
                width: cons.maxWidth * 0.5,
                duration: Duration(milliseconds: 1600),
                child: const SizedBox(
                  child: Image(
                    image: AssetImage(ImageAssets.gradient4Image),
                    fit: BoxFit.cover,
                  ),
                )),
            AnimatedPositioned(
                width: cons.maxWidth * 0.5,
                bottom: animate ? 0 : -30,
                right: animate ? 0 : -30,
                duration: Duration(milliseconds: 1600),
                child: const SizedBox(
                  child: Image(
                    image: AssetImage(ImageAssets.gradient3Image),
                    fit: BoxFit.cover,
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
