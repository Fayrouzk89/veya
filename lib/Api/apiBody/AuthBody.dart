
class AuthBody{
  String phone_number;
  String code;
  AuthBody(this.code,this.phone_number);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone_number'] = phone_number;
    _data['code'] = code;
    return _data;
  }
}