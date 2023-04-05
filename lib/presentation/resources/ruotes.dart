import 'package:flutter/material.dart';
import 'package:snagging/presentation/resources/string_manager.dart';
import 'package:snagging/presentation/root_screen/root_screen.dart';



import '../home/home_screen.dart';
import '../splash/splash_screen.dart';

class Routes{
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String detailsRoute = '/details';
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String rootRoute = '/root';
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context)=>SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context)=>HomeScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context)=>RootScreen());

      // case Routes.forgetPasswordRoute:
      //   return MaterialPageRoute(builder: (context)=>ForgetPasswordScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context)=>SplashScreen());
      default:
        return undefinedRoute();
    }

  }

  static Route undefinedRoute() {
    return MaterialPageRoute(builder: (context)=>Scaffold(
      appBar: AppBar(title: const Text(AppString.noRoute),),
    ));
  }
}