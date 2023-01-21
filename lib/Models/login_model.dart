import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });
  late final bool status;
  late final String message;
  late final String token;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    return _data;
  }
}
