
class AuthResponse {
  String? message;
  bool success=false;
  AuthResponse({this.message});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    if(json['message'])
      {
    message = json['message'];
    success=true;
      }
     else
       {
         success=false;
       }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}