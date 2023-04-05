// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tutapp/app/app_pref.dart';
// import 'package:tutapp/data/data_source/remote_data_source.dart';
// import 'package:tutapp/data/network/app_api.dart';
// import 'package:tutapp/data/network/dio.dart';
// import 'package:tutapp/data/network/network_info.dart';
// import 'package:tutapp/data/repository/repository_imp.dart';
// import 'package:tutapp/domain/repository/repository.dart';
// import 'package:tutapp/domain/use_cases/login_usecase.dart';
// import 'package:tutapp/presentation/login/viewModel/login_view_model.dart';
//
// final instance = GetIt.instance;
// Future<void> initAppModule() async{
//   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//
//   instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
//
//   //AppPreferences appPreferences = AppPreferences(sharedPreferences);
//
//   instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));
//
//   instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
//
//
//   instance.registerLazySingleton<DioFactory>(() => DioFactory(instance<AppPreferences>()));
//
//   Dio dio = await instance<DioFactory>().getDio();
//
//   instance.registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));
//
//   instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance<AppServicesClient>()));
//
//   instance.registerLazySingleton<Repository>(() => RepositoryImp(instance(), instance()));
//
// }
// initLoginModule(){
//   if(!GetIt.I.isRegistered<LoginUseCase>()){
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
//
//
//
//
//
// }