class RegisterBody{
  final String email;
  final String phone_number;
  final String name;
  final String password;

  RegisterBody(this.email, this.phone_number, this.name, this.password);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['phone_number'] = phone_number;
    _data['name'] = name;
    _data['password'] = password;
    return _data;
  }
}