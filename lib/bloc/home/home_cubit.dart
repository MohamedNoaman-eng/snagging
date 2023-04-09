



import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:snagging/bloc/home/home_cubit_states.dart';
import 'package:snagging/data/models/service_item.dart';
import 'package:snagging/data/models/testimonials_item.dart';
import 'package:snagging/network/network_info.dart';
import 'package:snagging/network/remote/api_endpoints.dart';
import 'package:snagging/network/remote/api_services.dart';
import 'package:snagging/presentation/resources/image_assets.dart';

import '../../data/models/package.dart';
import '../../presentation/booking/booking_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/login/login_screen.dart';
import '../../presentation/widgets/alertDialog.dart';


class HomePageCubit extends Cubit<HomeCubitStates>{
  List<Widget> pages = [LoginScreen(), HomeScreen(), BookingScreen()];

  HomePageCubit(): super(InitialHomeState());
  int pageIndex = 1;
  void changePageIndex(index){
    pageIndex = index;
    emit(ChangePageIndexState());
  }
  ApiService _apiService  = ApiService(NetworkInfoImp(InternetConnectionChecker()) );
  List<ServiceItem> serviceItems = [];
  List<PackageItem> packageItems = [];
  void getServices(BuildContext context){
    serviceItems = [];
   //checkInternetConnection();
    emit(GetServicesLoadingState());
    _apiService.getDate(endPoint: EndPoints.servicesEPoint,context: context).then((value){
      List li = value?.data["services"] as List;
      li.forEach((element) {
        serviceItems.add(ServiceItem.fromMap(element));
      });
      // log("${li.length}");
      emit(GetServicesSuccessfullyState());
      getTestimonials(context);

    }).catchError((onError){
      emit(GetServicesErrorState(onError.toString()));
    });
  }
  void getPackages(BuildContext context){
    packageItems = [];
    //checkInternetConnection();
    emit(GetPackagesLoadingState());
    _apiService.getDate(endPoint: EndPoints.packageEPoint,context: context).then((value){
      List li = value?.data["packages"] as List;
      li.forEach((element) {
        packageItems.add(PackageItem.fromMap(element));
      });
      emit(GetPackagesSuccessfullyState());

    }).catchError((onError){
      emit(GetPackagesErrorState(onError.toString()));
    });
  }
  bool isDisabled = false;
  void disabledIcon(bool value){
    emit(ChangeDisabledStateT());
    isDisabled = value;
    emit(ChangeDisabledState());
  }
  List<TestimonialsItem> testimonials = [];
  void getTestimonials(BuildContext context){
    testimonials = [];
    emit(GetTestimonialsLoadingState());
    _apiService.getDate(endPoint: EndPoints.testimonialsEPoint,context: context).then((value){
      List li = value?.data["testimonials"] as List;
      li.forEach((element) {
        testimonials.add(TestimonialsItem.fromMap(element));
      });
      emit(GetTestimonialsSuccessfullyState());
      getPackages(context);
    }).catchError((onError){
      emit(GetTestimonialsErrorState(onError.toString()));
    });
  }
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<Map<String,dynamic>> processList = [
    {
      'id':01,
      'image':ImageAssets.group1Image,
      'title': "Consult Our Expert"
    },
    {
      'id':02,
      'image':ImageAssets.group2Image,
      'title': "Choose Your Plan"
    },
    {
      'id':03,
      'image':ImageAssets.group3Image,
      'title': "Finalize Your Plan"
    },
  ];
  bool display = true;
  changeVisible(bool value){
    emit(InitialHomeState());
    display = value;
    emit(ChangeIndexHomeState());
  }
  int currentIndex = 0;
  onChanged(int index){
    emit(InitialHomeState());
    currentIndex = index;
    emit(ChangeIndexHomeState());

  }

  final CarouselController controller = CarouselController();
  void checkInternetConnection(BuildContext context) async{
    emit(InternetConnectionLoadingState());
    if(await NetworkInfoImp(InternetConnectionChecker()).isConnect){
      emit(InternetConnectionSuccessState());
    }else {
      showAwesomeDialog(context);
      emit(InternetConnectionFailedState());

    }
  }
}