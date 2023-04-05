import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnect;
}
class NetworkInfoImp implements NetworkInfo{
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImp(this._internetConnectionChecker);
  @override

  Future<bool> get isConnect => _internetConnectionChecker.hasConnection;

}