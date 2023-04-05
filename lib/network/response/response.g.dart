// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'response.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
//   ..statusCode = json['status'] as int?
//   ..message = json['message'] as String?;
//
// Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
//     <String, dynamic>{
//       'status': instance.statusCode,
//       'message': instance.message,
//     };
//
// CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
//     CustomerResponse(
//       json['id'] as String?,
//       json['name'] as String?,
//       json['numOfNotifications'] as int?,
//     );
//
// Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'numOfNotifications': instance.numOfNotifications,
//     };
//
// ContentResponse _$ContentResponseFromJson(Map<String, dynamic> json) =>
//     ContentResponse(
//       json['phone'] as String?,
//       json['email'] as String?,
//       json['link'] as String?,
//     );
//
// Map<String, dynamic> _$ContentResponseToJson(ContentResponse instance) =>
//     <String, dynamic>{
//       'phone': instance.phone,
//       'email': instance.email,
//       'link': instance.link,
//     };
//
// AuthenticationResponse _$AuthenticationResponseFromJson(
//         Map<String, dynamic> json) =>
//     AuthenticationResponse(
//       json['customer'] == null
//           ? null
//           : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
//       json['content'] == null
//           ? null
//           : ContentResponse.fromJson(json['content'] as Map<String, dynamic>),
//     )
//       ..statusCode = json['status'] as int?
//       ..message = json['message'] as String?;
//
// Map<String, dynamic> _$AuthenticationResponseToJson(
//         AuthenticationResponse instance) =>
//     <String, dynamic>{
//       'status': instance.statusCode,
//       'message': instance.message,
//       'customer': instance.customerResponse,
//       'content': instance.contentResponse,
//     };
