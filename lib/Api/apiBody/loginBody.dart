class loginBody{
  String email;
  String password;
  loginBody(this.email,this.password);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}