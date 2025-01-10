
import 'VeraUser.dart';

class LoginResponse {
  bool success=false;
  String? token;
  VeraUser? user;
  String? message;
  LoginResponse({this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if(json['token']!=null)
      {
        success=true;
    token = json['token'];
    user = json['user'] != null ? new VeraUser.fromJson(json['user']) : null;
      }
    else
      {
        success=false;
        message = json['message']??"";
      }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

}