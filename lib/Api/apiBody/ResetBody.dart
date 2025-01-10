
class ResetBody{
  String phone_number;
  String code;
  String password;
  ResetBody(this.phone_number,this.password,this.code);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone_number'] = phone_number;
    _data['password'] = password;
    _data['code'] = code;
    return _data;
  }
}