// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final DataLogin dataLogin;

  LoginModel({
    required this.dataLogin,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        dataLogin: DataLogin.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": dataLogin.toJson(),
      };
}

class DataLogin {
  final String accessToken;
  final bool? isRegistered;
  final String email;
  final String? phoneNumber;
  final String? provider;
  final String username;
  final bool? linkedWithGoogle;
  final bool? isOtpVerified;
  final bool? isWebPinSupplied;

  DataLogin({
    required this.accessToken,
    this.isRegistered,
    required this.email,
    this.phoneNumber,
    this.provider,
    required this.username,
    this.linkedWithGoogle,
    this.isOtpVerified,
    this.isWebPinSupplied,
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        accessToken: json["access_token"],
        isRegistered: json["is_registered"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        provider: json["provider"],
        username: json["username"],
        linkedWithGoogle: json["linkedWithGoogle"],
        isOtpVerified: json["isOtpVerified"],
        isWebPinSupplied: json["isWebPinSupplied"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "is_registered": isRegistered,
        "email": email,
        "phoneNumber": phoneNumber,
        "provider": provider,
        "username": username,
        "linkedWithGoogle": linkedWithGoogle,
        "isOtpVerified": isOtpVerified,
        "isWebPinSupplied": isWebPinSupplied,
      };
}
