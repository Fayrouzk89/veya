import 'dart:io';

class UserInfo {
  UserInfo({
    required this.id,
    required this.user_name,
    required this.email,
    required this.mobile,
    required this.password,

  });
  int? id;
  String? user_name;
  String? email;
  String? mobile;
  String? password;
  String refresh="";
  String access="";

  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;

    return _data;
  }
}