// import 'package:json_annotation/json_annotation.dart';
// part 'response.g.dart';
// //general response class
// @JsonSerializable()
// class BaseResponse{
//   @JsonKey(name: "status")
//   int? statusCode;
//   @JsonKey(name: "message")
//   String? message;
// }
// //auth response classes
// @JsonSerializable()
// class CustomerResponse{
//   @JsonKey(name: "id")
//   String? id;
//   @JsonKey(name: "name")
//   String? name;
//   @JsonKey(name: "numOfNotifications")
//   int? numOfNotifications;
//   CustomerResponse(this.id,this.name,this.numOfNotifications);
//   //from json
//   factory CustomerResponse.fromJson(Map<String,dynamic> json)=>_$CustomerResponseFromJson(json);
//   //to json
//   Map<String,dynamic> toJson() =>_$CustomerResponseToJson(this);
// }
// @JsonSerializable()
// class ContentResponse{
//   @JsonKey(name: "phone")
//   String? phone;
//   @JsonKey(name: "email")
//   String? email;
//   @JsonKey(name: "link")
//   String? link;
//   ContentResponse(this.phone,this.email,this.link);
//   //from json
//   factory ContentResponse.fromJson(Map<String,dynamic> json)=>_$ContentResponseFromJson(json);
//   //to json
//   Map<String,dynamic> toJson() =>_$ContentResponseToJson(this);
// }
// @JsonSerializable()
// class AuthenticationResponse extends BaseResponse{
//   @JsonKey(name: "customer")
//   CustomerResponse? customerResponse;
//   @JsonKey(name: "content")
//   ContentResponse? contentResponse;
//   AuthenticationResponse(this.customerResponse,this.contentResponse);
//   //from json
//   factory AuthenticationResponse.fromJson(Map<String,dynamic> json)=>_$AuthenticationResponseFromJson(json);
//   //to json
//   Map<String,dynamic> toJson() =>_$AuthenticationResponseToJson(this);
// }