

import '../../network/app_api.dart';

import '../../network/network_info.dart';
import '../../network/request/request.dart';

class Repository{

   final NetworkInfo _networkInfo;
   AppServicesClient appServicesClient;
   Repository(this.appServicesClient,this._networkInfo);

  Future login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnect){
      try{
        //it is save to call api
        final response = await appServicesClient.login(loginRequest.email,loginRequest.password);
        if(response.statusCode == 200){
          //success
          // return either right
          return response;
        }else{
          //failure
          //return either left
          //return ApiStatus.FAILURE;
        }
      }catch(error){
        //return ErrorHandler.handel(error).failure;
      }
    }else{
      //internet error
      //return either left
      //return DataSources.NO_INTERNET_CONNECTION.getFailure();
    }
  }


}