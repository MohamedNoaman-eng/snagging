
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String prefKey = "prefKey";
const String onBoardingKey = "onBoardingKey";
const String loginKey = "loginKey";

class AppPreferences{
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getLang ()async{
    String? language = _sharedPreferences.getString(prefKey);
    if(language !=null &&language.isNotEmpty){
      return language;
    }else{
      return LanguageType.ENGLISH.getLang();
    }
  }
  Future<void> setOnBoarding (bool value)async{
    await _sharedPreferences.setBool(onBoardingKey, value);
  }
  Future<bool> getOnBoarding ()async{
    bool? onBoarding = _sharedPreferences.getBool(onBoardingKey);
    if(onBoarding !=null){
      return onBoarding;
    }else{
      return false;
    }
  }
  Future<void> setLogin (bool value)async{
    await _sharedPreferences.setBool(loginKey, value);
  }
  Future<bool> getLogin ()async{
    bool? login = _sharedPreferences.getBool(loginKey);
    if(login !=null){
      return login;
    }else{
      return false;
    }
  }
}